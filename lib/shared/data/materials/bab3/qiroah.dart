import '../../../models/base/image_section.dart';
import '../../../models/base/material_section.dart';
import '../../../models/base/paragraph_section.dart';
import '../../../models/base/title_section.dart';
import '../../../models/simple_material_content.dart';

class Bab3QiroahData {
  static final List<MaterialSection> sections = [
    TitleSection("Qiro'ah"),
    ImageSection(
      imagePath: 'assets/materials/qiroah/3.png',
      caption: 'Berbelanja peralatan sekolah',
    ),
    ParagraphSection([
      'الشَّرَاءُ فِي دُكَّانِ الْأَدَوَاتِ الْمَدْرَسِيَّةِ',
    ], isArabicParagraph: true),
    ParagraphSection([
      'زَيْدٌ طَالِبٌ مَاهِرٌ فِي الْفَصْلِ السَّابِعِ بِالْمَدْرَسَةِ الْمُتَوَسِّطَةِ الْإِسْلَامِيَّةِ الْحُكُوْمِيَّةِ. فِي يَوْمٍ أَخِيْرٍ لِلْعُطْلَةِ الطَّوِيلَةِ. يُرِيدُ زَيْدٌ أَنْ يَشْتَرِيَ الْأَدَوَاتِ الْمَدْرَسِيَّةَ الْكَثِيرَةَ لِلتَّعَلُّمِ فِي الْمَدْرَسَةِ وَالْبَيْتِ فَيَذْهَبُ زَيْدٌ إِلَى دُكَّانِ الْأَدَوَاتِ الْمَدْرَسِيَّةِ مَعَ أَبِيْهِ وَأُمِّهِ بِالسَّيَّارَةِ. بَعْدَ الْوُصُولُ إِلَى دُكَّانِ الأَدَوَاتِ الْمَدْرَسِيَّةِ ، يَشْتَرِي زَيْدٌ الْمِقْلَمَةَ الْحَمْرَاءَ وَالْحِذَاءَ الْأَسْوَدَ وَالْجَوْرَبَ الْأَبْيَضَ وَالْحَقِيبَةَ الْزَرْقَاءَ. مَا اشْتَرَى زَيْدٌ الْمِبْرَاةَ وَالْمِمْحَاةَ الْبَيْضَاءَ وَالْمِسْطَرَةَ الخَضْرَاءَ وَالْقَلَمَ الْأَسْوَدَ وَالْكُرَّاسَةَ لِأَنَّ الْأَدَوَاتِ مَوْجُوْدَةٌ فِي الْبَيْتِ.',
    ], isArabicParagraph: true),
    ParagraphSection([
      'في الْيَوْمِ التَّالِي، قَبْلَ الذَّهَابِ إِلَى الْمَدْرَسَةِ يَسْتَعِدُّ زَيْدٌ الْأَدَوَاتِ الْمَدْرَسِيَّةَ وَيَضَعُهَا فِي حَقِيبَتِهِ الزَّرْقَاءِ. وَبَعْدَ الرُّجُوْعِ مِنَ الْمَدْرَسَةِ، يَضَعُ وَيُرَتِّبُ زَيْدُ الْأَدَوَاتِ الْمَدْرَسِيَّةِ فِي غُرْفَةِ الْمُذَاكَرَةِ. وَيَضَعُ الْكُتُبَ فِي رَفِّ كُتُب . يُحَافِظُ زَيْدٌ عَلَى الْأَدَوَاتِ الْمَدْرَسِيَّةِ بِجَيِّدٍ. هُوَ يَشْكُرُ لِوَالِدَيْهِ عَلَى شِرَاءِ الْأَدَوَاتِ الْمَدْرَسِيَّةِ الْجَدِيدَةِ.',
    ], isArabicParagraph: true),
    TitleSection("Tugas Individu"),
    ParagraphSection([
      'Jawablah pertanyaan-pertanyaan di bawah ini dengan benar!',
    ]),
    ParagraphSection([
      '١. فِي أَيِّ فَصْلٍ يَدْرُسُ زَيْدٌ؟',
      '٢. أَيْنَ اشْتَرَى زَيْدُ الْحِذَاءَ وَالْجَوْرَبَ؟',
      '٣. مَا لَوْنُ جَوْرَبِ زَيْدٍ ؟',
      '٤. هَلْ لَوْنُ حَقِيبَةِ زَيْدٍ أَحْمَرُ ؟',
      '٥. بِمَنِ اشْتَرَى زَيْدٌ الْأَدَوَاتِ الْمَدْرَسِيَّةِ؟',
    ], isArabicParagraph: true),
    TitleSection("Tugas Kelompok"),
    ParagraphSection([
      '1) Sebutkan macam-macam warna pada bacaan di atas!',
      '2) Tulislah beserta artinya bersama teman di buku tulis masing-masing!',
      '3) Kumpulkan pada guru untuk dinilai!',
    ]),
  ];
}

SimpleMaterialContent get qiroahBab3Content =>
    SimpleMaterialContent(Bab3QiroahData.sections);
