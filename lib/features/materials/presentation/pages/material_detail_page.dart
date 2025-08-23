import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/breadcrumb/app_breadcrumb.dart';
import '../../../../core/widgets/font_size/font_size_overlay.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/data/materials/chapter_materials_data.dart';
import '../../../../shared/models/simple_material_content.dart';
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
    fontSizeController = Get.put(FontSizeController());
  }

  @override
  void dispose() {
    Get.delete<FontSizeController>();
    super.dispose();
  }

  SimpleMaterialContent? _getContentFromNewStructure(
    Chapter chapter,
    Kind kind,
  ) {
    final chapterContent = ChapterMaterialsData.getByChapter(chapter);
    if (chapterContent == null) return null;

    // Find the specific kind content
    final kindContent = chapterContent.kinds
        .where((kc) => kc.kind == kind)
        .firstOrNull;

    return kindContent?.material;
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

    // Check if this should use new design system
    SimpleMaterialContent? newContent = _getContentFromNewStructure(
      activeChapter,
      activeKind,
    );

    // Use new design system if content is available, otherwise show not found
    if (newContent != null) {
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
              _buildNewContent(newContent, activeKind, activeChapter),
              const FontSizeOverlay(),
            ],
          ),
        ),
      );
    }

    // Material not  not found
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
            _buildNotFoundContent(activeKind, activeChapter),
            const FontSizeOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewContent(
    SimpleMaterialContent content,
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
                ...content.sections.map(
                  (section) => Column(
                    children: [
                      section.build(context),
                      const SizedBox(height: AppDimensions.spaceL),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
                        Text(
                          'Konten dalam pengembangan',
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppDimensions.spaceS),
                        Text(
                          'Materi ${materialKind.title} untuk ${chapter.title} sedang dalam tahap pengembangan. Silakan kembali lagi nanti.',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
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
}

extension ListFirstOrNull<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
