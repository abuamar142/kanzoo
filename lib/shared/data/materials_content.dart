import '../../core/constants/app_constants.dart';
import '../models/material_content.dart';

class MaterialsContentData {
  static final List<MaterialContent> contents = [
    // Perkenalan
    MaterialContent(
      topicId: 'intro',
      sections: [
        MaterialSection(
          title: AppConstants.materialsSectionIntro,
          paragraphs: [
            'Pada materi ini kamu akan mempelajari kata ganti orang dalam Bahasa Arab. Kata ganti digunakan untuk merujuk pada pelaku atau orang yang dibicarakan.',
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionVocabulary,
          vocab: const [
            MaterialVocab(arabic: 'أنا', indonesian: 'aku / saya'),
            MaterialVocab(arabic: 'أنتَ', indonesian: 'kamu (laki-laki)'),
            MaterialVocab(arabic: 'أنتِ', indonesian: 'kamu (perempuan)'),
            MaterialVocab(arabic: 'هو', indonesian: 'dia (laki-laki)'),
            MaterialVocab(arabic: 'هي', indonesian: 'dia (perempuan)'),
            MaterialVocab(arabic: 'نحن', indonesian: 'kami / kita'),
            MaterialVocab(arabic: 'أنتم', indonesian: 'kalian'),
            MaterialVocab(arabic: 'هم', indonesian: 'mereka'),
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionExamples,
          examples: const [
            MaterialExample(arabic: 'أنا طالبٌ', translation: 'Saya seorang siswa'),
            MaterialExample(arabic: 'أنتِ مجتهدةٌ', translation: 'Kamu (perempuan) rajin'),
            MaterialExample(arabic: 'هو معلمٌ', translation: 'Dia (laki-laki) seorang guru'),
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionNotes,
          paragraphs: [
            'Perhatikan perbedaan bentuk kata ganti untuk laki-laki dan perempuan (أنتَ vs أنتِ).',
          ],
        ),
      ],
    ),

    // Kata Tunjuk
    MaterialContent(
      topicId: 'demo',
      sections: [
        MaterialSection(
          title: AppConstants.materialsSectionIntro,
          paragraphs: [
            'Kata tunjuk digunakan untuk menunjuk benda atau orang yang dekat atau jauh dari pembicara.',
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionVocabulary,
          vocab: const [
            MaterialVocab(arabic: 'هذا', indonesian: 'ini (laki-laki)'),
            MaterialVocab(arabic: 'هذه', indonesian: 'ini (perempuan)'),
            MaterialVocab(arabic: 'ذلك', indonesian: 'itu (laki-laki)'),
            MaterialVocab(arabic: 'تلك', indonesian: 'itu (perempuan)'),
            MaterialVocab(arabic: 'هنا', indonesian: 'di sini'),
            MaterialVocab(arabic: 'هناك', indonesian: 'di sana'),
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionExamples,
          examples: const [
            MaterialExample(arabic: 'هذا كتابٌ', translation: 'Ini sebuah buku (laki-laki)'),
            MaterialExample(arabic: 'هذه مدرسةٌ', translation: 'Ini sebuah sekolah (perempuan)'),
            MaterialExample(arabic: 'ذلك بيتٌ', translation: 'Itu sebuah rumah (laki-laki)'),
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionNotes,
          paragraphs: [
            'Jenis kata benda (mudzakar/muannats) mempengaruhi pemilihan هذا/هذه atau ذلك/تلك.',
          ],
        ),
      ],
    ),

    // Angka
    MaterialContent(
      topicId: 'numbers',
      sections: [
        MaterialSection(
          title: AppConstants.materialsSectionIntro,
          paragraphs: [
            'Angka dasar 1–10 dalam Bahasa Arab sering digunakan di kehidupan sehari-hari.',
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionVocabulary,
          vocab: const [
            MaterialVocab(arabic: 'واحد', indonesian: 'satu'),
            MaterialVocab(arabic: 'اثنان', indonesian: 'dua'),
            MaterialVocab(arabic: 'ثلاثة', indonesian: 'tiga'),
            MaterialVocab(arabic: 'أربعة', indonesian: 'empat'),
            MaterialVocab(arabic: 'خمسة', indonesian: 'lima'),
            MaterialVocab(arabic: 'ستة', indonesian: 'enam'),
            MaterialVocab(arabic: 'سبعة', indonesian: 'tujuh'),
            MaterialVocab(arabic: 'ثمانية', indonesian: 'delapan'),
            MaterialVocab(arabic: 'تسعة', indonesian: 'sembilan'),
            MaterialVocab(arabic: 'عشرة', indonesian: 'sepuluh'),
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionExamples,
          examples: const [
            MaterialExample(arabic: 'عندي ثلاثة أقلام', translation: 'Saya punya tiga pena'),
            MaterialExample(arabic: 'هو في الصف الخامس', translation: 'Dia di kelas lima'),
          ],
        ),
      ],
    ),

    // Keluarga
    MaterialContent(
      topicId: 'family',
      sections: [
        MaterialSection(
          title: AppConstants.materialsSectionIntro,
          paragraphs: [
            'Kosakata keluarga membantu memperkenalkan anggota keluarga dalam percakapan.',
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionVocabulary,
          vocab: const [
            MaterialVocab(arabic: 'أب', indonesian: 'ayah'),
            MaterialVocab(arabic: 'أم', indonesian: 'ibu'),
            MaterialVocab(arabic: 'أخ', indonesian: 'saudara laki-laki'),
            MaterialVocab(arabic: 'أخت', indonesian: 'saudara perempuan'),
            MaterialVocab(arabic: 'جد', indonesian: 'kakek'),
            MaterialVocab(arabic: 'جدة', indonesian: 'nenek'),
          ],
        ),
        MaterialSection(
          title: AppConstants.materialsSectionExamples,
          examples: const [
            MaterialExample(arabic: 'هذه أمي', translation: 'Ini ibuku'),
            MaterialExample(arabic: 'ذلك أبي', translation: 'Itu ayahku'),
          ],
        ),
      ],
    ),
  ];

  static MaterialContent? byTopicId(String id) {
    try {
      return contents.firstWhere((e) => e.topicId == id);
    } catch (_) {
      return null;
    }
  }
}

