import '../../../models/base/table_section.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_one.dart';

SimpleMaterialContent get qowaidBab2Content => SimpleMaterialContent([
  SectionOne("1. Na'at dan Man'ut (نَعْت وَ مَنْعُوْتٌ)", [
    'Na\'at adalah kata yang memberikan sifat/karakteristik tertentu pada kata yang ada di depannya. Sedangkan Man\'ut Adalah benda yang diberi sifat/karakter. Contoh:',
  ]),
  TableSection(
    headers: ['No', 'Kalimat', 'Analisa kedudukan', '', ''],
    rows: [
      ['', '', 'Mubtada\'', 'Man\'ut', 'Na\'at'],
      [
        '1',
        'إِبْرَاهِيْم طَالِبٌ نَشِيْطٌ',
        'إِبْرَاهِيْم',
        'طَالِبٌ',
        'نَشِيْطٌ',
      ],
      ['', 'Ibrahim Adalah siswa yang rajin', 'ibrahim', 'Siswa', 'Rajin'],
      [
        '2',
        'فَاطِمَةٌ طَالِبَةٌ نَشِيْطَةٌ',
        'فَاطِمَةٌ',
        'طَالِبَةٌ',
        'نَشِيْطَةٌ',
      ],
      ['', 'Fatimah Adalah siswa yang rajin', 'Fatimah', 'Siswa', 'Rajin'],
    ],
  ),
  SectionOne('Catatan Na\'at dan Man\'ut', [
    'Catatan:',
    '1) Dalam Bahasa Indonesia, na\'at diposisikan dengan terjemahan kata "yang...". Contoh:',
  ]),
  TableSection(
    headers: ['No', 'Kalimat', 'Man\'ut (yang disifati)', 'Na\'at (sifat)'],
    rows: [
      ['1', 'Saya punya mobil yang bagus', 'Mobil', 'yang bagus'],
      ['2', 'Faruq Adalah siswa yang rajin', 'Siswa', 'yang rajin'],
    ],
  ),
  SectionOne(
    '2) Na\'at harus sesuai dengan Man\'ut dari sisi Jenis kelamin (Mudzakkar & Mu\'annats)',
    ['Daftar kata sifat:'],
  ),
  TableSection(
    headers: ['المَعنى', 'الكَلِمَة', '', 'المَعنى', 'الكَلِمَة'],
    rows: [
      ['Besar', 'كَبِيرٌ', 'X', 'Kecil', 'صَغِيْرٌ'],
      ['Jauh', 'بَعِيدٌ', 'X', 'Dekat', 'قَرِيْبٌ'],
      ['Panjang', 'طَوِيلٌ', 'X', 'Pendek', 'قَصِيرٌ'],
      ['Banyak', 'كَثِيرٌ', 'X', 'Sedikit', 'قَلِيلٌ'],
      ['Luas', 'وَاسِعٌ', 'X', 'Sempit', 'ضَيِّقٌ'],
      ['Bersih', 'نَظِيفٌ', 'X', 'Kotor', 'مُتَّسِخٌ'],
      ['Indah', 'جَمِيلٌ', 'X', 'Jelek', 'قَبِيحٌ'],
      ['Rajin', 'نَشِيطٌ', 'X', 'Malas', 'گسلان'],
      ['Pandai', 'مَاهِرٌ', 'X', 'Bodoh', 'جَاهِلُ'],
      ['Baru', 'جَدِيدٌ', 'X', 'Lama', 'قَدِيمٌ'],
      ['Ringan', 'خَفِيفٌ', 'X', 'Berat', 'ثَقِيلٌ'],
      ['Buruk', 'سَيِّئٌ', 'X', 'Baik', 'جَيِّدٌ'],
    ],
  ),
  SectionOne('2. Kata Keterangan Tempat (ظَرْفُ المَكَان)', [
    'Adalah isim (kata benda) yang menunjukkan kata keterangan tempat. Beberapa ظَرْفُ المَكَان sebagai berikut:',
  ]),
  TableSection(
    headers: ['الكَلِمَة', 'المَعنى', 'العِبَارَة', 'التَّرْجَمَة'],
    rows: [
      [
        'فِيْ',
        'Di/didalam',
        'الطَّالِبُ فِيْ المَسْجٍدٍ',
        'Siswa itu di dalam masjid',
      ],
      [
        'أَمَامَ',
        'Di depan',
        'الْمَيْدَانُ أَمَامَ الْمَعْهَدِ',
        'Halaman itu di depan ma\'had',
      ],
      [
        'وَرَاءَ',
        'Di belakang',
        'الْحَمَّامُ وَرَاءَ غُرْفَةِ الصِّحَّةِ',
        'Kamar mandi itu di belakang UKS',
      ],
      [
        'جَانِبَ',
        'Di samping',
        'الْمَقْصَفُ جَانِبَ الْمَلْعَبِ',
        'Kantin itu di samping lapangan',
      ],
      [
        'عَلَى',
        'Di atas (menempel)',
        'الكِتَابُ عَلَى المَكْتَبِ',
        'Buku itu di atas meja',
      ],
      [
        'فَوْقَ',
        'Di atas (tidak menempel)',
        'السَّمَاءُ فَوْقَ الْأَرْضِ',
        'Langit itu di atas bumi',
      ],
      [
        'تَحْتَ',
        'Di bawah',
        'الْبُسْتَانُ تَحْتَ الْمَعْمَلِ',
        'Taman itu di bawah laboratorium',
      ],
      ['هُنَا', 'Di sini', 'الْمِرْحَاضُ هُنَا', 'Toilet itu di sini'],
      ['هُنَاكَ', 'Di sana', 'الفَصْلُ هُنَاكَ', 'Kelas itu di sana'],
    ],
  ),
  SectionOne(
    '3. Susunan الْمُبْتَدَأُ (إِشَارَةٌ) + الْخَبَرُ (نَعْتُ/طَرْفُ الْمَكَانِ)',
    [],
  ),
  TableSection(
    headers: ['No', 'Kalimat', 'Arti'],
    rows: [
      [
        '1',
        'ذٰلِكَ الْمَعْمَلُ أَمَامَ الْفَصْلِ',
        'Laboratorium itu di depan kelas',
      ],
      ['2', 'هٰذِهِ قَاعَةٌ وَاسِعَةٌ', 'Ini aula yang luas'],
    ],
  ),
  SectionOne('Keterangan Susunan Kalimat', [
    'Keterangan:',
    'a) kata yang berwarna merah berkedudukan sebagai Mubtada\' (subyek)',
    'b) kata yang bergarisbawah berkedudukan sebagai Khabar (predikat dengan bentuk kata keterangan tempat dan sifat)',
    'c) Khabar yang berupa kata keterangan tempat tidak harus ada kesesuaian antara Mudzakkar/ Mu\'annats',
    'd) khabar yang berupa na\'at harus harus ada kesesuaian antara Mudzakkar/ Mu\'annats',
    'e) Setiap kata yang berada setelah kata keterangan tempat, maka huruf akhirnya dibaca kasrah (lihat contoh di atas)',
  ]),
  TableSection(
    headers: ['Kata tanya', 'Fungsi', 'Contoh'],
    rows: [
      [
        'أَيْنَ',
        'Menanyakan posisi atau letak benda',
        'أَيْنَ الْمَكْتَبَةُ؟ الْمَكْتَبَةُ جَانِبَ الْمَعْمَلِ.',
      ],
      [
        'مِنْ أَيْنَ',
        'Menanyakan dari mana datanya suatu benda/orang',
        'مِنْ أَيْنَ الْمُدَرِّسُ الْمُدَرِّسُ مِنَ الْفَصْلِ.',
      ],
      [
        'إِلَى أَيْنَ',
        'Menanyakan Lokasi yang dituju',
        'إِلَى أَيْنَ تَذْهَبُ ؟ أَذْهَبُ إِلَى الْمَدْرَسَةِ',
      ],
    ],
  ),
  SectionOne('Latihan Soal', [
    'المِثَال: تِلْكَ مَدْرَسَةٌ جَدِيدَةٌ',
    '1. Tentukan I\'rob (kedudukan dalam kalimat) pada kalimat di bawah sesuai dengan contoh!',
    'الجَوَابُ : تِلْكَ مَدْرَسَةٌ : الْمُبْتَدَأُ (اِسْمُ الْإِشَارَةِ) ، مَدْرَسَةٌ جَدِيدَةٌ : الْخَبَرُ (نَعْتٌ وَمَنْعُوْتٌ)',
    '',
    '1. هُذَا مَقْصَفٌ نَظِيفٌ',
    'الجَوَابُ: ..........',
    '',
    '2. تِلْكَ حَدِيقَةٌ جَمِيلَةٌ',
    'الجَوَابُ: ..........',
    '',
    '3. الْحَمَّامُ وَرَاءَ غُرْفَةِ الصِّحَّةِ',
    'الجَوَابُ: ........',
    '',
    '4. الطَّالِبُ فِيْ المَسْجٍدٍ',
    'الجَوَابُ: .........',
    '',
    '2. Buatlah kalimat sederhana dengan kata keterangan tempat berikut!',
    '1. فِيْ: ...',
    '2. وَرَاءَ: ...',
    '3. جَانِبَ: ...',
    '4. تَحْتَ: ...',
    '5. هُنَا: ...',
  ]),
  SectionOne('Latihan Pilihan Ganda', [
    '3. Pilihlah jawaban yang benar dari beberapa pilihan jawaban!',
    '',
    '1. ... تَذْهَبُ ؟ أَذْهَب إِلَى الْمُصَلَّى',
    'أ. أَيْنَ    ب. مِنْ أَيْنَ    ج. إِلَى أَيْنَ',
    '',
    '2. ... صَفْوَانُ يَا عُبَيْدُ ؟ هُوَ مِنْ غُرْفَةِ الْمُدَرِّسِينَ',
    'أ. أَيْنَ    ب. مِنْ أَيْنَ    ج. إِلَى أَيْنَ',
    '',
    '3. ... الإِدَارَةُ ؟ هِيَ بَيْنَ الْمَعْهَدِ وَالْمَسْجِدِ',
    'أ. أَيْنَ    ب. مِنْ أَيْنَ    ج. إِلَى أَيْنَ',
    '',
    '4. ... المَقْصَف ؟ هُوَ أَمَامَ المَسْجِدِ',
    'أ. أَيْنَ    ب. مِنْ أَيْنَ    ج. إِلَى أَيْنَ',
  ]),
]);
