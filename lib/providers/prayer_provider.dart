import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/prayer_data.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class PrayerProvider {
  CreatePrayerList(PrayerData pd) {
    PrayerList.clear();
    for (Data d in pd.data!) {
      List<SingleTiming> st = <SingleTiming>[];

      String dtS = d.date!.gregorian!.date! +
          " " +
          d.timings!.fajr!
              .replaceAll(" (CET)", "")
              .replaceAll(" (PST)", "")
              .replaceAll(" (CEST)", "");
      DateTime dt = DateFormat('dd-MM-y HH:mm').parseStrict(dtS);
      st.add(new SingleTiming(prayerName: "Fajr", timing: dt));

      dtS = d.date!.gregorian!.date! +
          " " +
          d.timings!.sunrise!
              .replaceAll(" (CET)", "")
              .replaceAll(" (PST)", "")
              .replaceAll(" (CEST)", "");
      dt = DateFormat('dd-MM-y HH:mm').parseStrict(dtS);
      st.add(new SingleTiming(prayerName: "Sunrise", timing: dt));

      dtS = d.date!.gregorian!.date! +
          " " +
          d.timings!.dhuhr!
              .replaceAll(" (CET)", "")
              .replaceAll(" (PST)", "")
              .replaceAll(" (CEST)", "");
      dt = DateFormat('dd-MM-y HH:mm').parseStrict(dtS);
      st.add(new SingleTiming(prayerName: "Dhuhr", timing: dt));

      dtS = d.date!.gregorian!.date! +
          " " +
          d.timings!.asr!
              .replaceAll(" (CET)", "")
              .replaceAll(" (PST)", "")
              .replaceAll(" (CEST)", "");
      dt = DateFormat('dd-MM-y HH:mm').parseStrict(dtS);
      st.add(new SingleTiming(prayerName: "Asr", timing: dt));

      dtS = d.date!.gregorian!.date! +
          " " +
          d.timings!.isha!
              .replaceAll(" (CET)", "")
              .replaceAll(" (PST)", "")
              .replaceAll(" (CEST)", "");
      dt = DateFormat('dd-MM-y HH:mm').parseStrict(dtS);
      st.add(new SingleTiming(prayerName: "Isha", timing: dt));

      dtS = d.date!.gregorian!.date! +
          " " +
          d.timings!.maghrib!
              .replaceAll(" (CET)", "")
              .replaceAll(" (PST)", "")
              .replaceAll(" (CEST)", "");
      dt = DateFormat('dd-MM-y HH:mm').parseStrict(dtS);
      st.add(new SingleTiming(prayerName: "Maghrib", timing: dt));

      st.sort((a, b) {
        return a.timing!.compareTo(b.timing!);
      });

      CustomData cd =
          new CustomData(date: d.date, meta: d.meta, timingsList: st);
      PrayerList.add(cd);
    }
  }

  Future<PrayerData> getPTCalendar(DateTime date) async {
    late double pLat;
    late double pLong;

    final position = await Geolocator.getCurrentPosition();

    pLat = position.latitude;
    pLong = position.longitude;

    final url = Uri.parse(
        'http://api.aladhan.com/v1/calendar?latitude=$pLat&longitude=$pLong&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);
    PrayerData prayerDataList = PrayerData.fromJson(data);

    //CreatePrayerList(prayerDataList);

    writeJsonFile(res.body);
    String tmp = await readJson();
    return prayerDataList;
  }

  Future getTimesCalendarByAddress() async {
    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/calendarByAddress?address=$address&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    PrayerData prayerDataList = PrayerData.fromJson(data);

    return prayerDataList;
  }

  Future getPTCalendarByCity() async {
    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/calendarByCity?city=$city&country=$country&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    PrayerData prayerDataList = PrayerData.fromJson(data);

    return prayerDataList;
  }

  Future getPTHijriCalendar() async {
    late double pLat;
    late double pLong;

    final position = await Geolocator.getCurrentPosition();

    pLat = position.latitude;
    pLong = position.longitude;

    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/hijriCalendar?latitude=$pLat&longitude=$pLong&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    PrayerData prayerDataList = PrayerData.fromJson(data);

    return prayerDataList;
  }

  Future getPTHijriCalendarByAddress() async {
    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/hijriCalendarByAddress?address=$address&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    PrayerData prayerDataList = PrayerData.fromJson(data);

    return prayerDataList;
  }

  Future getPTHijriCalendarByCity() async {
    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/hijriCalendarByCity?city=$city&country=$country&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    PrayerData prayerDataList = PrayerData.fromJson(data);

    return prayerDataList;
  }

  Future getTimings(String date) async {
    final position = await Geolocator.getCurrentPosition();

    if (position == null) return;

    pLat = position.latitude;
    pLong = position.longitude;

    final url = Uri.parse(
        'http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method&school=$school');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    List<dynamic> xx = <dynamic>[];
    xx.add(data['data']);
    data['data'] = xx;

    PrayerData prayerDataList = PrayerData.fromJson(data);

    return prayerDataList;
  }

  Future getTimingsByAddress() async {
    final url = Uri.parse(
        'http://api.aladhan.com/v1/timingsByAddress?address=$address&method=$method');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    List<dynamic> xx = <dynamic>[];
    xx.add(data['data']);
    data['data'] = xx;

    PrayerData prayerDataList = PrayerData.fromJson(data);

    return prayerDataList;
  }

  Future getTimingsByCity(String date) async {
    final url = Uri.parse(
        'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method&date_or_timestamp=$date');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    List<dynamic> xx = <dynamic>[];
    xx.add(data['data']);
    data['data'] = xx;

    PrayerData prayerDataList = PrayerData.fromJson(data);

    return prayerDataList;
  }
}
