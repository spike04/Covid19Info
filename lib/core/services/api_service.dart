import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:covid19_info/core/models/app_error.dart';
import 'package:covid19_info/core/models/faq.dart';
import 'package:covid19_info/core/models/myth.dart';
import 'package:covid19_info/core/models/news.dart';
import 'package:covid19_info/core/models/country.dart';
import 'package:covid19_info/core/models/hospital.dart';
import 'package:covid19_info/core/models/nepal_count.dart';
import 'package:covid19_info/core/models/global_count.dart';

class ApiService {
  static const String NEPAL_CORONA_BASE = 'https://nepalcorona.info/api/v1/';
  static const String COVID_API_BASE = 'https://covidapi.info/api/v1/';

  Future<GlobalCount> fetchGlobalCount() async {
    try {
      http.Response res = await http.get(COVID_API_BASE + 'global');

      return GlobalCount.fromMap(jsonDecode(res.body)['result']);
    } catch (e) {
      throw AppError(
        message: "Couldn't load nepal infection data!",
        error: e.toString(),
      );
    }
  }

  Future<List<Country>> fetchCountries() async {
    try {
      http.Response res = await http.get(NEPAL_CORONA_BASE + 'data/world');
      final Map<String, dynamic> resMap = jsonDecode(res.body);
      return (resMap['data'] as List).map((m) => Country.fromMap(m)).toList();
    } catch (e) {
      throw AppError(
        message: "Couldn't load countries!",
        error: e.toString(),
      );
    }
  }

  Future<NepalCount> fetchNepalCount() async {
    try {
      http.Response res = await http.get(NEPAL_CORONA_BASE + 'data/nepal');
      return NepalCount.fromJson(res.body);
    } catch (e) {
      throw AppError(
        message: "Couldn't load nepal infection data!",
        error: e.toString(),
      );
    }
  }

  Future<List<News>> fetchNews(int start) async {
    try {
      http.Response res =
          await http.get(NEPAL_CORONA_BASE + 'news?start=$start');
      final Map<String, dynamic> resMap = jsonDecode(res.body);
      return (resMap['data'] as List).map((m) => News.fromMap(m)).toList();
    } catch (e) {
      throw AppError(
        message: "Couldn't load news!",
        error: e.toString(),
      );
    }
  }

  Future<List<Myth>> fetchMyths(int start) async {
    try {
      http.Response res =
          await http.get(NEPAL_CORONA_BASE + 'myths?start=$start');
      final Map<String, dynamic> resMap = jsonDecode(res.body);
      return (resMap['data'] as List).map((m) => Myth.fromMap(m)).toList();
    } catch (e) {
      throw AppError(
        message: "Couldn't load myths!",
        error: e.toString(),
      );
    }
  }

  Future<List<Faq>> fetchFaqs(int start) async {
    try {
      http.Response res =
          await http.get(NEPAL_CORONA_BASE + 'faqs?start=$start');
      Map<String, dynamic> resMap =
          jsonDecode(res.body) as Map<String, dynamic>;
      return (resMap['data'] as List).map((m) => Faq.fromMap(m)).toList();
    } catch (e) {
      throw AppError(
        message: "Couldn't load FAQ!",
        error: e.toString(),
      );
    }
  }

  Future<List<Hospital>> fetchHospitals(int start) async {
    try {
      http.Response res =
          await http.get(NEPAL_CORONA_BASE + 'hospitals?start=$start');
      final Map<String, dynamic> resMap = jsonDecode(res.body);
      return (resMap['data'] as List).map((m) => Hospital.fromMap(m)).toList();
    } catch (e) {
      throw AppError(
        message: "Couldn't load hospital data!",
        error: e.toString(),
      );
    }
  }
}
