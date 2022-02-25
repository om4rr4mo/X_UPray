import 'dart:convert';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/prayer_data.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class PrayerProvider {
  Future<PrayerData> getPTCalendar() async {
    late double pLat;
    late double pLong;

    final position = await Geolocator.getCurrentPosition();

    pLat = position.latitude;
    pLong = position.longitude;

    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/calendar?latitude=$pLat&longitude=$pLong&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    prayerList = PrayerData.fromJson(data);

    return prayerList;
  }

  Future getTimesCalendarByAddress() async {
    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/calendarByAddress?address=$address&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    prayerList = PrayerData.fromJson(data);

    return prayerList;
  }

  Future getPTCalendarByCity() async {
    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/calendarByCity?city=$city&country=$country&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    prayerList = PrayerData.fromJson(data);

    return prayerList;
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

    prayerList = PrayerData.fromJson(data);

    return prayerList;
  }

  Future getPTHijriCalendarByAddress() async {
    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/hijriCalendarByAddress?address=$address&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    prayerList = PrayerData.fromJson(data);

    return prayerList;
  }

  Future getPTHijriCalendarByCity() async {
    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/hijriCalendarByCity?city=$city&country=$country&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    prayerList = PrayerData.fromJson(data);

    return prayerList;
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

    prayerList = PrayerData.fromJson(data);

    return prayerList;
  }

  Future getTimingsByAddress() async {
    final url = Uri.parse(
        'http://api.aladhan.com/v1/timingsByAddress?address=$address&method=$method');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    List<dynamic> xx = <dynamic>[];
    xx.add(data['data']);
    data['data'] = xx;

    prayerList = PrayerData.fromJson(data);

    return prayerList;
  }

  Future getTimingsByCity(String date) async {
    final url = Uri.parse(
        'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method&date_or_timestamp=$date');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    List<dynamic> xx = <dynamic>[];
    xx.add(data['data']);
    data['data'] = xx;

    prayerList = PrayerData.fromJson(data);

    return prayerList;
  }
}
