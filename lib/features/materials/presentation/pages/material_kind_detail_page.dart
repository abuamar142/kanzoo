import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../shared/data/materials_content.dart';
import '../../../../shared/models/material_content.dart';
import '../../../../core/widgets/materials/base_section_title.dart';
import '../../../../core/widgets/materials/base_vocab_item.dart';
import '../../../../core/widgets/materials/base_example_item.dart';

class MaterialKindDetailPage extends StatelessWidget {
  const MaterialKindDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chapter = Get.parameters['chapter'] ?? '1';
    final kind = Get.parameters['kind'] ?? 'qiroah';
    final id = '${kind}_bab$chapter';
    MaterialContent? content = MaterialsContentData.byTopicId(id);
    if (content == null && kind == 'qiroah') {
      // Fallback: slice from combined 'qiroah' content by chapter heading
      final combined = MaterialsContentData.byTopicId('qiroah');
      if (combined != null) {
        final sections = <MaterialSection>[];
        bool take = false;
        final heading = "Qiro'ah Bab $chapter";
        for (final s in combined.sections) {
          if (s.title == heading) {
            take = true;
          }
          if (take) {
            // Stop when next chapter heading reached
            if (s.title.startsWith("Qiro'ah Bab ") && s.title != heading) {
              break;
            }
            sections.add(s);
          }
        }
        if (sections.isNotEmpty) {
          content = MaterialContent(topicId: id, sections: sections);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("${_labelKind(kind)} - Bab $chapter")),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: content == null
            ? Center(
                child: Text(
                  AppConstants.dataNotFound,
                  style: AppTextStyles.bodyMedium,
                ),
              )
            : _ContentView(content: content),
      ),
    );
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
}

class _ContentView extends StatelessWidget {
  final MaterialContent content;
  const _ContentView({required this.content});

  @override
  Widget build(BuildContext context) {
    final sections = content.sections;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final section in sections) ...[
            BaseSectionTitle(title: section.title),
            for (final p in section.paragraphs) ...[
              _paragraph(p),
              const SizedBox(height: AppDimensions.spaceS),
            ],
            if (section.vocab.isNotEmpty)
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
                      ),
                  ],
                ),
              ),
            if (section.examples.isNotEmpty) ...[
              const SizedBox(height: AppDimensions.spaceM),
              for (final ex in section.examples)
                BaseExampleItem(arabic: ex.arabic, translation: ex.translation),
            ],
            const SizedBox(height: AppDimensions.spaceL),
          ],
        ],
      ),
    );
  }

  Widget _paragraph(String p) {
    final isArabic = _isArabic(p);
    return Text(
      p,
      style: isArabic ? AppTextStyles.arabicText : AppTextStyles.bodyMedium,
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      textAlign: isArabic ? TextAlign.right : TextAlign.left,
    );
  }

  bool _isArabic(String s) {
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
}
