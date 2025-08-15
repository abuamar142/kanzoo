import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';
import '../base_section_title.dart';

class SectionTable extends StatelessWidget {
  final String title;
  final List<List<String>> tableData;
  final List<String>? headers;
  final double fontScale;
  final bool hasArabicContent;

  const SectionTable({
    super.key,
    required this.title,
    required this.tableData,
    this.headers,
    this.fontScale = 1.0,
    this.hasArabicContent = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseSectionTitle(title: title),
        const SizedBox(height: AppDimensions.spaceM),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderLight),
            borderRadius: BorderRadius.circular(AppDimensions.radiusS),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: TableBorder.all(
                color: AppColors.borderLight,
                width: AppDimensions.strokeWidthThin / 2,
              ),
              headingRowColor: WidgetStateProperty.all(
                AppColors.primary.withAlpha((AppColors.alpha10 * 255).round()),
              ),
              columns: _buildColumns(),
              rows: _buildRows(),
            ),
          ),
        ),
      ],
    );
  }

  List<DataColumn> _buildColumns() {
    if (headers != null && headers!.isNotEmpty) {
      return headers!.map((header) {
        return DataColumn(
          label: Expanded(
            child: Text(
              header,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: (AppTextStyles.bodyMedium.fontSize ?? 14) * fontScale,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList();
    }

    // Default columns based on first row
    if (tableData.isNotEmpty) {
      return List.generate(tableData.first.length, (index) {
        return DataColumn(
          label: Expanded(
            child: Text(
              'Kolom ${index + 1}',
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: (AppTextStyles.bodyMedium.fontSize ?? 14) * fontScale,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      });
    }

    return [];
  }

  List<DataRow> _buildRows() {
    return tableData.map((row) {
      return DataRow(
        cells: row.map((cell) {
          final hasArabic = _hasArabic(cell);
          final hasLatinOrDigit = _hasLatinOrDigit(cell);
          final isPureArabic = hasArabic && !hasLatinOrDigit;

          return DataCell(
            SizedBox(
              width: double.infinity,
              child: Text(
                cell,
                style: isPureArabic
                    ? AppTextStyles.arabicText.copyWith(
                        fontSize:
                            (AppTextStyles.arabicText.fontSize ?? 18) *
                            fontScale,
                      )
                    : AppTextStyles.bodyMedium.copyWith(
                        fontSize:
                            (AppTextStyles.bodyMedium.fontSize ?? 14) *
                            fontScale,
                      ),
                textDirection: isPureArabic
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                textAlign: isPureArabic ? TextAlign.right : TextAlign.left,
              ),
            ),
          );
        }).toList(),
      );
    }).toList();
  }

  bool _hasArabic(String s) {
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

  bool _hasLatinOrDigit(String s) {
    return RegExp(r'[A-Za-z0-9]').hasMatch(s);
  }
}
