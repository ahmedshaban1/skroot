import 'dart:core';

import 'package:dio/dio.dart';
import 'package:skroot/models/lists/countries_response.dart';
import 'package:skroot/models/lists/slider_response.dart';
import 'package:skroot/network/networkUtlis.dart';

class ListsRepo {

  static Future<CountriesResponse> fetchCountriesList() {
    Future<CountriesResponse> countriesResponse = NetworkUtil.internal().get(
        CountriesResponse(), "locations/countries");
    print("HERE IS PRINT 2");
    return countriesResponse;
  }

  static Future<CountriesResponse> fetchCitiesList(int countryId) {
    return NetworkUtil.internal().get(
        CountriesResponse(), "locations/countries/$countryId/cities");
  }

  static Future<IntroResponse> fetchIntroList() {
    return NetworkUtil.internal().get(IntroResponse(), "general/intro-slides");
  }

}