import 'package:flutter/material.dart';

import '../../../models/base/button_section.dart';
import '../../../models/base/material_section.dart';
import '../../../models/base/multiple_choice_section.dart';
import '../../../models/base/paragraph_section.dart';
import '../../../models/base/table_section.dart';
import '../../../models/base/title_section.dart';
import '../../../models/simple_material_content.dart';

class Bab1QowaidData {
  static final List<MaterialSection> sections = [
    TitleSection("1. Mubtada' dan Khobar"),
    ParagraphSection([
      'Dalam kitab *an-nahwu al-wadhih,* mubtada\' dan Khobar didefinisikan sebagai berikut:',
    ]),
    ParagraphSection([
      'الْمُبْتَدَأُ هُوَ اسْمٌ مَرْفُوعٌ فِي أَوَّلِ الْجُمْلَةِ .',
    ], isArabicParagraph: true),
    ParagraphSection([
      'Mubtada\' Adalah isim (kata benda) dibaca rafa\' yang terletak diawal kalimat. Mubtada\' berkedudukan sebagai subyek.',
    ]),
    ParagraphSection([
      'الْخَبَرُ هُوَ اسْمٌ مَرْفُوْعُ يُكَوِّنُ مَعَ الْمُبْتَدَأَ جُمْلَةً مُفِيدَةً.',
    ], isArabicParagraph: true),
    ParagraphSection([
      'Khabar Adalah isim (kata benda) dibaca rafa\' yang Bersama mubtada\' membentuk kalimat yang sempurna. Khabar berkedudukan sebagai predikat.',
      'Contoh:',
    ]),
    TableSection(
      headers: ['No', 'Kalimat', 'Arti', 'Penjelasan'],
      rows: [
        [
          '1',
          'هُوَ فَرُوْقٌ',
          'Dia Faruq',
          'Khabar dan Mubtada\' harus saling menyesuaikan dengan perincian sebagai berikut: • Jika Mubtada\' berbentuk Mudzakkar maka khabar harus Mudzakkar • Jika Mubtada\' berbentuk Mu\'annats maka khabar harus Mu\'annats',
        ],
        ['2', 'هِيَ حِلْيَةٌ', 'Dia Hilyah', ''],
        ['3', 'أَنْتَ عُمَرٌ', 'Kamu Umar', ''],
        ['4', 'التِّلْمِيْذٌ نَشِيْطٌ', 'Murid itu rajin', ''],
        ['5', 'المَدْرَسَةُ جَدِيْدَةٌ', 'Sekolah itu baru', ''],
      ],
    ),
    ButtonSection(
      title: 'Video: Mubtada’ dan Khabar',
      description:
          'Tonton penjelasan lengkap tentang mubtada’ dan khabar beserta contoh-contohnya.',
      buttonText: 'Tonton Video Penjelasan',
      url: 'https://youtu.be/Q8kTwIE5qxg?si=jkjaovsPgC-ELASe&t=669',
      icon: Icons.ondemand_video,
    ),
    TitleSection('2. Kata Ganti (ضَمِيْرٌ)'),

    ParagraphSection([
      'Damir (ضمير) adalah kata ganti orang dalam bahasa Arab. Damir ada tiga jenis, yaitu munfaşil, muttaşil, dan mustatir. Pada materi ini akan dipelajari damir munfaşil. Damir munfaşil adalah kata ganti yang tidak bersambung dengan kata setelahnya (bisa berdiri sendiri). Damir munfaşil ada 14. Beberapa contoh damir munfaşil sebagai berikut:',
    ]),
    TableSection(
      headers: ['', '', ''],
      rows: [
        ['هُوَ', 'أَنْتَ', 'أَنَا'],
        ['Dia (lk)', 'Kamu (lk)', 'Saya'],
        ['هٍيَ', 'أَنْتِ', 'نَحْنُ'],
        ['Dia (pr)', 'Kamu (pr)', 'Kita'],
      ],
    ),
    ButtonSection(
      title: 'Video: Dhomir (Kata Ganti)',
      description:
          'Ringkasan 14 dhamir munfashil (terpisah) dengan contoh dan penggunaannya.',
      buttonText: 'Tonton Video Penjelasan',
      url: 'https://youtu.be/6IsK159f5_g?si=eYK13Zb8-rAmPIeh',
      icon: Icons.ondemand_video,
    ),
    TitleSection('3. Kata Tunjuk (اسْمُ الإِشَارَة)'),
    ParagraphSection([
      'Ism isyārah adalah kata yang berfungsi untuk menunjuk manusia ataupun benda dalam jarak dekat ataupun jauh. Ism isyārah dibagi menjadi tiga sebagai berikut.',
      '1. Ism isyarah lil mufrad, yaitu kata tunjuk jauh atau dekat untuk benda tunggal. Ism isyārah tersebut Adalah هٰذَا، هَذِهِ، ذَلِكَ، تِلْكَ',
      '2. Ism isyarah lil musanna, yaitu kata tunjuk jauh atau dekat untuk dua benda. Ism isyārah yang digunakan dalam kategori ini adalah هَذَانِ، هُتَانِ، ذَانِكَ، تَانِكَ',
      '3. Ism isyarah lil jam\'i, yaitu kata tunjuk jauh atau dekat untuk benda jamak. Isim isyārah yang digunakan adalah هٰؤُلَاءِ (kata tunjuk jamak berjarak dekat) dan أُولٰئِكَ (kata tunjuk jamak berjarak jauh). Keduanya berlaku untuk mużakkar maupun mu\'annas.',
      'Kata benda (ism) yang bermakna mużakkar adalah kata benda yang menunjukkan laki-laki dan tidak berakhiran huruf ta\' marbutah (ـة/ة)',
      'Kata benda (ism) yang bermakna mu\'annas adalah kata benda yang menunjukkan perempuan dan berakhiran huruf ta\' marbutah (ـة/ة)',
    ]),
    TableSection(
      headers: ['Mudzakkar', 'Muannats', 'Keterangan'],
      rows: [
        ['هٰذَا', 'هٰذِهِ', 'Untuk jarak dekat'],
        ['Ini (lk)', 'Ini (pr)', ''],
        ['ذٰلِكَ', 'تِلْكَ', 'Untuk jarak jauh'],
        ['Itu (lk)', 'Itu (pr)', ''],
      ],
    ),
    ParagraphSection(['Contoh dalam Kalimat']),
    ParagraphSection([
      'ذٰلِكَ طَالِبٌ = itu siswa',
      'هٰذِهِ طَالِبَةٌ = ini siswi',
    ], isArabicParagraph: true),
    ButtonSection(
      title: 'Video: Ismul Isyarah (Kata Tunjuk)',
      description:
          'Pembahasan ism isyarah untuk mufrad, mutsanna, dan jamak beserta contoh.',
      buttonText: 'Tonton Video Penjelasan',
      url: 'https://youtu.be/WVW-BTUBDSE?si=3HhUpTDXB9u7xv_F',
      icon: Icons.ondemand_video,
    ),
    TitleSection('4. Kata Tanya (أداة اسْتِفْهَام)'),
    TableSection(
      headers: [
        'No',
        'Kata tanya',
        'Arti',
        'Untuk menanyakan',
        'Pertanyaan',
        'Jawaban',
      ],
      rows: [
        [
          '1',
          'مَا',
          'Apa',
          'kata benda yang tidak berakal',
          'مَا هٰذَا Apa ini?',
          'هٰذَا كِتَابٌ Ini buku',
        ],
        [
          '',
          '',
          '',
          '',
          'مَا هٰذِهِ Apa ini?',
          'هٰذِهِ مِسْطَرَةٌ Ini penggaris',
        ],
        [
          '2',
          'مَنْ',
          'Siapa',
          'kata benda yang berakal',
          'مَنْ هٰذَا siapa ini?',
          'هٰذَا مَحْمُوْدٌ Ini mahmud',
        ],
        [
          '',
          '',
          '',
          '',
          'مَنْ هٰذِهِ siapa ini?',
          'هٰذِهِ مَحْمُوْدَةٌ Ini mahmudah',
        ],
        [
          '3',
          'مِنْ أَيْنَ',
          'Darimana',
          'darimana datangnya suatu benda',
          'مِنْ أَيْنَ أَنْتَ Dari mana kamu?',
          'أَنَا مِنْ جُمْبَانج Saya dari jombang',
        ],
        [
          '4',
          'هَلْ',
          'Apakah',
          'jawaban ya atau tidak',
          'هَلْ أَنْتَ طَالِبٌ Apakah kamu seorang siswa?',
          'نَعَمْ، أَنَا طَالِبٌ Ya, saya seorang siswa',
        ],
        ['', '', '', '', '', 'لاَ، أَنَا مُدَرِّسٌ Tidak, saya seorang guru'],
        [
          '5',
          'كَيْفَ',
          'Bagaimana',
          'keadaan',
          'كَيْفَ حَالُك Bagaimana kabarmu?',
          'بِخَيْرٍ وَالحَمْدُ لِلّٰه Baik, alhamdulillah',
        ],
      ],
    ),
    TitleSection('Latihan Soal'),
    TitleSection('1. Tentukan khabar pada kalimat berikut!'),
    TableSection(
      headers: ['Kalimat', 'أ', 'ب', 'ج'],
      rows: [
        [
          'المَدْرَسَةُ كَبِيْرَةٌ',
          'المَدْرَسَةُ',
          'كَبِيْرَةٌ',
          'المَدْرَسَةُ كَبِيْرَةٌ',
        ],
        ['الطَّالِبُ مَاهِرٌ', 'مَاهِرٌ', 'الطَّالِبُ', 'الطَّالِبُ مَاهِرٌ'],
        ['هُوَ مُدَرِّسٌ', 'هُوَ', 'مُدَرِّسٌ', 'هُوَ مُدَرِّسٌ'],
        ['هِيَ طَالِبَةٌ', 'هِيَ', 'طَالِبَةٌ', 'هِيَ طَالِبَةٌ'],
        ['تِلْكَ مُدَرِّسَةٌ', 'مُدَرِّسَةٌ', 'تِلْكَ', 'تِلْكَ مُدَرِّسَةٌ'],
      ],
    ),
    TitleSection(
      '2. Pilihlah jawaban yang benar dari beberapa pilihan jawaban!',
    ),
    MultipleChoiceSection(
      title: 'Latihan Pilihan Ganda',
      subtitle: 'Pilihlah jawaban yang benar!',
      sectionId: 'bab1_qowaid_mc_1',
      questions: [
        MultipleChoiceQuestion(
          question: 'هُوَ ....',
          options: ['طَالِبٌ', 'طَالِبَةٌ', 'مُدَرِّسَةٌ', 'صَدِيْقَتِيْ'],
          correctAnswerIndex: 0,
        ),
        MultipleChoiceQuestion(
          question: 'أَنْتَ ....',
          options: ['فَطِمَةٌ', 'أَحْمَد', 'زَيْنَبْ', 'مَحْمُوْدَة'],
          correctAnswerIndex: 1,
        ),
        MultipleChoiceQuestion(
          question: 'هٰذَا أَحْمَد .... طَالِبٌ',
          options: ['هُوَ', 'هِيَ', 'أَنَا', 'أَنْتَ'],
          correctAnswerIndex: 0,
        ),
        MultipleChoiceQuestion(
          question: 'مَنْ ....؟ هِيَ طَالِبَةٌ',
          options: ['هُوَ', 'أَنَا', 'هِيَ', 'أَنْتَ'],
          correctAnswerIndex: 2,
        ),
        MultipleChoiceQuestion(
          question: 'اِسْمِيْ .... أَنَا طَالِبٌ',
          options: ['فَطِمَةٌ', 'مُدَرِّسَةٌ', 'زَيْنَبْ', 'عُمَر'],
          correctAnswerIndex: 3,
        ),
      ],
    ),
    ButtonSection(
      title: 'Uji Kemampuan Qowaid Bab 1',
      description: 'Ayo uji kemampuanmu dengan latihan interaktif online!',
      buttonText: 'Buka Latihan Online',
      url: 'https://wayground.com/join?gc=38340738',
      icon: Icons.quiz,
    ),
  ];
}

SimpleMaterialContent get qowaidBab1Content =>
    SimpleMaterialContent(Bab1QowaidData.sections);
