import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import 'app_dialogs.dart';
import 'drawer/base_drawer_header.dart';
import 'drawer/base_drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const BaseDrawerHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  BaseDrawerItem(
                    icon: Icons.menu_book,
                    title: AppConstants.drawerMaterials,
                    subtitle: AppConstants.materialsSubtitle,
                    onTap: () {
                      Navigator.of(context).pop();
                      if (Get.currentRoute == AppRoutes.home) {
                        Get.toNamed(AppRoutes.materials);
                      } else if (Get.currentRoute != AppRoutes.materials) {
                        Get.offNamed(AppRoutes.materials);
                      }
                    },
                  ),
                  BaseDrawerItem(
                    icon: Icons.translate,
                    title: AppConstants.drawerMufrodat,
                    subtitle: 'Popup akses cepat',
                    onTap: () {
                      Navigator.of(context).pop();
                      AppDialogs.showMufrodat(context);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingM),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.info, color: AppColors.primary),
                  label: Text(AppConstants.drawerAbout),
                  onPressed: () {
                    Navigator.of(context).pop();
                    AppDialogs.showAboutApp(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primary),
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.paddingS,
                      horizontal: AppDimensions.paddingM,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
