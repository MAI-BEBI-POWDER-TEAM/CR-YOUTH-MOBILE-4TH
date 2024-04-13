import 'dart:convert';

import 'package:cat_api/data/api/response/breed_response.dart';
import 'package:cat_api/utils/endpoint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatController extends GetxController {
  Dio dio = Dio();

  RxInt nextPage = 0.obs;
  var listBreeds = List<BreedResponse>.empty(growable: true).obs;

  Future<List<BreedResponse>> getAllBreeds() async {
    try {
      final response = await dio.getUri(
        Uri.https(
          apiBaseUrl,
          getAllPetBreeds,
          {
            'limit': '100',
            'page': '${nextPage.value}',
          },
        ),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        var jsonResponse = breedResponseFromJson(jsonEncode(response.data));
        listBreeds.addAll(jsonResponse);

        nextPage.value++;
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }

    return listBreeds;
  }
}
