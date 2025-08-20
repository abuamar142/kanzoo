import '../../../models/material_content.dart';

class Bab2KalamData {
  static final MaterialContent content = MaterialContent(
    topicId: 'kalam_bab2',
    kind: 'kalam',
    chapter: 2,
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
              text: 'Syarif',
              color: 'primary',
              isHighlighted: true,
            ),
            MaterialRichTextSpan(text: ' dan '),
            MaterialRichTextSpan(
              text: 'Musa',
              color: 'primary',
              isHighlighted: true,
            ),
            MaterialRichTextSpan(text: ' dengan namamu sendiri.'),
          ],
        ),
        dialogLines: [
          MaterialDialogLine(
            speaker: 'شَرِيْفٌ',
            text: 'السَّلَامُ عَلَيْكُمْ.',
          ),
          MaterialDialogLine(
            speaker: 'مُوْسَى',
            text: 'وَعَلَيْكُمُ السَّلَامُ.',
          ),
          MaterialDialogLine(
            speaker: 'شَرِيْفٌ',
            text: 'أَيْنَ تَدْرُسُ الْآنَ، يَا مُوسَى؟',
          ),
          MaterialDialogLine(
            speaker: 'مُوسَى',
            text:
                'أَدْرُسُ الْآنَ فِي الْمَدْرَسَةِ الْمُتَوَسِّطَةِ الْإِسْلَامِيَّةِ دَارُ النَّجَاحِ بِسُوْرَا بَايَا .',
          ),
          MaterialDialogLine(
            speaker: 'شَرِيْفٌ',
            text:
                'هَلِ الْمَرَافِقُ الْمَدْرَسِيَّةُ فِي مَدْرَسَتِكَ كَامِلَةٌ؟',
          ),
          MaterialDialogLine(
            speaker: 'مُوسَى',
            text:
                'نَعَمُ الْمَرَافِقُ الْمَدْرَسِيَّةُ فِي مَدْرَسَتِيْ كَامِلَةٌ.',
          ),
          MaterialDialogLine(speaker: 'شَرِيْفٌ', text: 'مَا هِيَ ؟'),
          MaterialDialogLine(
            speaker: 'مُوسَى',
            text:
                'هِيَ فُصُولٌ وَمَعْمَلٌ وَمَكْتَبَةٌ وَمَقْصَفٌ وَحَمَّامَاتٌ وَمَيْدَانٌ وَمَسْجِدٌ وَغُرْفَةُ السُّؤُوْنِ الْإِدَارِيَّةِ وَغُرْفَةُ الْمُدَرِّسِينَ وَغُرْفَةُ الصِّحَّةِ.',
          ),
          MaterialDialogLine(
            speaker: 'شَرِيْفٌ',
            text: 'كَمْ مَعْمَلًا فِي مَدْرَسَتِكَ ؟',
          ),
          MaterialDialogLine(
            speaker: 'مُوسَى',
            text:
                'فِي مَدْرَسَيْ مَعْمَلَانِ اثْنَانِ، مَعْمَلُ الْحَاسُوبِ وَمَعْمَلُ اللُّغَةِ.',
          ),
          MaterialDialogLine(
            speaker: 'شَرِيْفٌ',
            text: 'أَيْنَ مَعْمَلُ الْحَاسُوْبِ وَمَعْمَلُ اللَّغَةِ؟',
          ),
          MaterialDialogLine(
            speaker: 'مُوسَى',
            text:
                'مَعْمَلُ الْحَاسُوبِ فِي الطَّابِقِ الْأَوَّلِ وَمَعْمَلُ اللُّغَةِ فِي الطَّائِقِ الثَّانِي.',
          ),
          MaterialDialogLine(
            speaker: 'شَرِيْفٌ',
            text: 'أَيُّ لُغَةٍ تَتَعَلَّمُ فِي مَعْمَلِ اللَّغَةِ؟',
          ),
          MaterialDialogLine(
            speaker: 'مُوسَى',
            text:
                'أَتَعَلَّمُ اللُّغَةَ الْعَرَبِيَّةَ وَاللُّغَةَ الْإِنْجِلِيزِيَّةَ.',
          ),
          MaterialDialogLine(
            speaker: 'شَرِيْفٌ',
            text: 'أَيْنَ فَصْلُكَ وَأَيْنَ الْمَكْتَبَةُ؟',
          ),
          MaterialDialogLine(
            speaker: 'مُوسَى',
            text:
                'فَصْلِي جَانِبَ غُرْفَةِ الْمُدَرِّسِينَ. أَمَّا الْمَكْتَبَةُ وَقَعَتْ بَيْنَ غُرْفَةِ الشُّؤُوْنِ الْإِدَارِيَّةِ وَغُرْفَةِ الصِّحَّةِ.',
          ),
          MaterialDialogLine(
            speaker: 'شَرِيْفٌ',
            text: 'كَمْ عَدَدُ الْمُدَرِّسِ فِي مَدْرَسَتِكَ',
          ),
          MaterialDialogLine(
            speaker: 'مُوسَى',
            text: 'فِي مَدْرَسَتِي ثَلَاثَوْنَ مُدَرِّسًا.',
          ),
          MaterialDialogLine(
            speaker: 'شَرِيْفٌ',
            text:
                'إِذَنْ، لَا بُدَّ أَنْ تَحِدَّ فِي التَّعَلُّمِ. لِأَنَّ الْمَرَافِقَ الْمَدْرَسِيَّةَ وَالْمُدَرِّسِينَ فِي مَدْرَسَتِكَ كثيرة.',
          ),
          MaterialDialogLine(
            speaker: 'مُوسَى',
            text: 'إِنْ شَاءَ اللهُ. سَأَجِدُّ فِي التَّعَلُّمِ، يَا شَرِيْفٌ',
          ),
        ],
      ),
    ],
  );
}
