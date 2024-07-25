import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/coffee_model.dart';

class SessionHelper {
  static Future<void> saveSelectedCoffees(List<Coffee> coffees) async {
    final String coffeesJson = jsonEncode(coffees.map((coffee) => coffee.toJson()).toList());
    await SharedPref.setData(key: 'selectedCoffees', dValue: coffeesJson, type: DataType.string);
  }

  static Future<List<Coffee>> getSelectedCoffees() async {
    final String? coffeesJson = await SharedPref.getData<String>(key: 'selectedCoffees', type: DataType.string);
    if (coffeesJson != null && coffeesJson.isNotEmpty) {
      final List<dynamic> coffeesList = jsonDecode(coffeesJson);
      return coffeesList.map((json) => Coffee.fromJson(json)).toList();
    }
    return [];
  }

  static Future<void> removeSelectedCoffee(int coffeeId) async {
    final List<Coffee> selectedCoffees = await getSelectedCoffees();
    selectedCoffees.removeWhere((coffee) => coffee.id == coffeeId);
    await saveSelectedCoffees(selectedCoffees);
  }
}

enum DataType {
  string,
  integer,
  boolean;
}

class SharedPref {
  static Future<T?> getData<T>({required String key, required DataType type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case DataType.string:
        return prefs.getString(key) as T?;
      case DataType.integer:
        return prefs.getInt(key) as T?;
      case DataType.boolean:
        return prefs.getBool(key) as T?;
      default:
        return null;
    }
  }

  static Future<void> setData({required String key, required dynamic dValue, required DataType type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case DataType.string:
        await prefs.setString(key, dValue as String);
        break;
      case DataType.integer:
        await prefs.setInt(key, dValue as int);
        break;
      case DataType.boolean:
        await prefs.setBool(key, dValue as bool);
        break;
    }
  }

  static Future<void> removeData({required String key, required DataType type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
