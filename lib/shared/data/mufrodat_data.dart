import '../models/mufrodat_models.dart';
import 'mufrodat/arah_mata_angin.dart';
import 'mufrodat/kata_ganti.dart';
import 'mufrodat/kata_sapaan.dart';
import 'mufrodat/kata_sifat.dart';
import 'mufrodat/kata_tanya.dart';
import 'mufrodat/peralatan_sekolah.dart';
import 'mufrodat/profesi.dart';
import 'mufrodat/warna.dart';

class MufrodatData {
  static const List<CategoryMufrodat> categories = [
    CategoryMufrodat('Kata Sapaan', kataSapaan),
    CategoryMufrodat('Kata Tanya', kataTanya),
    CategoryMufrodat('Kata Ganti', kataGanti),
    CategoryMufrodat('Profesi', profesi),
    CategoryMufrodat('Arah Mata Angin', arahMataAngin),
    CategoryMufrodat('Kata Sifat', kataSifat),
    CategoryMufrodat('Warna', warna),
    CategoryMufrodat('Peralatan Sekolah', peralatanSekolah),
  ];

  // Flatten semua item menjadi satu list
  static List<ItemMufrodat> get items {
    return categories.expand((category) => category.items).toList();
  }
}
