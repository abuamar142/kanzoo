import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/materials/base_example_item.dart';
import '../../../../core/widgets/materials/base_vocab_item.dart';
import '../../../../core/widgets/materials/sections/section_one.dart';
import '../../../../core/widgets/materials/sections/section_three.dart';
import '../../../../core/widgets/materials/sections/section_two.dart';
import '../../../../core/widgets/materials/sections/section_four.dart';
import '../../../../core/widgets/materials/sections/section_five.dart';
import '../../../../shared/data/materials_content.dart';
import '../../../../shared/models/material_content.dart';

class MaterialKindDetailPage extends StatefulWidget {
  const MaterialKindDetailPage({super.key});

  @override
  State<MaterialKindDetailPage> createState() => _MaterialKindDetailPageState();
}

class _MaterialKindDetailPageState extends State<MaterialKindDetailPage> {
  double _fontSize = AppConstants.materialFontSizeDefault;
  bool _showOverlay = false;

  double get _baseBodySize => AppTextStyles.bodyMedium.fontSize ?? 14.0;
  double get _fontScale => (_fontSize / _baseBodySize).clamp(
    AppConstants.materialFontSizeMin / _baseBodySize,
    AppConstants.materialFontSizeMax / _baseBodySize,
  );

  @override
  void initState() {
    super.initState();
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getDouble(AppConstants.materialFontSizeKey);
    if (saved != null && mounted) {
      setState(() {
        _fontSize = saved.clamp(
          AppConstants.materialFontSizeMin,
          AppConstants.materialFontSizeMax,
        );
      });
    }
  }

