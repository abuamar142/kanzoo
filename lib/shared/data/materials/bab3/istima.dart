import '../../../models/material_content.dart';

final MaterialContent istimaBab3 = MaterialContent(
  topicId: 'istima_bab3',
  kind: 'istima',
  chapter: 3,
  sections: [
    MaterialSection(
      title: '1. Latihan Mendengar dan Mencocokkan',
      type: MaterialSectionType.audio,
      audioData: MaterialAudioData(
        instructions: [
          'Dengarkan bunyi kata/kalimat Arab berikut, kemudian cocokkan dengan jawaban yang tersedia dan tulis jawaban yang sesuai!',
        ],
        audioFiles: [
          'istima_ bab 3 - A - 1.mp3',
          'istima_ bab 3 - A - 2.mp3',
          'istima_ bab 3 - A - 3.mp3',
          'istima_ bab 3 - A - 4.mp3',
          'istima_ bab 3 - A - 5.mp3',
        ],
        questions: [
          '١. لَوْنُ السَبُّوْرَةِ أَسْوَدٌ - لَوْنُ السَاعَةِ رَمَادِيٌّ - لَوْنُ الْوَرْدَةِ أَحْمَرٌ',
          '٢. لَوْنُ الْمِسْطَرَةِ أَخْضَرٌ - لَوْنُ الْخَرِيْطَةِ أَصْفَرٌ - لَوْنُ الْحَقِيْبَةِ وَرْدِيٌّ',
          '٣. فَصْلِي جَانِبَ (الْمَكْتَبَةِ - الْمَسْجِدِ - الْحَمَّامِ )',
          '٤. في فَصْلِي صُورَةُ . ( الزَّهْرَةُ - السَّبُّوْرَةُ - الْحَائِطُ )',
          '٥. لَوْنُ السَّبُّوْرَةِ ( أَسْوَدٌ - أَخْضَرٌ - بُنِيٌّ )',
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
          'istima_ bab 3 - B - 1.mp3',
          'istima_ bab 3 - B - 2.mp3',
          'istima_ bab 3 - B - 3.mp3',
          'istima_ bab 3 - B - 4.mp3',
          'istima_ bab 3 - B - 5.mp3',
        ],
        questions: [
          '١. تَسْأَلُ نَجِيبَةُ عَنْ ... فِي فَصْلِ قَانِتَةَ',
          '٢. يُنَظِّفُ ... الْفَصْلَ بَعْدَ الْجُرَسِ لِلرُّجُوْعِ مِنَ الْمَدْرَسَةِ',
          '٣. الْأَدَوَاتُ الْمَدْرَسِيَّةُ فِي فَصْلِيْ كَامِلَةٌ',
          '٤. اَلسَّبُورَةُ وَ ... وَقَلَمُ الْحِبْرِ',
          '٥. لَا ... الْمُدَرِّسُ بِالطَّبْشُوْرَةِ',
        ],
      ),
    ),
  ],
);
