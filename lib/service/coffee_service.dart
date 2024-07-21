import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:to_do_list/model/coffee_model.dart';

class CoffeeService {
  static Future<List<Coffee>> getCoffeeList() async {
    final String response = await rootBundle.loadString('mock/coffee.json');
    return Coffee.fromJsonList(response);
  }
}