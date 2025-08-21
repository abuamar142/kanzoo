import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/breadcrumb/app_breadcrumb.dart';
import '../../../../core/widgets/font_size/font_size_overlay.dart';
import '../../../../core/widgets/materials/sections/section_audio.dart';
import '../../../../core/widgets/materials/sections/section_audio_paired.dart';
import '../../../../core/widgets/materials/sections/section_five.dart';
import '../../../../core/widgets/materials/sections/section_four.dart';
import '../../../../core/widgets/materials/sections/section_interactive_quiz.dart';
import '../../../../core/widgets/materials/sections/section_one.dart';
import '../../../../core/widgets/materials/sections/section_table.dart';
import '../../../../core/widgets/materials/sections/section_three.dart';
import '../../../../core/widgets/materials/sections/section_two.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/shared.dart';
import '../controllers/font_size_controller.dart';

class MaterialDetailPage extends StatefulWidget {
  const MaterialDetailPage({super.key});

  @override
  State<MaterialDetailPage> createState() => _MaterialDetailPageState();
}

class _MaterialDetailPageState extends State<MaterialDetailPage> {
  late FontSizeController fontSizeController;

  @override
  void initState() {
    super.initState();
    // Initialize font size controller
    fontSizeController = Get.put(FontSizeController());
  }