  Future<void> _saveFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(AppConstants.materialFontSizeKey, _fontSize);
  }

  void _increaseFont() {
    setState(() {
      _fontSize = (_fontSize + 1).clamp(
        AppConstants.materialFontSizeMin,
        AppConstants.materialFontSizeMax,
      );
    });
    _saveFontSize();
  }

  void _decreaseFont() {
    setState(() {
      _fontSize = (_fontSize - 1).clamp(
        AppConstants.materialFontSizeMin,
        AppConstants.materialFontSizeMax,
      );
    });
    _saveFontSize();
  }

  @override
  Widget build(BuildContext context) {
    final chapter = Get.parameters['chapter'] ?? '1';
    final kind = Get.parameters['kind'] ?? 'qiroah';

    return Scaffold(
      appBar: AppBar(
        title: Text("${_labelKind(kind)} - Bab $chapter"),
        actions: [
          IconButton(
            icon: const Icon(Icons.format_size),
            onPressed: () => setState(() => _showOverlay = !_showOverlay),
            tooltip: 'Atur ukuran teks',
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingM),
              child: FutureBuilder<MaterialContent?>(
                future: _loadContent(kind, int.tryParse(chapter) ?? 1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final content = snapshot.data;
                  if (content == null) {
                    return Center(
                      child: Text(
                        AppConstants.dataNotFound,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: _fontSize,
                        ),
                      ),
                    );
                  }
                  return _ContentView(content: content, fontScale: _fontScale);
                },
              ),
            ),
          ),
          if (_showOverlay) _buildFontOverlay(context),
        ],
      ),
    );
  }

  Future<MaterialContent?> _loadContent(String kind, int chapter) async {
    final id = '${kind}_bab$chapter';
    // Try by kind+chapter first
    MaterialContent? content = MaterialsContentData.byKindChapter(
      kind,
      chapter,
    );
    if (content != null) return content;
    // Try direct topic id
    content = MaterialsContentData.byTopicId(id);
    if (content != null) return content;

    if (kind == 'qiroah') {
      // Fallback: slice from combined 'qiroah' content by chapter heading
      final combined = MaterialsContentData.byTopicId('qiroah');
      if (combined != null) {
        final sections = <MaterialSection>[];
        bool take = false;
        for (final s in combined.sections) {
          final chapNum = _qiroahChapterFromTitle(s.title);
          if (chapNum != null) {
            if (take && chapNum != chapter) {
              break; // reached next chapter header
            }
            if (chapNum == chapter) {
              take = true;
              sections.add(s); // include header for qiroah (contains content)
              continue;
            }
          }
          if (take) sections.add(s);
        }
        if (sections.isNotEmpty) {
          return MaterialContent(topicId: id, sections: sections);
        }
      }
      return null;
    }

    if (kind == 'kitabah') {
      // Fallback: slice from combined 'kitabah' content by chapter heading
      final combined = MaterialsContentData.byTopicId('kitabah');
      if (combined != null) {
        final sections = <MaterialSection>[];
        bool take = false;
        for (final s in combined.sections) {
          final chapNum = _kitabahChapterFromTitle(s.title);
          if (chapNum != null) {
            if (take && chapNum != chapter) break; // next chapter header
            if (chapNum == chapter) {
              take = true;
              continue; // skip the header section itself for Kitabah
            }
          }
          if (take) sections.add(s);
        }
        if (sections.isNotEmpty) {
          return MaterialContent(topicId: id, sections: sections);
        }
      }
      return null;
    }

    // Other kinds: try future sources when available
    return null;
  }

  int? _qiroahChapterFromTitle(String title) {
    final t = title.trim();
    if (t.startsWith("Qiro'ah Bab ")) {
      final n = int.tryParse(t.substring("Qiro'ah Bab ".length).trim());
      if (n != null) return n;
    }
    if (t.startsWith('Qiroah Bab ')) {
      final n = int.tryParse(t.substring('Qiroah Bab '.length).trim());
      if (n != null) return n;
    }
    final re = RegExp(r"^qiro.?ah bab\s*(\d+)", caseSensitive: false);
    final m = re.firstMatch(t);
    if (m != null) return int.tryParse(m.group(1) ?? '');
    return null;
  }

  int? _kitabahChapterFromTitle(String title) {
    final t = title.trim();
    if (t.startsWith('Kitabah Bab ')) {
      final n = int.tryParse(t.substring('Kitabah Bab '.length).trim());
      if (n != null) return n;
    }
    final re = RegExp(r"^kitabah bab\s*(\d+)", caseSensitive: false);
    final m = re.firstMatch(t);
    if (m != null) return int.tryParse(m.group(1) ?? '');
    return null;
  }

  String _labelKind(String kind) {
    switch (kind) {
      case 'qiroah':
        return "Qiro'ah";
      case 'kitabah':
        return 'Kitabah';
      case 'mahfudzot':
        return 'Mahfudzot';
      case 'qowaid':
        return 'Qowaid';
      case 'istima':
        return "Istima'";
      case 'kalam':
        return 'Kalam';
      case 'mufrodat':
        return 'Mufrodat';
      default:
        return kind;
    }
  }

  Widget _buildFontOverlay(BuildContext context) {
    return Positioned(
      right: AppDimensions.spaceM,
      bottom: AppDimensions.spaceM,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingM,
            vertical: AppDimensions.paddingS,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withValues(
                  alpha: AppColors.alpha20,
                ),
                blurRadius: AppDimensions.shadowBlurRadius,
                offset: const Offset(0, AppDimensions.shadowOffset),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _decreaseFont,
                icon: const Icon(Icons.remove),
                tooltip: 'Kecilkan',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spaceS,
                ),
                child: Text(
                  _fontSize.toStringAsFixed(0),
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: (AppTextStyles.bodyLarge.fontSize ?? 16),
                  ),
                ),
              ),
              IconButton(
                onPressed: _increaseFont,
                icon: const Icon(Icons.add),
                tooltip: 'Besarkan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContentView extends StatelessWidget {
  final MaterialContent content;
  final double fontScale;
  const _ContentView({required this.content, required this.fontScale});

  @override
  Widget build(BuildContext context) {
    final sections = content.sections;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: AppDimensions.spaceXL * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final section in sections) ...[
            _buildSection(section),

            if (section.vocab.isNotEmpty) ...[
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Column(
                  children: [
                    for (final v in section.vocab)
                      BaseVocabItem(
                        arabic: v.arabic,
                        indonesian: v.indonesian,
                        note: v.note,
                        fontScale: fontScale,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.spaceM),
            ],
            if (section.examples.isNotEmpty) ...[
              for (final ex in section.examples)
                BaseExampleItem(
                  arabic: ex.arabic,
                  translation: ex.translation,
                  fontScale: fontScale,
                ),
            ],
            const SizedBox(height: AppDimensions.spaceL),
          ],
        ],
      ),
    );
  }

  Widget _buildSection(MaterialSection s) {
    // Prefer explicit type mapping; fallback to heuristics when type is null
    switch (s.type) {
      case MaterialSectionType.two:
        return SectionTwo(
          title: s.title,
          subtitle: (s.subtitle ?? '').trim(),
          paragraphs: s.paragraphs,
          fontScale: fontScale,
        );
      case MaterialSectionType.three:
        return SectionThree(
          title: s.title,
          paragraphs: s.paragraphs,
          footer: (s.footer ?? '').trim(),
          fontScale: fontScale,
        );
      case MaterialSectionType.four:
        return SectionFour(
          title: s.title,
          instruction: s.subtitle,
          items: s.scrambleItems.map((e) => e.tokens).toList(),
          underlineIndices: s.scrambleItems
              .map((e) => e.underlineIndex)
              .toList(),
          fontScale: fontScale,
        );
      case MaterialSectionType.five:
        return SectionFive(
          title: s.title,
          instruction: s.subtitle,
          questions: s.groupQuestions.map((e) => e.question).toList(),
          subItems: s.groupQuestions.map((e) => e.subItems).toList(),
          fontScale: fontScale,
        );
      case MaterialSectionType.one:
        return SectionOne(
          title: s.title,
          paragraphs: s.paragraphs,
          fontScale: fontScale,
        );
      case null:
        break;
    }
    // Heuristics fallback
    if ((s.subtitle ?? '').trim().isNotEmpty &&
        (s.footer ?? '').trim().isEmpty) {
      return SectionTwo(
        title: s.title,
        subtitle: s.subtitle!.trim(),
        paragraphs: s.paragraphs,
        fontScale: fontScale,
      );
    }
    if ((s.footer ?? '').trim().isNotEmpty) {
      return SectionThree(
        title: s.title,
        paragraphs: s.paragraphs,
        footer: s.footer!.trim(),
        fontScale: fontScale,
      );
    }
    return SectionOne(
      title: s.title,
      paragraphs: s.paragraphs,
      fontScale: fontScale,
    );
  }
}
