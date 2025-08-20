import '../../../models/material_content.dart';

final MaterialContent kalamBab3 = MaterialContent(
  topicId: 'kalam_bab3',
  kind: 'kalam',
  chapter: 3,
  sections: [
    MaterialSection(
      title: '1. Praktik Percakapan',
      type: MaterialSectionType.dialog,
      richSubtitle: MaterialRichText(
        spans: [
          MaterialRichTextSpan(
            text:
                'Praktikkanlah percakapan berikut di depan kelas dengan temanmu. Kemudian Ganti nama ',
          ),
          MaterialRichTextSpan(
            text: 'Barizah',
            color: 'primary',
            isHighlighted: true,
          ),
          MaterialRichTextSpan(text: ' dan '),
          MaterialRichTextSpan(
            text: 'Izzah',
            color: 'primary',
            isHighlighted: true,
          ),
          MaterialRichTextSpan(text: ' dengan namamu sendiri.'),
        ],
      ),
      dialogLines: [
        MaterialDialogLine(speaker: 'بَارِزَة', text: 'السَّلَامُ عَلَيْكُم .'),
        MaterialDialogLine(speaker: 'عزَّة', text: 'وَعَلَيْكُمُ السَّلَام .'),
        MaterialDialogLine(
          speaker: 'بَارِزَة',
          text: 'يَا عِزَّة ! أَنْظُرِي إِلَى هَذِهِ الصُّوْرَة ؟',
        ),
        MaterialDialogLine(speaker: 'عزَّة', text: 'مَاذَا يَا بَارِزَة ؟'),
        MaterialDialogLine(speaker: 'بَارِزَة', text: 'هَذَا فَصْلِي .'),
        MaterialDialogLine(
          speaker: 'عِزَّةِ',
          text:
              'هَلْ هَذَا فَصْلُكِ يَا بَارِزَة ؟ سُبْحَانَ الله ... فَصْلُكِ وَاسِعٌ وَجَمِيلٌ .',
        ),
        MaterialDialogLine(
          speaker: 'بَارِزَة',
          text:
              'نَعَمْ يَا عِزَّةُ، هَذَا فَصْلِي فَصْلِي وَاسِعٌ وَجَمِيلٌ وَمِثَالِيُّ لِلتَّدْرِيس .',
        ),
        MaterialDialogLine(
          speaker: 'عِزَّة',
          text: 'مَا شَاءَ اللهُ ، فَصْلُكِ مِثَالِيُّ لِلتَّدْرِيس ؟',
        ),
        MaterialDialogLine(speaker: 'بَارِزَة', text: 'طَبْعًا يَا عِزَّةُ !'),
        MaterialDialogLine(
          speaker: 'عِزَّة',
          text: 'كَيْفَ صَارَ فَصْلُكَ مِثَالِيًّا ؟',
        ),
        MaterialDialogLine(
          speaker: 'بَارِزَة',
          text:
              'لَهُ بَابٌ وَاسِعٌ، وَهُوَ مَفْرُوسٌ بِبِساط ، وَبِطَاقَةٌ، وَمُكَيِّفٌ، وَتَقْوِيمُ وَجَرَسٌ، وفِي حَائِطُهُ خَرِيْطَةٌ لِلْعَالَمِ، وَصُوَرٌ تَعْلِيمِيَّةٌ، وَرَفٌ، وَجَدْوَل الدُّرُوسِ، وَسَاعَةٌ حَائِطِيَّةٌ، وَفِيهِ سَبُّوْرَةٌ كَبِيرَةٌ، وَطَبَاشِيرٍ مُلَوَّنةٌ، وَمَسَّاحَةٌ لِلسَّبُوْرَة، وَخِزَانَةٌ لِلْكُتُبِ ، ومُعْجَمٌ، وَمَوْسُوْعَةٌ، وَكَرَاسِيَ مُرِيحَةٌ لِلطُّلابِ، وَمَكْتَبٌ لِلمُعَلِّمِ ، وَكَشْفُ الْحُضُورِ، وَمَجَلَّةٌ حَائِطِيَّةٌ ، وَمُجَسَّمٌ لِلكُرَةِ الأَرْضِيَّةِ ، وَبِرُوْجِكْتُرْ، وَمَصَابِيحُ، وَنَافِذَتَانِ.',
        ),
        MaterialDialogLine(
          speaker: 'عِزَّة',
          text: 'فَصْلُكِ جَيِّدٌ جِدًّا يَا بَارِزَ',
        ),
      ],
    ),
    MaterialSection(
      title: '2. Latihan Membuat Kalimat',
      type: MaterialSectionType.one,
      paragraphs: [
        'Buatlah kalimat sederhana menggunakan kosakata di bawah ini!',
        'أ. طَلاَّسَةٌ',
        'ب. مَوْسُوْعَةٌ',
        'ج. خَرِيْطَةٌ',
      ],
    ),
  ],
);
