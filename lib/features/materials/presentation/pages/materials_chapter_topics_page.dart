import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routes/app_routes.dart';

class MaterialsChapterTopicsPage extends StatelessWidget {
  const MaterialsChapterTopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chapter = Get.parameters['chapter'] ?? '1';
    final kinds = _materialKinds();

    return Scaffold(
      appBar: AppBar(title: Text('Bab $chapter')),
      drawer: const AppDrawer(),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        itemCount: kinds.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppDimensions.spaceS),
        itemBuilder: (context, index) {
          final k = kinds[index];
          return ListTile(
            leading: Icon(k.icon, color: k.color),
            title: Text(k.title, style: AppTextStyles.bodyLarge),
            subtitle: Text(k.subtitle, style: AppTextStyles.bodySmall),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.toNamed('${AppRoutes.materialsKindDetail}/$chapter/${k.key}'),
          );
        },
      ),
    );
  }

  List<_KindItem> _materialKinds() => const [
        _KindItem('qiroah', "Qiro'ah", 'Pemahaman bacaan', Icons.menu_book, AppColors.primary),
        _KindItem('kitabah', 'Kitabah', 'Menulis', Icons.edit, AppColors.arabicGreen),
        _KindItem('mahfudzot', 'Mahfudzot', 'Hafalan', Icons.library_books, AppColors.info),
        _KindItem('qowaid', 'Qowaid', 'Tata bahasa', Icons.rule, AppColors.warning),
        _KindItem('istima', 'Istima\'\'', 'Menyimak', Icons.hearing, AppColors.primaryDark),
        _KindItem('kalam', 'Kalam', 'Berbicara', Icons.record_voice_over, AppColors.success),
      ];
}

class _KindItem {
  final String key;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  const _KindItem(this.key, this.title, this.subtitle, this.icon, this.color);
}
