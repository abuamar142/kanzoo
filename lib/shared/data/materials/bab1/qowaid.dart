import '../../../models/base/table_section.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_one.dart';

SimpleMaterialContent get qowaidBab1Content => SimpleMaterialContent([
  SectionOne("1. Mubtada' dan Khobar", [
    'Dalam kitab *an-nahwu al-wadhih,* mubtada\' dan Khobar didefinisikan sebagai berikut:',
    'الْمُبْتَدَأُ هُوَ اسْمٌ مَرْفُوعٌ فِي أَوَّلِ الْجُمْلَةِ .',
    'Mubtada\' Adalah isim (kata benda) dibaca rafa\' yang terletak diawal kalimat. Mubtada\' berkedudukan sebagai subyek.',
    'الْخَبَرُ هُوَ اسْمٌ مَرْفُوْعُ يُكَوِّنُ مَعَ الْمُبْتَدَأَ جُمْلَةً مُفِيدَةً.',
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
  SectionOne('2. Kata Ganti (ضَمِيْرٌ)', [
    'Damir (ضمير) adalah kata ganti orang dalam bahasa Arab. Damir ada tiga jenis, yaitu munfaşil, muttaşil, dan mustatir. Pada materi ini akan dipelajari damir munfaşil. Damir munfaşil adalah kata ganti yang tidak bersambung dengan kata setelahnya (bisa berdiri sendiri). Damir munfaşil ada 14. Beberapa contoh damir munfaşil sebagai berikut:',
  ]),
  TableSection(
    headers: [],
    rows: [
      ['هُوَ', 'أَنْتَ', 'أَنَا'],
      ['Dia (lk)', 'Kamu (lk)', 'Saya'],
      ['هٍيَ', 'أَنْتِ', 'نَحْنُ'],
      ['Dia (pr)', 'Kamu (pr)', 'Kita'],
    ],
  ),
  SectionOne('3. Kata Tunjuk (اسْمُ الإِشَارَة)', [
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
  SectionOne('Contoh dalam Kalimat', [
    'ذٰلِكَ طَالِبٌ = itu siswa',
    'هٰذِهِ طَالِبَةٌ = ini siswi',
  ]),
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
]);
