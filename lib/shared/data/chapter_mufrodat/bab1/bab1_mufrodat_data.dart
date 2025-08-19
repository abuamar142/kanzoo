import '../../../models/mufrodat_models.dart';
import 'kata_ganti_nama.dart';
import 'kata_tunjuk_profesi.dart';
import 'kata_utama_bab1.dart';
import 'kata_sapaan.dart';
import 'kata_tanya.dart';
import 'profesi.dart';
import 'arah_mata_angin.dart';

class Bab1MufrodatData {
  static const List<CategoryMufrodat> categories = [
    CategoryMufrodat('Kata Ganti Nama', kataGantiNama),
    CategoryMufrodat('Kata Tunjuk dan Profesi', kataTunjukProfesi),
    CategoryMufrodat('Kata Utama', kataUtamaBab1),
    CategoryMufrodat('Kata Sapaan', kataSapaan),
    CategoryMufrodat('Kata Tanya', kataTanya),
    CategoryMufrodat('Profesi', profesi),
    CategoryMufrodat('Arah Mata Angin', arahMataAngin),
  ];

  // Get all mufrodat items for this chapter
  static List<ItemMufrodat> get allItems {
    return categories.expand((category) => category.items).toList();
  }
}
