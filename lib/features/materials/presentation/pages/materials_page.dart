import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/materials/base_material_item.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/data/materials_data.dart';

class MaterialsPage extends StatelessWidget {
  const MaterialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.materialsTitle)),
      drawer: const AppDrawer(),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        itemCount: MaterialsData.topics.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppDimensions.spaceM),
        itemBuilder: (context, index) {
          final t = MaterialsData.topics[index];
          return BaseMaterialItem(
            title: t.title,
            subtitle: t.description,
            icon: Icons.menu_book,
            onTap: () => Get.toNamed('${AppRoutes.materialDetail}/${t.id}'),
          );
        },
      ),
    );
  }
}

