import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/coffee_model.dart';

class SessionHelper {
  static Future<void> saveSelectedCoffees(List<Coffee> coffees) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String coffeesJson = jsonEncode(coffees.map((coffee) => coffee.toJson()).toList());
    await prefs.setString('selectedCoffees', coffeesJson);
  }
  static Future<List<Coffee>> getSelectedCoffees() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? coffeesJson = prefs.getString('selectedCoffees');
    if (coffeesJson != null) {
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
  static Future<void> clearSelectedCoffees() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedCoffees');
  }
}
