import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class BreadcrumbItem {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isActive;

  const BreadcrumbItem({
    required this.label,
    this.icon,
    this.onTap,
    this.isActive = false,
  });
}

class AppBreadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final Color? backgroundColor;
  final bool showBackground;

  const AppBreadcrumb({
    super.key,
    required this.items,
    this.backgroundColor,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: showBackground
          ? BoxDecoration(
              color: backgroundColor ?? AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
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
            )
          : null,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: _buildBreadcrumbItems(),
      ),
    );
  }

  List<Widget> _buildBreadcrumbItems() {
    final List<Widget> widgets = [];

    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final isLast = i == items.length - 1;

      // Add breadcrumb item
      widgets.add(_BreadcrumbItemWidget(item: item, isLast: isLast));

      // Add separator if not last item
      if (!isLast) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceS,
            ),
            child: Icon(
              Icons.chevron_right,
              size: AppDimensions.iconS,
              color: AppColors.textSecondary,
            ),
          ),
        );
      }
    }

    return widgets;
  }
}

class _BreadcrumbItemWidget extends StatelessWidget {
  final BreadcrumbItem item;
  final bool isLast;

  const _BreadcrumbItemWidget({required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final isClickable = item.onTap != null && !isLast;

    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item.icon != null) ...[
          Icon(
            item.icon,
            size: AppDimensions.iconS,
            color: isLast
                ? AppColors.primary
                : isClickable
                ? AppColors.textPrimary
                : AppColors.textSecondary,
          ),
          const SizedBox(width: AppDimensions.spaceXS),
        ],
        Text(
          item.label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isLast
                ? AppColors.primary
                : isClickable
                ? AppColors.textPrimary
                : AppColors.textSecondary,
            fontWeight: isLast ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );

    if (isClickable) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
          onTap: item.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.paddingXS,
              horizontal: AppDimensions.paddingS,
            ),
            child: child,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.paddingXS,
        horizontal: AppDimensions.paddingS,
      ),
      child: child,
    );
  }
}
