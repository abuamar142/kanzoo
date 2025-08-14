import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/dictionary/base_dictionary_item.dart';
import '../../../../shared/data/mufrodat_data.dart';
import '../../../../shared/models/mufrodat_models.dart';

enum MufrodatSort { defaultOrder, indonesian, arabic }

class MufrodatDialog extends StatefulWidget {
  const MufrodatDialog({super.key});

  @override
  State<MufrodatDialog> createState() => _MufrodatDialogState();
}

class _MufrodatDialogState extends State<MufrodatDialog> {
  MufrodatSort _sort = MufrodatSort.defaultOrder;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    int compareIndo(ItemMufrodat a, ItemMufrodat b) =>
        a.indonesian.toLowerCase().compareTo(b.indonesian.toLowerCase());
    int compareArab(ItemMufrodat a, ItemMufrodat b) =>
        a.arabic.compareTo(b.arabic);

    List<Widget> buildList() {
      final children = <Widget>[];
      for (final c in MufrodatData.categories) {
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
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.paddingS,
              horizontal: AppDimensions.paddingM,
            ),
            color: AppColors.surface,
            child: Text(
              c.title,
              style: AppTextStyles.label.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
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
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withValues(
                  alpha: AppColors.alpha30,
                ),
                blurRadius: AppDimensions.shadowBlurRadius,
                offset: const Offset(0, AppDimensions.spaceS),
              ),
            ],
          ),
          constraints: const BoxConstraints(maxWidth: 560, maxHeight: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.translate, color: AppColors.primary),
                  const SizedBox(width: AppDimensions.spaceS),
                  Text(
                    AppConstants.mufrodatDialogTitle,
                    style: AppTextStyles.h4,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    tooltip: 'Tutup',
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spaceM),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: AppConstants.dictionarySearchHint,
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusS,
                          ),
                          borderSide: const BorderSide(
                            color: AppColors.borderLight,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusS,
                          ),
                          borderSide: const BorderSide(
                            color: AppColors.borderLight,
                          ),
                        ),
                      ),
                      onChanged: (v) => setState(() => _query = v.trim()),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spaceS),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderLight),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusS,
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 48,
                        minHeight: 48,
                      ),
                      icon: const Icon(Icons.sort),
                      tooltip: 'Urutkan',
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: _sort == MufrodatSort.defaultOrder
                                    ? const Icon(
                                        Icons.check,
                                        color: AppColors.primary,
                                      )
                                    : const SizedBox(width: 24),
                                title: const Text(
                                  AppConstants.dictionarySortDefault,
                                ),
                                onTap: () {
                                  setState(
                                    () => _sort = MufrodatSort.defaultOrder,
                                  );
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: _sort == MufrodatSort.indonesian
                                    ? const Icon(
                                        Icons.check,
                                        color: AppColors.primary,
                                      )
                                    : const SizedBox(width: 24),
                                title: const Text(
                                  AppConstants.dictionarySortByIndonesian,
                                ),
                                onTap: () {
                                  setState(
                                    () => _sort = MufrodatSort.indonesian,
                                  );
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: _sort == MufrodatSort.arabic
                                    ? const Icon(
                                        Icons.check,
                                        color: AppColors.primary,
                                      )
                                    : const SizedBox(width: 24),
                                title: const Text(
                                  AppConstants.dictionarySortByArabic,
                                ),
                                onTap: () {
                                  setState(() => _sort = MufrodatSort.arabic);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spaceM),
              Expanded(
                child: Scrollbar(child: ListView(children: buildList())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
