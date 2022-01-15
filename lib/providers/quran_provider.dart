import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/quran_data.dart';

class QuranProvider{
  Future getSurat(int surat) async {

    final url = Uri.parse(
        'http://api.alquran.cloud/v1/surah/$surat/editions/quran-uthmani,en.asad,en.pickthall');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    quranList = QuranData.fromJson(data);

    return quranList;
  }
}