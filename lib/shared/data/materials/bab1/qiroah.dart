import '../../../models/base/image_section.dart';
import '../../../models/base/material_section.dart';
import '../../../models/base/paragraph_section.dart';
import '../../../models/base/subtitle_section.dart';
import '../../../models/base/title_section.dart';
import '../../../models/material_content.dart';

class Bab1QiroahData {
  static final List<MaterialSection> sections = [
    TitleSection("Qiro'ah"),
    ImageSection(
      imagePath: 'assets/materials/qiroah/1.png',
      caption: 'Ilustrasi sekolah dan profesi di lingkungan sekolah',
    ),
    ParagraphSection([
      'اسْمِي فَارُوْقٌ ، أَنَا طَالِبٌ فِي هَذِهِ الْمَدْرَسَةِ . وَهَذَا أَخِي ، اِسْمُهُ صَالِحٌ ، هُوَ طَالِب . وَهَذِهِ صَدِيقَتِي ، اِسْمُهَا فِطْرِيَةُ ، هِيَ طَالِبَة . تِلْكَ مُدَرِّسَتِي ، اِسْمُهَا الْأُسْتَاذَةِ نَفِيسَةُ ، هِيَ مُدَرِّسَةُ اللُّغَةِ الْعَرَبِيَّة . وَذَلِكَ الْأُسْتَاذِ مَنْصُورٌ ، هُوَ نَاظِرُ الْمَدْرَسَةِ.',
      'انْظُرْ ! ذَلِكَ السَّيِّدُ عُمَرُ ، هُوَ أَمِينُ المَكْتَبَةِ فِي هَذِهِ الْمَدْرَسَةِ . وَتِلْكَ السَّيِّدَةُ حَفْصَةُ ، هِيَ مُوَظَّفَةٌ فِي الْمَكْتَبَةِ . وَهَذَا بَائِعٌ ، اِسْمُهُ السَّيِّدُ خَالِصٌ . وَهَذِهِ بَائِعَةٌ ، اِسْمُهَا السَّيِّدَةُ فَاطِمَةُ ، وذَلِكَ سَائِقُ ، السَّائِقُ اسْمُهُ السَّيِّدُ حَفِيظٌ . أَنْظُرْ أَيْضًا ! ذَلِكَ بَوَّابٌ ، اِسْمُهُ السَّيِّدُ مَسْعُودٌ ، هُوَ مِنْ سُوْرَابَايَا .وَتِلْكَ خَادِمَةٌ ، اِسْمُهَا نَبِيْلَةُ ، هِيَ مِنْ بَانْدُونْج',
    ], isArabicParagraph: true),
    TitleSection("Tugas Individu"),
    SubtitleSection(
      'Jawablah pertanyaan-pertanyaan di bawah ini dengan benar!',
    ),
    ParagraphSection([
      '١. مَا اسْمُ الطَّالِبِ ؟',
      '٢. مَن صَالِح ؟',
      '٣. مَنْ الْأَسْتَاذَةِ نَفِيسَة ؟',
      '٤. مَا اسْمُ نَاظِرِ الْمَدْرَسَة ؟',
      '٥. مَنْ صَدِيقَةُ فَارُوْق ؟',
      '٦. مَنْ السَّيِّد عُمَر ؟',
      '٧. مَا اسْمُ الْمُوَظَّفَة فِي الْمَكْتَبَة ؟',
      '٨. من السَّيِّد مَسْعُود ؟ مِنْ أَيْنَ هُوَ ؟',
      '٩. مَا اسْمُ الْخَادِمَة مِنْ بَانْدُوْنِجِ ؟',
      '١٠. مَا اسْمُ السَّائِقِ ؟',
    ], isArabicParagraph: true),
    TitleSection("Tugas Kelompok"),
    ParagraphSection([
      '1) Carilah dhamir munfashil pada bacaan di atas!',
      '2) Tulislah bersama teman di buku tulis masing-masing!',
      '3) Kumpulkan pada guru untuk dinilai!',
    ]),
  ];
}

MaterialContent get qiroahBab1Content =>
    MaterialContent(Bab1QiroahData.sections);
