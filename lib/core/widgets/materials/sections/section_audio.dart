import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';
import '../base_section_title.dart';

class SectionAudio extends StatefulWidget {
  final String title;
  final List<String> instructions;
  final List<String>? audioFiles;
  final List<String>? questions;
  final double fontScale;

  const SectionAudio({
    super.key,
    required this.title,
    this.instructions = const [],
    this.audioFiles,
    this.questions,
    this.fontScale = 1.0,
  });

  @override
  State<SectionAudio> createState() => _SectionAudioState();
}

class _SectionAudioState extends State<SectionAudio> {
  final Map<String, AudioPlayer> _audioPlayers = {};
  final Map<String, bool> _isPlaying = {};
  final Map<String, Duration> _duration = {};
  final Map<String, Duration> _position = {};

  @override
  void initState() {
    super.initState();
    _initializeAudioPlayers();
  }

  @override
  void dispose() {
    for (final player in _audioPlayers.values) {
      player.dispose();
    }
    super.dispose();
  }

  void _initializeAudioPlayers() {
    if (widget.audioFiles != null) {
      for (final audioFile in widget.audioFiles!) {
        final player = AudioPlayer();
        _audioPlayers[audioFile] = player;
        _isPlaying[audioFile] = false;
        _duration[audioFile] = Duration.zero;
        _position[audioFile] = Duration.zero;

        // Listen to player state changes
        player.onPlayerStateChanged.listen((state) {
          if (mounted) {
            setState(() {
              _isPlaying[audioFile] = state == PlayerState.playing;
            });
          }
        });

        // Listen to duration changes
        player.onDurationChanged.listen((duration) {
          if (mounted) {
            setState(() {
              _duration[audioFile] = duration;
            });
          }
        });

        // Listen to position changes
        player.onPositionChanged.listen((position) {
          if (mounted) {
            setState(() {
              _position[audioFile] = position;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseSectionTitle(title: widget.title),
        const SizedBox(height: AppDimensions.spaceM),

        // Instructions
        if (widget.instructions.isNotEmpty) ...[
          for (final instruction in widget.instructions) ...[
            _buildInstruction(instruction),
            const SizedBox(height: AppDimensions.spaceS),
          ],
          const SizedBox(height: AppDimensions.spaceM),
        ],

        // Audio players
        if (widget.audioFiles != null && widget.audioFiles!.isNotEmpty) ...[
          for (int i = 0; i < widget.audioFiles!.length; i++) ...[
            _buildAudioPlayer(widget.audioFiles![i], i + 1),
            const SizedBox(height: AppDimensions.spaceS),
          ],
          const SizedBox(height: AppDimensions.spaceM),
        ],

        // Questions
        if (widget.questions != null && widget.questions!.isNotEmpty) ...[
          for (final question in widget.questions!) ...[
            _buildQuestion(question),
            const SizedBox(height: AppDimensions.spaceS),
          ],
        ],
      ],
    );
  }

  Future<void> _playPause(String audioFile) async {
    final player = _audioPlayers[audioFile];
    if (player == null) return;

    if (_isPlaying[audioFile] == true) {
      await player.pause();
    } else {
      // Stop all other players first
      for (final otherPlayer in _audioPlayers.values) {
        if (otherPlayer != player) {
          await otherPlayer.stop();
        }
      }

      // Build the asset path
      final assetPath =
          'materials/materi-istima/${_getChapterFromAudioFile(audioFile)}/$audioFile';
      await player.play(AssetSource(assetPath));
    }
  }

  String _getChapterFromAudioFile(String audioFile) {
    if (audioFile.contains('bab 1')) return 'bab 1';
    if (audioFile.contains('bab 2')) return 'bab 2';
    if (audioFile.contains('bab 3')) return 'bab 3';
    return 'bab 1'; // default
  }

  Widget _buildAudioPlayer(String audioFile, int index) {
    final isPlaying = _isPlaying[audioFile] ?? false;
    final duration = _duration[audioFile] ?? Duration.zero;
    final position = _position[audioFile] ?? Duration.zero;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha((AppColors.alpha05 * 255).round()),
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        border: Border.all(
          color: AppColors.primary.withAlpha((AppColors.alpha20 * 255).round()),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Audio file title
          Text(
            'Audio $index',
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize:
                  (AppTextStyles.bodyLarge.fontSize ?? 16) * widget.fontScale,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppDimensions.spaceS),

          // Player controls
          Row(
            children: [
              // Play/Pause button
              IconButton(
                onPressed: () => _playPause(audioFile),
                icon: Icon(
                  isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  size: AppDimensions.iconXL,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceS),

              // Progress and time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress bar
                    LinearProgressIndicator(
                      value: duration.inMilliseconds > 0
                          ? position.inMilliseconds / duration.inMilliseconds
                          : 0.0,
                      backgroundColor: AppColors.borderLight,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spaceXS),

                    // Time display
                    Text(
                      '${_formatDuration(position)} / ${_formatDuration(duration)}',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize:
                            (AppTextStyles.bodySmall.fontSize ?? 12) *
                            widget.fontScale,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  Widget _buildInstruction(String instruction) {
    final hasArabic = _hasArabic(instruction);
    final hasLatinOrDigit = _hasLatinOrDigit(instruction);
    final isPureArabic = hasArabic && !hasLatinOrDigit;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.info.withAlpha((AppColors.alpha05 * 255).round()),
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        border: Border.all(
          color: AppColors.info.withAlpha((AppColors.alpha20 * 255).round()),
        ),
      ),
      child: Text(
        instruction,
        style: isPureArabic
            ? AppTextStyles.arabicText.copyWith(
                fontSize:
                    (AppTextStyles.arabicText.fontSize ?? 18) *
                    widget.fontScale,
              )
            : AppTextStyles.bodyMedium.copyWith(
                fontSize:
                    (AppTextStyles.bodyMedium.fontSize ?? 14) *
                    widget.fontScale,
              ),
        textDirection: isPureArabic ? TextDirection.rtl : TextDirection.ltr,
        textAlign: isPureArabic ? TextAlign.right : TextAlign.left,
      ),
    );
  }

  Widget _buildQuestion(String question) {
    final hasArabic = _hasArabic(question);
    final hasLatinOrDigit = _hasLatinOrDigit(question);
    final isPureArabic = hasArabic && !hasLatinOrDigit;

    return Padding(
      padding: const EdgeInsets.only(left: AppDimensions.paddingM),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          question,
          style: isPureArabic
              ? AppTextStyles.arabicText.copyWith(
                  fontSize:
                      (AppTextStyles.arabicText.fontSize ?? 18) *
                      widget.fontScale,
                )
              : AppTextStyles.bodyMedium.copyWith(
                  fontSize:
                      (AppTextStyles.bodyMedium.fontSize ?? 14) *
                      widget.fontScale,
                ),
          textDirection: isPureArabic ? TextDirection.rtl : TextDirection.ltr,
          textAlign: isPureArabic ? TextAlign.right : TextAlign.left,
        ),
      ),
    );
  }

  bool _hasArabic(String s) {
    for (final cp in s.runes) {
      if ((cp >= 0x0600 && cp <= 0x06FF) ||
          (cp >= 0x0750 && cp <= 0x077F) ||
          (cp >= 0x08A0 && cp <= 0x08FF) ||
          (cp >= 0xFB50 && cp <= 0xFDFF) ||
          (cp >= 0xFE70 && cp <= 0xFEFF)) {
        return true;
      }
    }
    return false;
  }

  bool _hasLatinOrDigit(String s) {
    return RegExp(r'[A-Za-z0-9]').hasMatch(s);
  }
}
