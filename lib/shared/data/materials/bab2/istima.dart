import '../../../models/material_content.dart';

class Bab2IstimaData {
  static final MaterialContent content = MaterialContent(
    topicId: 'istima_bab2',
    kind: 'istima',
    chapter: 2,
    sections: [
      MaterialSection(
        title: '1. Latihan Mendengar dan Mencocokkan',
        type: MaterialSectionType.audio,
        audioData: MaterialAudioData(
          instructions: [
            'Dengarkan bunyi kata/kalimat Arab berikut, kemudian cocokkan dengan jawaban yang tersedia dan tulis jawaban yang sesuai!',
          ],
          audioFiles: [
            'istima_ bab 2 - A - 1.mp3',
            'istima_ bab 2 - A - 2.mp3',
            'istima_ bab 2 - A - 3.mp3',
            'istima_ bab 2 - A - 4.mp3',
            'istima_ bab 2 - A - 5.mp3',
          ],
          questions: [
            '١. الْمِقْلَمَةُ تَحْتَ الْكُرَّاسَةِ - القَلَمُ فِي الحَقِيْبَةِ - الْمِصْبَاحُ فَوْقَ الْمَكْتَبِ',
            '٢. الْمُصَلَّى أَمَامَ الْمُلْعَبِ - الْمَسْجِدُ وَرَاءَ الْفَصْلِ – الْمِقْلَمَةُ فِي الرَّفٍّ',
            '٣. الْفَصْلُ كَبِيرٌ - الْكُرَّاسَةُ قَبِيحَةٌ – الْحَمَّامُ مُتَّسِخٌ - الْمُدَرِّسُ مَاهِرٌ',
            '٤. مَدْرَسَتِي ( وَرَاءَ - أَمَامَ - جَانِبَ ) الْمَسْجِد',
            '٥. مَدْرَسَتِي فِي شَارِعِ ( حَتَّى - سُوكَارْنُو – سُوْكَارْنِي)',
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
            'istima_ bab 2 - B - 1.mp3',
            'istima_ bab 2 - B - 2.mp3',
            'istima_ bab 2 - B - 3.mp3',
            'istima_ bab 2 - B - 4.mp3',
            'istima_ bab 2 - B - 5.mp3',
          ],
          questions: [
            '١. فِي مَدْرَسَتِي ...',
            '٢. ... اللُّغَةَ الْإِنْجِلِيزِيَّةَ وَاللُّغَةَ الْعَرَبِيَّةَ فِي مَعْمَلِ اللُّغَةِ.',
            '٣. فَصْلِيْ ... غُرْفَةِ الْمُدَرِّسِينَ.',
            '٤. الْمَكْتَبَةُ وَقَعَتْ بَيْنَ ... وَغُرْفَةِ الصِّحَّةِ .',
            '٥. لِأَنَّ ... وَالْمَرَافِقَ الْمَدْرَسِيَّةَ فِي مَدْرَسَتِكَ كَثِيرَةٌ',
          ],
        ),
      ),
    ],
  );
}
