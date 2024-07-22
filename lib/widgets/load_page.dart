import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/coffee_model.dart';
import '../service/coffee_service.dart';
import '../srcreens/home_screen.dart';
import '../srcreens/onboarding.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key? key}) : super(key: key);

  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State<LoadPage> {
  List<Coffee> coffeeList = [];
  bool newLaunch = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadNewLaunch();
  }

  Future<void> loadNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    newLaunch = (prefs.getBool('newLaunch') ?? true);
    coffeeList = await CoffeeService.getCoffeeList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      body: newLaunch ? const Onboarding() : CoffeeListPage(coffeeList: coffeeList, coffee: []),
    );
  }
}
