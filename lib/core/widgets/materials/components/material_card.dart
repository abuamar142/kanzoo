import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';

class MaterialCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;
  final VoidCallback onTap;
  final bool isEnabled;

  const MaterialCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colors,
    required this.onTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColors = isEnabled
        ? colors
        : [AppColors.borderLight, AppColors.textHint];
    final opacity = isEnabled ? 1.0 : 0.6;

    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spaceM),
      child: Opacity(
        opacity: opacity,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            onTap: isEnabled ? onTap : null,
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.paddingM),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                border: Border.all(
                  color: isEnabled ? AppColors.borderLight : AppColors.textHint,
                ),
                boxShadow: isEnabled
                    ? [
                        BoxShadow(
                          color: AppColors.shadowColor.withValues(
                            alpha: AppColors.alpha05,
                          ),
                          blurRadius: AppDimensions.spaceS,
                          offset: const Offset(0, AppDimensions.spaceXS),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: effectiveColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: isEnabled
                          ? [
                              BoxShadow(
                                color: effectiveColors[0].withValues(
                                  alpha: AppColors.alpha30,
                                ),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : null,
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.surface,
                      size: AppDimensions.iconM,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spaceM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isEnabled
                                ? AppColors.textPrimary
                                : AppColors.textHint,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spaceXS),
                        Text(
                          subtitle,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: isEnabled
                                ? AppColors.textSecondary
                                : AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.paddingXS),
                    decoration: BoxDecoration(
                      color: effectiveColors[0].withValues(
                        alpha: AppColors.alpha10,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusS,
                      ),
                    ),
                    child: Icon(
                      isEnabled ? Icons.chevron_right : Icons.lock,
                      color: effectiveColors[0],
                      size: AppDimensions.iconS,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
