import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/exercises/base_exercise_button.dart';
import '../../../../core/widgets/materials/base_example_item.dart';
import '../../../../core/widgets/materials/base_section_title.dart';
import '../../../../core/widgets/materials/base_vocab_item.dart';
import '../../../../core/widgets/materials/sections/section_one.dart';
import '../../../../core/widgets/materials/sections/section_three.dart';
import '../../../../core/widgets/materials/sections/section_two.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/data/exercises_data.dart';
import '../../../../shared/data/materials_content.dart';
import '../../../../shared/data/materials_data.dart';
import '../../../../shared/models/exercise_set.dart';
import '../../../../shared/models/material_content.dart';
import '../../../../shared/models/material_topic.dart';

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
      // Choose template based on available fields
      if ((section.subtitle ?? '').trim().isNotEmpty &&
          (section.footer ?? '').trim().isEmpty) {
        widgets.add(
          SectionTwo(
            title: section.title,
            subtitle: section.subtitle!.trim(),
            paragraphs: section.paragraphs,
          ),
        );
      } else if ((section.footer ?? '').trim().isNotEmpty) {
        widgets.add(
          SectionThree(
            title: section.title,
            paragraphs: section.paragraphs,
            footer: section.footer!.trim(),
          ),
        );
      } else {
        widgets.add(
          SectionOne(title: section.title, paragraphs: section.paragraphs),
        );
      }

      // Optional blocks
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
      widgets.add(const SizedBox(height: AppDimensions.spaceL));
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
}
