import 'dart:convert';
import 'package:geocoder/geocoder.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/prayer_data.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class PrayerProvider {

  Future getPTCalendar() async {
    late double pLat;
    late double pLong;

    final position = await geolocatorPlatform.getCurrentPosition();

    pLat = position.latitude;
    pLong = position.longitude;

    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/calendar?latitude=$pLat&longitude=$pLong&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    list = PrayerData.fromJson(data);

    return list;
  }

  Future getTimesCalendarByAddress() async {
    final position = await geolocatorPlatform.getCurrentPosition();

    DateTime date = DateTime.now();
    final coordinates = new Coordinates(position.latitude, position.longitude);

    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);

    var address = addresses.first.addressLine;

    final url = Uri.parse(
        'http://api.aladhan.com/v1/calendarByAddress?address=$address&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    list = PrayerData.fromJson(data);

    return list;
  }

  Future getPTCalendarByCity() async {
    final position = await geolocatorPlatform.getCurrentPosition();

    DateTime date = DateTime.now();
    final coordinates = new Coordinates(position.latitude, position.longitude);

    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);

    city = addresses.first.locality;
    country = addresses.first.countryName;

    final url = Uri.parse(
        'http://api.aladhan.com/v1/calendarByCity?city=$city&country=$country&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    list = PrayerData.fromJson(data);

    return list;
  }

  Future getPTHijriCalendar() async {
    late double pLat;
    late double pLong;

    final position = await geolocatorPlatform.getCurrentPosition();

    pLat = position.latitude;
    pLong = position.longitude;

    DateTime date = DateTime.now();

    final url = Uri.parse(
        'http://api.aladhan.com/v1/hijriCalendar?latitude=$pLat&longitude=$pLong&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    list = PrayerData.fromJson(data);

    return list;
  }

  Future getPTHijriCalendarByAddress() async {
    final position = await geolocatorPlatform.getCurrentPosition();

    DateTime date = DateTime.now();
    final coordinates = new Coordinates(position.latitude, position.longitude);

    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);

    var address = addresses.first.addressLine;

    final url = Uri.parse(
        'http://api.aladhan.com/v1/hijriCalendarByAddress?address=$address&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    list = PrayerData.fromJson(data);

    return list;
  }

  Future getPTHijriCalendarByCity() async {
    final position = await geolocatorPlatform.getCurrentPosition();

    DateTime date = DateTime.now();
    final coordinates = new Coordinates(position.latitude, position.longitude);

    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);

    city = addresses.first.locality;
    country = addresses.first.countryName;

    final url = Uri.parse(
        'http://api.aladhan.com/v1/hijriCalendarByCity?city=$city&country=$country&method=$method&month=${date.month}&year=${date.year}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    list = PrayerData.fromJson(data);

    return list;
  }

  Future getTimings(String date) async {
    final position = await geolocatorPlatform.getCurrentPosition();

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

    list = PrayerData.fromJson(data);

    return list;
  }

  Future getTimingsByAddress() async {
    final position = await geolocatorPlatform.getCurrentPosition();

    DateTime date = DateTime.now();
    final coordinates = new Coordinates(position.latitude, position.longitude);

    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);

    var address = addresses.first.addressLine;

    final url = Uri.parse(
        'http://api.aladhan.com/v1/timingsByAddress?address=$address&method=$method');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    List<dynamic> xx = <dynamic>[];
    xx.add(data['data']);
    data['data'] = xx;

    list = PrayerData.fromJson(data);

    return list;
  }

  Future getTimingsByCity() async {
    final position = await geolocatorPlatform.getCurrentPosition();

    DateTime date = DateTime.now();
    final coordinates = new Coordinates(position.latitude, position.longitude);

    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);

    city = addresses.first.locality;
    country = addresses.first.countryName;

    final url = Uri.parse(
        'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method&date_or_timestamp=${DateTime.now()}');

    http.Response res = await http.get(url);
    final data = jsonDecode(res.body);

    List<dynamic> xx = <dynamic>[];
    xx.add(data['data']);
    data['data'] = xx;

    list = PrayerData.fromJson(data);

    return list;
  }
}
