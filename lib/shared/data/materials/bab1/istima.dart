import '../../../models/material_content.dart';

class Bab1IstimaData {
  static final MaterialContent content = MaterialContent(
    topicId: 'istima_bab1',
    kind: 'istima',
    chapter: 1,
    sections: [
      MaterialSection(
        title: '1. Latihan Mendengar dan Mencocokkan',
        type: MaterialSectionType.audio,
        audioData: MaterialAudioData(
          instructions: [
            'Dengarkan bunyi kata/kalimat Arab berikut, kemudian cocokkan dengan jawaban yang tersedia dan tulis jawaban yang sesuai!',
          ],
          audioFiles: [
            'istima_ bab 1 - A - 1.mp3',
            'istima_ bab 1 - A - 2.mp3',
            'istima_ bab 1 - A - 3.mp3',
            'istima_ bab 1 - A - 4.mp3',
            'istima_ bab 1 - A - 5.mp3',
          ],
          questions: [
            '١. صَبَاحُ الْخَيْرِ - مَسَاءُ الْخَيْرِ - سَعِيدٌ مُبَارَكٌ - سَعِيدَةٌ مُبَارَكَةٌ',
            '٢. نَهَارُكَ سَعِيدٌ - مَسَاءُ النُّوْرِ - صَبَاحُ النُّوْرِ - لَيْلَتُكَ سَعِيدَة',
            '٣. الْحَمْدُ لله بِخَيْر - إِلَى اللقَاءِ - مَعَ السَّلَامَةِ - كَيْفَ حَالُكَ',
            '٤. طَالِب - نَاظِر - بَائِع – سَائِق',
            '٥. مُوَظّف - بَوَّابَ - رَئِيسُ – خَادِم',
          ],
        ),
      ),
      MaterialSection(
        title: '2. Melengkapi Kalimat',
        type: MaterialSectionType.audioPaired,
        audioData: MaterialAudioData(
          instructions: [
            'Lengkapilah kalimat di bawah ini sesuai dengan audio yang didengar!',
          ],
          audioFiles: [
            'istima_ bab 1 - B - 1.mp3',
            'istima_ bab 1 - B - 2.mp3',
            'istima_ bab 1 - B - 3.mp3',
            'istima_ bab 1 - B - 4.mp3',
            'istima_ bab 1 - B - 5.mp3',
          ],
          questions: [
            '١. ... فِي الْفَصْلِ السَّابِعِ "ب"',
            '٢. أَسْكُنُ فِي...',
            '٣. بيتك ... مِنَ الْمَسْجِدِ.',
            '٤. تَسْتَطِيعُ أَنْ تَزُورَ بَيْتِي فِي...',
            '٥. أَنَا ... بِمَعْرِفَتِكَ',
          ],
        ),
      ),
    ],
  );
}
