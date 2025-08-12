import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_timing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/dictionary/base_dictionary_item.dart';
import '../../../../shared/data/dictionary_data.dart';
import '../../../../shared/models/dictionary_entry.dart';

class DictionaryDialog extends StatefulWidget {
  const DictionaryDialog({super.key});

  @override
  State<DictionaryDialog> createState() => _DictionaryDialogState();
}

class _DictionaryDialogState extends State<DictionaryDialog> {
  DictionarySort _sort = DictionarySort.defaultOrder;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final entries = DictionaryData.items;

    List<DictionaryEntry> filtered = entries.where((e) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return e.indonesian.toLowerCase().contains(q) ||
          e.arabic.contains(_query);
    }).toList();

    // Group by section while preserving insertion order for default
    final Map<String, List<DictionaryEntry>> grouped = {};
    for (final e in filtered) {
      grouped.putIfAbsent(e.section, () => []).add(e);
    }

    // Sorting rules
    int compareIndonesian(DictionaryEntry a, DictionaryEntry b) =>
        a.indonesian.toLowerCase().compareTo(b.indonesian.toLowerCase());
    int compareArabic(DictionaryEntry a, DictionaryEntry b) =>
        a.arabic.compareTo(b.arabic);

    List<Widget> buildList() {
      final children = <Widget>[];
      final sections = grouped.keys.toList();

      // For default: keep original section order based on first appearance in data
      // For alpha sorts: sort inside each section
      for (final section in sections) {
        final items = List<DictionaryEntry>.from(grouped[section]!);
        if (_sort == DictionarySort.indonesian) {
          items.sort(compareIndonesian);
        } else if (_sort == DictionarySort.arabic) {
          items.sort(compareArabic);
        }

        children.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.paddingS,
              horizontal: AppDimensions.paddingM,
            ),
            color: AppColors.surface,
            child: Text(
              section,
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
                  alpha: AppColors.alphaMedium,
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
                    AppConstants.dictionaryDialogTitle,
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
                      ),
                      onChanged: (v) {
                        setState(() => _query = v.trim());
                      },
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spaceS),
                  DropdownButtonHideUnderline(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingM,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderLight),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusS,
                        ),
                        color: AppColors.surface,
                      ),
                      child: DropdownButton<DictionarySort>(
                        value: _sort,
                        items: [
                          DropdownMenuItem(
                            value: DictionarySort.defaultOrder,
                            child: Text(
                              AppConstants.dictionarySortDefault,
                              style: AppTextStyles.bodyMedium,
                            ),
                          ),
                          DropdownMenuItem(
                            value: DictionarySort.indonesian,
                            child: Text(
                              AppConstants.dictionarySortByIndonesian,
                              style: AppTextStyles.bodyMedium,
                            ),
                          ),
                          DropdownMenuItem(
                            value: DictionarySort.arabic,
                            child: Text(
                              AppConstants.dictionarySortByArabic,
                              style: AppTextStyles.bodyMedium,
                            ),
                          ),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => _sort = val);
                        },
                        icon: const Icon(
                          Icons.sort,
                          color: AppColors.textSecondary,
                        ),
                      ),
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
