import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/shared.dart';
import '../../../constants/app_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';

class SectionAudioPaired extends StatefulWidget {
  final String title;
  final MaterialAudioData audioData;
  final double fontScale;

  const SectionAudioPaired({
    super.key,
    required this.title,
    required this.audioData,
    this.fontScale = 1.0,
  });

  @override
  State<SectionAudioPaired> createState() => _SectionAudioPairedState();
}

class _SectionAudioPairedState extends State<SectionAudioPaired> {
  late AudioPlayer _audioPlayer;
  int? _currentPlayingIndex;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _setupAudioPlayer();
  }

  void _setupAudioPlayer() {
    _audioPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          _duration = duration;
        });
      }
    });

    _audioPlayer.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() {
          _currentPlayingIndex = null;
          _isPlaying = false;
          _position = Duration.zero;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio(int index) async {
    try {
      final audioFiles = widget.audioData.audioFiles;
      if (audioFiles == null || index >= audioFiles.length) {
        if (mounted) {
          Get.snackbar(
            'Error',
            'File audio tidak ditemukan',
            backgroundColor: AppColors.error,
            colorText: AppColors.surface,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
        return;
      }

      final audioFile = audioFiles[index];
      final assetPath =
          'materials/materi-istima/${_getChapterFolder()}/$audioFile';

      if (_currentPlayingIndex == index && _isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.stop();
        await _audioPlayer.play(AssetSource(assetPath));
        setState(() {
          _currentPlayingIndex = index;
        });
      }
    } catch (e) {
      if (mounted) {
        Get.snackbar(
          'Error',
          'Tidak dapat memutar audio: $e',
          backgroundColor: AppColors.error,
          colorText: AppColors.surface,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  String _getChapterFolder() {
    // Get chapter from route arguments
    final Map<String, dynamic>? args = Get.arguments;
    final Chapter? chapter = args?['chapter'] as Chapter?;

    // Use the chapter enum to get the correct folder name
    final activeChapter = chapter ?? Chapter.bab1;
    return 'bab ${activeChapter.id}';
  }

  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _currentPlayingIndex = null;
      _isPlaying = false;
      _position = Duration.zero;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  TextStyle _scaledTextStyle(TextStyle baseStyle) {
    return baseStyle.copyWith(
      fontSize:
          (baseStyle.fontSize ?? AppConstants.materialFontSizeDefault) *
          widget.fontScale,
    );
  }

  TextStyle _scaledTextStyleWith(
    TextStyle baseStyle, {
    Color? color,
    FontWeight? fontWeight,
    double? height,
  }) {
    return baseStyle.copyWith(
      fontSize:
          (baseStyle.fontSize ?? AppConstants.materialFontSizeDefault) *
          widget.fontScale,
      color: color,
      fontWeight: fontWeight,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: AppColors.alpha05),
            blurRadius: AppDimensions.spaceS,
            offset: const Offset(0, AppDimensions.spaceXS),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            widget.title,
            style: _scaledTextStyleWith(
              AppTextStyles.h4,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          // Instructions
          if (widget.audioData.instructions.isNotEmpty) ...[
            const SizedBox(height: AppDimensions.spaceM),
            ...widget.audioData.instructions.map(
              (instruction) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.spaceS),
                child: Text(
                  instruction,
                  style: _scaledTextStyle(AppTextStyles.bodyMedium),
                ),
              ),
            ),
          ],

          const SizedBox(height: AppDimensions.spaceL),

          // Audio and Question Pairs
          if (widget.audioData.audioFiles != null &&
              widget.audioData.questions != null) ...[
            ...List.generate(widget.audioData.audioFiles!.length, (index) {
              final question = index < widget.audioData.questions!.length
                  ? widget.audioData.questions![index]
                  : '';
              final isCurrentlyPlaying =
                  _currentPlayingIndex == index && _isPlaying;
              final isCurrentTrack = _currentPlayingIndex == index;

              return Container(
                margin: const EdgeInsets.only(bottom: AppDimensions.spaceL),
                padding: const EdgeInsets.all(AppDimensions.paddingL),
                decoration: BoxDecoration(
                  color: isCurrentTrack
                      ? AppColors.primary.withValues(alpha: AppColors.alpha05)
                      : AppColors.background,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                  border: Border.all(
                    color: isCurrentTrack
                        ? AppColors.primary.withValues(alpha: AppColors.alpha30)
                        : AppColors.borderLight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question text
                    if (question.isNotEmpty) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppDimensions.paddingM),
                        decoration: BoxDecoration(
                          color: AppColors.arabicGreen.withValues(
                            alpha: AppColors.alpha10,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusS,
                          ),
                          border: Border.all(
                            color: AppColors.arabicGreen.withValues(
                              alpha: AppColors.alpha20,
                            ),
                          ),
                        ),
                        child: Text(
                          question,
                          textAlign: TextAlign.right,
                          style: _scaledTextStyleWith(
                            AppTextStyles.bodyMedium,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spaceM),
                    ],

                    // Audio control section
                    Container(
                      padding: const EdgeInsets.all(AppDimensions.paddingM),
                      decoration: BoxDecoration(
                        color: AppColors.info.withValues(
                          alpha: AppColors.alpha05,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusS,
                        ),
                        border: Border.all(
                          color: AppColors.info.withValues(
                            alpha: AppColors.alpha20,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Audio control row
                          Row(
                            children: [
                              // Play/Pause button
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radiusCircular,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () => _playAudio(index),
                                  icon: Icon(
                                    isCurrentlyPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: AppColors.surface,
                                  ),
                                  iconSize: AppDimensions.iconM,
                                ),
                              ),

                              const SizedBox(width: AppDimensions.spaceM),

                              // Audio info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Audio ${index + 1}',
                                      style: _scaledTextStyleWith(
                                        AppTextStyles.bodyMedium,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Stop button (only show when playing)
                              if (isCurrentTrack) ...[
                                const SizedBox(width: AppDimensions.spaceS),
                                IconButton(
                                  onPressed: _stopAudio,
                                  icon: Icon(
                                    Icons.stop,
                                    color: AppColors.textSecondary,
                                  ),
                                  iconSize: AppDimensions.iconS,
                                ),
                              ],
                            ],
                          ),

                          // Progress bar (only show for current track)
                          if (isCurrentTrack) ...[
                            const SizedBox(height: AppDimensions.spaceM),
                            Row(
                              children: [
                                Text(
                                  _formatDuration(_position),
                                  style: _scaledTextStyleWith(
                                    AppTextStyles.caption,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(width: AppDimensions.spaceS),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: _duration.inMilliseconds > 0
                                        ? _position.inMilliseconds /
                                              _duration.inMilliseconds
                                        : 0.0,
                                    backgroundColor: AppColors.borderLight,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppDimensions.spaceS),
                                Text(
                                  _formatDuration(_duration),
                                  style: _scaledTextStyleWith(
                                    AppTextStyles.caption,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ] else ...[
            // No audio files or questions available
            Container(
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: AppColors.alpha10),
                borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                border: Border.all(
                  color: AppColors.warning.withValues(alpha: AppColors.alpha20),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_outlined,
                    color: AppColors.warning,
                    size: AppDimensions.iconM,
                  ),
                  const SizedBox(width: AppDimensions.spaceM),
                  Expanded(
                    child: Text(
                      'File audio atau pertanyaan tidak tersedia untuk materi ini.',
                      style: _scaledTextStyleWith(
                        AppTextStyles.bodyMedium,
                        color: AppColors.warning,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Audio controls info
          const SizedBox(height: AppDimensions.spaceM),
          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingM),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: AppColors.alpha05),
              borderRadius: BorderRadius.circular(AppDimensions.radiusS),
              border: Border.all(
                color: AppColors.success.withValues(alpha: AppColors.alpha20),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: AppColors.success,
                  size: AppDimensions.iconS,
                ),
                const SizedBox(width: AppDimensions.spaceS),
                Expanded(
                  child: Text(
                    'Dengarkan audio terlebih dahulu, kemudian lengkapi kalimat sesuai dengan yang didengar.',
                    style: _scaledTextStyleWith(
                      AppTextStyles.caption,
                      color: AppColors.success,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
