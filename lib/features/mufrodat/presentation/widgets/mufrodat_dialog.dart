import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/dictionary/base_dictionary_item.dart';
import '../../../../shared/data/materials/chapter_materials_data.dart';
import '../../../../shared/enum/kind.dart';
import '../../../../shared/models/mufrodat_models.dart';
import '../../../../shared/models/simple_material_content.dart';
import '../../../../shared/models/templates/section_three.dart';

enum MufrodatSort { defaultOrder, indonesian, arabic }

class MufrodatDialog extends StatefulWidget {
  const MufrodatDialog({super.key});

  @override
  State<MufrodatDialog> createState() => _MufrodatDialogState();
}

class _MufrodatDialogState extends State<MufrodatDialog> {
  MufrodatSort _sort = MufrodatSort.defaultOrder;
  String _query = '';

  List<CategoryMufrodat> _extractMufrodatFromContent(
    SimpleMaterialContent content,
    String babPrefix,
  ) {
    final categories = <CategoryMufrodat>[];

    for (final section in content.sections) {
      if (section is SectionThree) {
        final items = <ItemMufrodat>[];

        for (final pair in section.wordPairs) {
          final indonesian = pair[0].trim();
          final arabic = pair[1].trim();
          if (indonesian.isNotEmpty && arabic.isNotEmpty) {
            items.add(ItemMufrodat(indonesian, arabic));
          }
        }

        if (items.isNotEmpty) {
          categories.add(
            CategoryMufrodat(
              title: '$babPrefix - ${section.title}',
              items: items,
            ),
          );
        }
      }
    }

    return categories;
  }

  List<CategoryMufrodat> get _allMufrodatCategories {
    final allCategories = <CategoryMufrodat>[];

    for (final chapterContent in ChapterMaterialsData.allChapters) {
      final mufrodatKind = chapterContent.kinds
          .where((k) => k.kind == Kind.mufrodat)
          .firstOrNull;

      if (mufrodatKind != null) {
        allCategories.addAll(
          _extractMufrodatFromContent(
            mufrodatKind.material,
            chapterContent.chapter.title,
          ),
        );
      }
    }

    return allCategories;
  }

