import '../../../models/base/dialog_line.dart';
import '../../../models/base/dialog_section.dart';
import '../../../models/base/image_section.dart';
import '../../../models/base/material_section.dart';
import '../../../models/base/paragraph_section.dart';
import '../../../models/base/subtitle_section.dart';
import '../../../models/base/title_section.dart';
import '../../../models/material_content.dart';

class Bab1KalamData {
  static final List<MaterialSection> sections = [
    TitleSection('1. Praktik Percakapan'),
    SubtitleSection(
      'Praktikkanlah percakapan berikut di depan kelas dengan temanmu. Kemudian Ganti nama azam dan Naufal dengan namamu sendiri.',
    ),
    ImageSection(
      imagePath: 'assets/materials/kalam/1.png',
      caption: 'Gambar percakapan perkenalan diri',
    ),
    DialogSection([
      DialogLine(speaker: 'عَزَّام', text: 'السَّلَامُ عَلَيْكُمْ .'),
      DialogLine(speaker: 'نَوْفَل', text: 'وَعَلَيْكُمُ السَّلَام .'),
      DialogLine(speaker: 'عَزَّامِ', text: 'أَهْلًا وَسَهْلًا .'),
      DialogLine(speaker: 'نَوْفَل', text: 'أَهْلًا بِكَ .'),
      DialogLine(speaker: 'عَزَّام', text: 'اِسْمِي عَزَّام . مَا اسْمُكَ ؟'),
      DialogLine(speaker: 'نَوْفَل', text: 'اسْمِي نَوْفَل'),
      DialogLine(speaker: 'عَزَّامِ', text: 'كَيْفَ حَالُكَ ؟'),
      DialogLine(
        speaker: 'نَوْفَل',
        text: 'بِخَيْرٍ ، الْحَمْدُ لِلَّهِ . وَأَنْتَ ؟',
      ),
      DialogLine(speaker: 'عَزَّام', text: 'بِخَيْرٍ ، الْحَمْدُ لِلَّه .'),
      DialogLine(speaker: 'نَوْفَل', text: 'مِنْ أَيْنَ أَنْتَ يَا عَزَّام ؟'),
      DialogLine(
        speaker: 'عَزَّامِ',
        text: 'أَنَا مِنْ جُوْبَانج جَاوَا الشَّرْقِيَّة',
      ),
      DialogLine(speaker: 'نَوْفَل', text: 'هَلْ أَنْتَ جُوْبَانجي ؟'),
      DialogLine(
        speaker: 'عَزَّامِ',
        text: 'نَعَمْ ، أَنَا جُوْبَانجي. وَمِنْ أَيْنَ أَنْتَ يَا نَوْفَل ؟',
      ),
      DialogLine(
        speaker: 'نَوْفَل',
        text:
            'أَنَا كَادِيْرِيُّ . أَنَا مِنْ كَادِيْرِي جَاوَى الشَّرْقِيَّة.',
      ),
      DialogLine(
        speaker: 'عَزَّام',
        text:
            'هَذَا أَخِي . اِسْمُهُ مَحْمُود . هُوَ مُدَرِّسٌ . هُوَ مِنْ سُوْرَابَايَا .',
      ),
      DialogLine(
        speaker: 'نَوْفَل',
        text: 'أَهْلًا وَسَهْلًا يَا مَحْمُود . وَمَنْ هَذَا يَا عَزَّام ؟',
      ),
      DialogLine(
        speaker: 'عَزَّامِ',
        text:
            'هَذَا صَدِيقِى . اسْمُه أَحْمَد . هُوَ طَبِيْبٌ . هُوَ مِنْ مَالاَنج .',
      ),
      DialogLine(speaker: 'نَوْفَل', text: 'أَهْلًا وَسَهْلًا يَا أَحْمَد'),
    ]),
    TitleSection('2. Latihan Membuat Kalimat'),
    SubtitleSection(
      'Buatlah kalimat sederhana menggunakan kosakata di bawah ini!',
    ),
    ParagraphSection([
      'أ. طَالِبٌ',
      'ب. بَيْتٌ',
      'ج. فَصْلٌ',
      'د. مَدْرَسَةٌ',
    ], isArabicParagraph: true),
  ];
}

MaterialContent get kalamBab1Content =>
    MaterialContent(Bab1KalamData.sections);