  @override
  void dispose() {
    // Clean up controller when page is disposed
    Get.delete<FontSizeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get Chapter and Kind enums from arguments
    final Map<String, dynamic>? args = Get.arguments;
    final Chapter? chapter = args?['chapter'] as Chapter?;
    final Kind? kind = args?['kind'] as Kind?;

    // Fallback defaults
    final Chapter activeChapter = chapter ?? Chapter.bab1;
    final Kind activeKind = kind ?? Kind.qiroah;

    // Get material content using enums
    final MaterialContent? materialContent =
        MaterialsData.getByChapterAndKindEnum(activeChapter, activeKind);

    return Scaffold(
      appBar: AppBar(
        title: Text('${activeKind.title} - ${activeChapter.title}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                fontSizeController.isOverlayVisible
                    ? Icons.format_size
                    : Icons.format_size_outlined,
              ),
              onPressed: fontSizeController.toggleOverlay,
              tooltip: AppConstants.fontSizeLabel,
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: GestureDetector(
        onTap: () {
          // Close font size overlay when tapping outside
          if (fontSizeController.isOverlayVisible) {
            fontSizeController.hideOverlay();
          }
        },
        child: Stack(
          children: [
            materialContent == null
                ? _buildNotFoundContent(activeKind, activeChapter)
                : _buildMaterialContent(
                    materialContent,
                    activeKind,
                    activeChapter,
                  ),
            const FontSizeOverlay(),
          ],
        ),
      ),
    );
  }

  // Helper method to apply font size scaling to text styles
  TextStyle _scaledTextStyle(TextStyle baseStyle) {
    return baseStyle.copyWith(
      fontSize:
          (baseStyle.fontSize ?? AppConstants.materialFontSizeDefault) *
          fontSizeController.fontScale,
    );
  }

  // Helper method to apply font size scaling to text styles with copyWith
  TextStyle _scaledTextStyleWith(
    TextStyle baseStyle, {
    Color? color,
    FontWeight? fontWeight,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return baseStyle.copyWith(
      fontSize:
          (baseStyle.fontSize ?? AppConstants.materialFontSizeDefault) *
          fontSizeController.fontScale,
      color: color,
      fontWeight: fontWeight,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  Widget _buildBreadcrumbAndTitle(Kind materialKind, Chapter chapter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Breadcrumb Navigation
        AppBreadcrumb(
          items: [
            BreadcrumbItem(
              label: 'Beranda',
              icon: Icons.home,
              onTap: () => Get.offAllNamed(AppRoutes.home),
            ),
            BreadcrumbItem(
              label: chapter.title,
              icon: Icons.menu_book,
              onTap: () => Get.back(),
            ),
            BreadcrumbItem(
              label: materialKind.title,
              icon: materialKind.icon,
              isActive: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotFoundContent(Kind materialKind, Chapter chapter) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - (AppDimensions.paddingM * 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBreadcrumbAndTitle(materialKind, chapter),
                const SizedBox(height: AppDimensions.spaceL),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppDimensions.paddingL),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusM,
                      ),
                      border: Border.all(color: AppColors.borderLight),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor.withValues(
                            alpha: AppColors.alpha05,
                          ),
                          blurRadius: AppDimensions.spaceS,
                          offset: const Offset(0, AppDimensions.spaceXS),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.construction,
                          size: AppDimensions.iconXXL,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(height: AppDimensions.spaceM),
                        Obx(
                          () => Text(
                            'Konten dalam pengembangan',
                            style: _scaledTextStyleWith(
                              AppTextStyles.h4,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spaceS),
                        Obx(
                          () => Text(
                            'Materi ${materialKind.title} untuk ${chapter.title} sedang dalam tahap pengembangan. Silakan kembali lagi nanti.',
                            style: _scaledTextStyleWith(
                              AppTextStyles.bodyMedium,
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMaterialContent(
    MaterialContent content,
    Kind materialKind,
    Chapter chapter,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - (AppDimensions.paddingM * 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBreadcrumbAndTitle(materialKind, chapter),
                const SizedBox(height: AppDimensions.spaceL),
                ...content.sections.map((section) => _buildSection(section)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(MaterialSection section) {
    switch (section.type) {
      case MaterialSectionType.one:
        return Column(
          children: [
            Obx(
              () => SectionOne(
                title: section.title,
                paragraphs: section.paragraphs,
                fontScale: fontSizeController.fontScale,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.two:
        return Column(
          children: [
            Obx(
              () => SectionTwo(
                title: section.title,
                subtitle: section.subtitle ?? '',
                paragraphs: section.paragraphs,
                fontScale: fontSizeController.fontScale,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.three:
        return Column(
          children: [
            Obx(
              () => SectionThree(
                title: section.title,
                paragraphs: section.paragraphs,
                footer: section.footer ?? '',
                fontScale: fontSizeController.fontScale,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.four:
        return Column(
          children: [
            Obx(
              () => SectionFour(
                title: section.title,
                instruction: section.subtitle,
                items: section.scrambleItems
                    .map((item) => item.tokens)
                    .toList(),
                underlineIndices: section.scrambleItems
                    .map((item) => item.underlineIndex)
                    .toList(),
                fontScale: fontSizeController.fontScale,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.five:
        return Column(
          children: [
            Obx(
              () => SectionFive(
                title: section.title,
                instruction: section.subtitle,
                questions: section.groupQuestions
                    .map((item) => item.question)
                    .toList(),
                subItems: section.groupQuestions
                    .map((item) => item.subItems)
                    .toList(),
                fontScale: fontSizeController.fontScale,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.table:
        return Column(
          children: [
            Obx(
              () => SectionTable(
                title: section.title,
                tableData: section.tableData!.rows,
                headers: section.tableData!.headers,
                fontScale: fontSizeController.fontScale,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.audio:
        return Column(
          children: [
            Obx(
              () => SectionAudio(
                title: section.title,
                audioData: section.audioData!,
                fontScale: fontSizeController.fontScale,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.audioPaired:
        return Column(
          children: [
            Obx(
              () => SectionAudioPaired(
                title: section.title,
                audioData: section.audioData!,
                fontScale: fontSizeController.fontScale,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.dialog:
        return Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    section.title,
                    style: AppTextStyles.h4.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  if (section.subtitle != null ||
                      section.richSubtitle != null) ...[
                    const SizedBox(height: AppDimensions.spaceS),
                    Text(
                      section.subtitle ??
                          section.richSubtitle?.toPlainText() ??
                          '',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                  const SizedBox(height: AppDimensions.spaceM),
                  ...section.dialogLines.map(
                    (line) => Container(
                      margin: const EdgeInsets.only(
                        bottom: AppDimensions.spaceS,
                      ),
                      padding: const EdgeInsets.all(AppDimensions.paddingM),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(
                          alpha: AppColors.alpha05,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusS,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Obx(
                              () => Text(
                                line.text,
                                style: _scaledTextStyle(
                                  AppTextStyles.arabicText,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppDimensions.spaceS),
                          const Text(
                            ':',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: AppDimensions.spaceM),
                          SizedBox(
                            width: 50,
                            child: Obx(
                              () => Text(
                                line.speaker,
                                style: _scaledTextStyleWith(
                                  AppTextStyles.bodyMedium,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.exerciseTable:
        return Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      section.title,
                      style: _scaledTextStyleWith(
                        AppTextStyles.h4,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  if (section.subtitle != null) ...[
                    const SizedBox(height: AppDimensions.spaceS),
                    Obx(
                      () => Text(
                        section.subtitle!,
                        style: _scaledTextStyleWith(
                          AppTextStyles.bodyMedium,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                  if (section.exerciseTableData != null) ...[
                    const SizedBox(height: AppDimensions.spaceM),
                    ...section.exerciseTableData!.instructions.map(
                      (instruction) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimensions.spaceS,
                        ),
                        child: Obx(
                          () => Text(
                            instruction,
                            style: _scaledTextStyleWith(
                              AppTextStyles.bodyMedium,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spaceM),
                    ...section.exerciseTableData!.exercises.asMap().entries.map(
                      (entry) => Container(
                        margin: const EdgeInsets.only(
                          bottom: AppDimensions.spaceM,
                        ),
                        padding: const EdgeInsets.all(AppDimensions.paddingM),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(
                            alpha: AppColors.alpha05,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusS,
                          ),
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                '${entry.key + 1}. ${entry.value.question}',
                                style: _scaledTextStyleWith(
                                  AppTextStyles.bodyMedium,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: AppDimensions.spaceS),
                            ...entry.value.options.map(
                              (optionRow) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppDimensions.spaceXS,
                                ),
                                child: Text(
                                  optionRow.join('  '),
                                  style: AppTextStyles.bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      case MaterialSectionType.interactiveQuiz:
        return Column(
          children: [
            Obx(
              () => SectionInteractiveQuiz(
                title: section.title,
                quizData: section.interactiveQuizData!,
                fontScale: fontSizeController.fontScale,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
      default:
        return Column(
          children: [
            SectionOne(title: section.title, paragraphs: section.paragraphs),
            const SizedBox(height: AppDimensions.spaceL),
          ],
        );
    }
  }
}
