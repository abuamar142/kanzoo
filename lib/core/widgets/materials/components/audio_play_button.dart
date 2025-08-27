import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';

class AudioPlayButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isPlaying;
  final bool isCurrentFile;

  const AudioPlayButton({
    super.key,
    required this.onTap,
    required this.isPlaying,
    required this.isCurrentFile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingS),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppDimensions.radiusCircular),
        ),
        child: Icon(
          isPlaying && isCurrentFile ? Icons.pause : Icons.play_arrow,
          color: AppColors.background,
          size: AppDimensions.iconM,
        ),
      ),
    );
  }
}
