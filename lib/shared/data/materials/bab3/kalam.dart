import '../../../models/base/dialog_line.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_dialog.dart';
import '../../../models/templates/section_one.dart';

SimpleMaterialContent get kalamBab3Content => SimpleMaterialContent([
  SectionDialog(
    '1. Praktik Percakapan',
    'Praktikkanlah percakapan berikut di depan kelas dengan temanmu. Kemudian Ganti nama Barizah dan Izzah dengan namamu sendiri.',
    [
      DialogLine(speaker: 'بَارِزَة', text: 'السَّلَامُ عَلَيْكُم .'),
      DialogLine(speaker: 'عزَّة', text: 'وَعَلَيْكُمُ السَّلَام .'),
      DialogLine(
        speaker: 'بَارِزَة',
        text: 'يَا عِزَّة ! أَنْظُرِي إِلَى هَذِهِ الصُّوْرَة ؟',
      ),
      DialogLine(speaker: 'عزَّة', text: 'مَاذَا يَا بَارِزَة ؟'),
      DialogLine(speaker: 'بَارِزَة', text: 'هَذَا فَصْلِي .'),
      DialogLine(
        speaker: 'عِزَّةِ',
        text:
            'هَلْ هَذَا فَصْلُكِ يَا بَارِزَة ؟ سُبْحَانَ الله ... فَصْلُكِ وَاسِعٌ وَجَمِيلٌ .',
      ),
      DialogLine(
        speaker: 'بَارِزَة',
        text:
            'نَعَمْ يَا عِزَّةُ، هَذَا فَصْلِي فَصْلِي وَاسِعٌ وَجَمِيلٌ وَمِثَالِيُّ لِلتَّدْرِيس .',
      ),
      DialogLine(
        speaker: 'عِزَّة',
        text: 'مَا شَاءَ اللهُ ، فَصْلُكِ مِثَالِيُّ لِلتَّدْرِيس ؟',
      ),
      DialogLine(speaker: 'بَارِزَة', text: 'طَبْعًا يَا عِزَّةُ !'),
      DialogLine(
        speaker: 'عِزَّة',
        text: 'كَيْفَ صَارَ فَصْلُكَ مِثَالِيًّا ؟',
      ),
      DialogLine(
        speaker: 'بَارِزَة',
        text:
            'لَهُ بَابٌ وَاسِعٌ، وَهُوَ مَفْرُوسٌ بِبِساط ، وَبِطَاقَةٌ، وَمُكَيِّفٌ، وَتَقْوِيمُ وَجَرَسٌ، وفِي حَائِطُهُ خَرِيْطَةٌ لِلْعَالَمِ، وَصُوَرٌ تَعْلِيمِيَّةٌ، وَرَفٌ، وَجَدْوَل الدُّرُوسِ، وَسَاعَةٌ حَائِطِيَّةٌ، وَفِيهِ سَبُّوْرَةٌ كَبِيرَةٌ، وَطَبَاشِيرٍ مُلَوَّنةٌ، وَمَسَّاحَةٌ لِلسَّبُوْرَة، وَخِزَانَةٌ لِلْكُتُبِ ، ومُعْجَمٌ، وَمَوْسُوْعَةٌ، وَكَرَاسِيَ مُرِيحَةٌ لِلطُّلابِ، وَمَكْتَبٌ لِلمُعَلِّمِ ، وَكَشْفُ الْحُضُورِ، وَمَجَلَّةٌ حَائِطِيَّةٌ ، وَمُجَسَّمٌ لِلكُرَةِ الأَرْضِيَّةِ ، وَبِرُوْجِكْتُرْ، وَمَصَابِيحُ، وَنَافِذَتَانِ.',
      ),
      DialogLine(
        speaker: 'عِزَّة',
        text: 'فَصْلُكِ جَيِّدٌ جِدًّا يَا بَارِزَ',
      ),
    ],
  ),
  SectionOne('2. Latihan Membuat Kalimat', [
    'Buatlah kalimat sederhana menggunakan kosakata di bawah ini!',
    'أ. طَلاَّسَةٌ',
    'ب. مَوْسُوْعَةٌ',
    'ج. خَرِيْطَةٌ',
  ]),
]);
