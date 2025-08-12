import '../../core/constants/app_constants.dart';
import '../models/material_topic.dart';

class MaterialsData {
  static final List<MaterialTopic> topics = [
    MaterialTopic(
      id: 'intro',
      title: AppConstants.dictionarySectionIntroduction,
      description:
          'Mempelajari kata ganti orang (أنا, أنتَ, أنتِ, هو, هي, نحن, أنتم, هم) beserta penggunaannya dalam kalimat sederhana.',
    ),
    MaterialTopic(
      id: 'demo',
      title: AppConstants.dictionarySectionDemonstratives,
      description:
          'Mengenal kata tunjuk (هذا/هذه, ذلك/تلك) dan keterangan tempat (هنا, هناك) dalam konteks percakapan.',
    ),
    MaterialTopic(
      id: 'numbers',
      title: 'Angka',
      description: 'Pengenalan angka dasar dalam Bahasa Arab dan cara membacanya.',
    ),
    MaterialTopic(
      id: 'family',
      title: 'Keluarga',
      description: 'Kosakata keluarga dan contoh kalimat yang sering digunakan.',
    ),
  ];

  static MaterialTopic? byId(String id) {
    try {
      return topics.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }
}

