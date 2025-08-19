import '../../../models/mufrodat_models.dart';
import 'kata_utama_bab3.dart';
import 'peralatan_sekolah.dart';
import 'perangkat_kelas.dart';
import 'warna.dart';

class Bab3MufrodatData {
  static const List<CategoryMufrodat> categories = [
    CategoryMufrodat('Kata Utama', kataUtamaBab3),
    CategoryMufrodat('Peralatan Sekolah', peralatanSekolah),
    CategoryMufrodat('Perangkat Kelas', perangkatKelas),
    CategoryMufrodat('Warna', warna),
  ];

  // Get all mufrodat items for this chapter
  static List<ItemMufrodat> get allItems {
    return categories.expand((category) => category.items).toList();
  }
}
