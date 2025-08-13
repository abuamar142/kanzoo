import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../shared/data/materials_data.dart';
import '../../../../shared/data/materials_content.dart';
import '../../../../shared/models/material_topic.dart';
import '../../../../shared/models/material_content.dart';
import '../../../../shared/data/exercises_data.dart';
import '../../../../shared/models/exercise_set.dart';
import '../../../../core/widgets/materials/base_section_title.dart';
import '../../../../core/widgets/materials/base_vocab_item.dart';
import '../../../../core/widgets/materials/base_example_item.dart';
import '../../../../core/widgets/exercises/base_exercise_button.dart';
import '../../../../routes/app_routes.dart';

class MaterialDetailPage extends StatelessWidget {
  const MaterialDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Expecting route like /materials/detail/:id
    final id = Get.parameters['id'] ?? Get.arguments as String?;
    final MaterialTopic? topic = id != null ? MaterialsData.byId(id) : null;

    if (topic == null) {
      return Scaffold(
        appBar: AppBar(title: const Text(AppConstants.materialsTitle)),
        body: Center(
          child: Text(
            AppConstants.dataNotFound,
            style: AppTextStyles.bodyMedium,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(topic.title)),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(topic.title, style: AppTextStyles.h3),
            const SizedBox(height: AppDimensions.spaceS),
            Text(topic.description, style: AppTextStyles.bodyMedium),
            const SizedBox(height: AppDimensions.spaceL),
            ..._buildContent(topic.id),
            const SizedBox(height: AppDimensions.spaceL),
            BaseSectionTitle(title: AppConstants.exerciseTitle),
            const SizedBox(height: AppDimensions.spaceS),
            _buildExercisesBlock(topic.id),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContent(String topicId) {
    final MaterialContent? content = MaterialsContentData.byTopicId(topicId);
    if (content == null) {
      return [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Text(
            AppConstants.dataNotFound,
            style: AppTextStyles.bodyMedium,
          ),
        ),
      ];
    }

    final widgets = <Widget>[];
    for (final section in content.sections) {
      widgets.add(BaseSectionTitle(title: section.title));
      final isTask = _isTaskSection(section.title);
      for (final p in section.paragraphs) {
        if (isTask) {
          widgets.addAll(_buildTaskParagraphPieces(p));
        } else {
          final isArabic = _isArabic(p);
          widgets.addAll([
            Text(
              p,
              style:
                  isArabic ? AppTextStyles.arabicText : AppTextStyles.bodyMedium,
              textDirection:
                  isArabic ? TextDirection.rtl : TextDirection.ltr,
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
            ),
            const SizedBox(height: AppDimensions.spaceS),
          ]);
        }
      }
      if (section.vocab.isNotEmpty) {
        widgets.add(
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
        );
        widgets.add(const SizedBox(height: AppDimensions.spaceM));
      }
      if (section.examples.isNotEmpty) {
        widgets.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final ex in section.examples)
                BaseExampleItem(arabic: ex.arabic, translation: ex.translation),
            ],
          ),
        );
      }
    }
    return widgets;
  }

  Widget _buildExercisesBlock(String topicId) {
    final List<ExerciseSet> sets = ExercisesData.byMaterial(topicId);

    if (sets.isEmpty) {
      return Text(AppConstants.dataNotFound, style: AppTextStyles.bodyMedium);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppDimensions.spaceS,
          runSpacing: AppDimensions.spaceS,
          children: [
            for (final s in sets)
              BaseExerciseButton(
                label: s.title,
                onPressed: () =>
                    Get.toNamed('${AppRoutes.exerciseDetail}/${s.id}'),
              ),
          ],
        ),
      ],
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

  bool _isTaskSection(String title) {
    final t = title.toLowerCase();
    return t.contains('tugas individu');
  }

  List<Widget> _buildTaskParagraphPieces(String paragraph) {
    final widgets = <Widget>[];
    final text = paragraph.trim();

    // Try to extract numbered questions like: "1. ... 2. ..." or "۱. ... 2. ..."
    final numberRegex = RegExp(r'(?:^|\s)([0-9\u0660-\u0669]+)\s*[\.)]?\s*');
    final matches = numberRegex.allMatches(text).toList();

    if (matches.isNotEmpty) {
      for (var i = 0; i < matches.length; i++) {
        final m = matches[i];
        final numStr = m.group(1) ?? '';
        final start = m.end;
        final end = i + 1 < matches.length ? matches[i + 1].start : text.length;
        final q = text.substring(start, end).trim();
        if (q.isEmpty) continue;

        widgets.add(
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '$numStr. '),
                TextSpan(text: q),
              ],
              style: AppTextStyles.arabicText,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
        );
        widgets.add(const SizedBox(height: AppDimensions.spaceS));
      }
      return widgets;
    }

    // Fallback: split by sentence punctuation and align per script
    final parts = text
        .replaceAll('؟', '؟\n')
        .replaceAll('!', '!\n')
        .replaceAll('.', '.\n')
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    for (final part in parts) {
      final isArabic = _isArabic(part);
      widgets.add(
        Text(
          part,
          style: isArabic ? AppTextStyles.arabicText : AppTextStyles.bodyMedium,
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          textAlign: isArabic ? TextAlign.center : TextAlign.left,
        ),
      );
      widgets.add(const SizedBox(height: AppDimensions.spaceS));
    }

    return widgets;
  }
}
