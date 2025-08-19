import '../../../models/mufrodat_models.dart';
import 'kata_utama_bab2.dart';
import 'jenis_madrasah.dart';
import 'fasilitas_madrasah.dart';
import 'kata_sifat.dart';
import 'kata_keterangan_tempat.dart';

class Bab2MufrodatData {
  static const List<CategoryMufrodat> categories = [
    CategoryMufrodat('Kata Utama', kataUtamaBab2),
    CategoryMufrodat('Jenis-jenis Madrasah', jenisMadrasah),
    CategoryMufrodat('Fasilitas di Madrasah', fasilitasMadrasah),
    CategoryMufrodat('Kata Sifat', kataSifat),
    CategoryMufrodat('Kata Keterangan Tempat', kataKeteranganTempat),
  ];

  // Get all mufrodat items for this chapter
  static List<ItemMufrodat> get allItems {
    return categories.expand((category) => category.items).toList();
  }
}