  @override
  Widget build(BuildContext context) {
    int compareIndo(ItemMufrodat a, ItemMufrodat b) =>
        a.indonesian.toLowerCase().compareTo(b.indonesian.toLowerCase());
    int compareArab(ItemMufrodat a, ItemMufrodat b) =>
        a.arabic.compareTo(b.arabic);

    List<Widget> buildList() {
      final children = <Widget>[];
      for (final c in _allMufrodatCategories) {
        // Filter by query per category
        List<ItemMufrodat> items = c.items.where((e) {
          if (_query.isEmpty) return true;
          final q = _query.toLowerCase();
          return e.indonesian.toLowerCase().contains(q) ||
              e.arabic.contains(_query);
        }).toList();
        if (items.isEmpty) continue;
        if (_sort == MufrodatSort.indonesian) {
          items.sort(compareIndo);
        } else if (_sort == MufrodatSort.arabic) {
          items.sort(compareArab);
        }
        // Section header
        children.add(
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(
              top: AppDimensions.spaceS,
              bottom: AppDimensions.spaceXS,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.paddingS,
              horizontal: AppDimensions.paddingM,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: AppColors.alpha10),
              borderRadius: BorderRadius.circular(AppDimensions.radiusS),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: AppColors.alpha20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(
                      alpha: AppColors.alpha20,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.book, color: AppColors.primary, size: 14),
                ),
                const SizedBox(width: AppDimensions.spaceS),
                Text(
                  c.title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
        for (final it in items) {
          children.add(
            BaseDictionaryItem(arabic: it.arabic, indonesian: it.indonesian),
          );
        }
      }
      if (children.isEmpty) {
        children.add(
          Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingM),
            child: Center(
              child: Text(
                AppConstants.dictionaryNoResults,
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ),
        );
      }
      return children;
    }

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(AppDimensions.marginM),
          constraints: BoxConstraints(
            maxWidth: 500,
            maxHeight: MediaQuery.of(context).size.height * 0.7, // 70% layar
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withValues(
                  alpha: AppColors.alpha20,
                ),
                blurRadius: 20,
                offset: const Offset(0, 10),
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header dengan gradient
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppDimensions.paddingM),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppDimensions.radiusL),
                    topRight: Radius.circular(AppDimensions.radiusL),
                  ),
                ),
                child: Row(
                  children: [
                    // Dictionary icon
                    Container(
                      padding: const EdgeInsets.all(AppDimensions.paddingS),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withValues(
                          alpha: AppColors.alpha20,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.translate,
                        size: 20,
                        color: AppColors.secondary,
                      ),
                    ),

                    const SizedBox(width: AppDimensions.spaceM),

                    // Title
                    Expanded(
                      child: Text(
                        AppConstants.mufrodatDialogTitle,
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Close button
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withValues(
                          alpha: AppColors.alpha20,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.secondary,
                          size: 18,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: 'Tutup',
                        padding: const EdgeInsets.all(6),
                        constraints: const BoxConstraints(
                          minWidth: 30,
                          minHeight: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.paddingM),
                  child: Column(
                    children: [
                      // Search and sort controls
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(
                                  alpha: AppColors.alpha05,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusM,
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: AppConstants.dictionarySearchHint,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: AppColors.primary,
                                    size: 18,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: AppDimensions.paddingS,
                                    vertical: AppDimensions.paddingS,
                                  ),
                                  hintStyle: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.textHint,
                                  ),
                                ),
                                style: AppTextStyles.bodyMedium,
                                onChanged: (v) =>
                                    setState(() => _query = v.trim()),
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                              ),
                            ),
                          ),
                          const SizedBox(width: AppDimensions.spaceS),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.arabicGreen.withValues(
                                alpha: AppColors.alpha10,
                              ),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusM,
                              ),
                              border: Border.all(
                                color: AppColors.arabicGreen.withValues(
                                  alpha: AppColors.alpha20,
                                ),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.sort,
                                color: AppColors.arabicGreen,
                                size: 18,
                              ),
                              tooltip: AppConstants.dictionarySortLabel,
                              onPressed: () {
                                _showSortMenu(context);
                              },
                              padding: const EdgeInsets.all(
                                AppDimensions.paddingXS,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 36,
                                minHeight: 36,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppDimensions.spaceS),

                      // Dictionary list
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusM,
                            ),
                            border: Border.all(color: AppColors.borderLight),
                          ),
                          child: Scrollbar(
                            child: ListView(
                              padding: const EdgeInsets.all(
                                AppDimensions.paddingS,
                              ),
                              children: buildList(),
                            ),
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
      ),
    );
  }

  void _showSortMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusL),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: AppDimensions.spaceM),
              decoration: BoxDecoration(
                color: AppColors.borderLight,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            Text(
              AppConstants.dictionarySortLabel,
              style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: AppDimensions.spaceM),

            // Sort options
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(AppDimensions.paddingXS),
                decoration: BoxDecoration(
                  color: _sort == MufrodatSort.defaultOrder
                      ? AppColors.primary.withValues(alpha: AppColors.alpha10)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _sort == MufrodatSort.defaultOrder ? Icons.check : Icons.list,
                  color: _sort == MufrodatSort.defaultOrder
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 20,
                ),
              ),
              title: Text(AppConstants.dictionarySortDefault),
              onTap: () {
                setState(() => _sort = MufrodatSort.defaultOrder);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(AppDimensions.paddingXS),
                decoration: BoxDecoration(
                  color: _sort == MufrodatSort.indonesian
                      ? AppColors.primary.withValues(alpha: AppColors.alpha10)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _sort == MufrodatSort.indonesian
                      ? Icons.check
                      : Icons.sort_by_alpha,
                  color: _sort == MufrodatSort.indonesian
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 20,
                ),
              ),
              title: Text(AppConstants.dictionarySortByIndonesian),
              onTap: () {
                setState(() => _sort = MufrodatSort.indonesian);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(AppDimensions.paddingXS),
                decoration: BoxDecoration(
                  color: _sort == MufrodatSort.arabic
                      ? AppColors.primary.withValues(alpha: AppColors.alpha10)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _sort == MufrodatSort.arabic ? Icons.check : Icons.translate,
                  color: _sort == MufrodatSort.arabic
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 20,
                ),
              ),
              title: Text(AppConstants.dictionarySortByArabic),
              onTap: () {
                setState(() => _sort = MufrodatSort.arabic);
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: AppDimensions.spaceM),
          ],
        ),
      ),
    );
  }
}
