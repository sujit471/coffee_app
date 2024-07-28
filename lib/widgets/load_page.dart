import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/model/coffee_model.dart';
import 'package:to_do_list/service/coffee_service.dart';
import 'package:to_do_list/srcreens/home_screen.dart';
import 'package:to_do_list/srcreens/onboarding.dart';

import '../srcreens/signup_page.dart';
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
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
     //body: newLaunch ? const Onboarding() : CoffeeListPage(coffeeList: coffeeList, coffee: const []),
      body: newLaunch ? const Onboarding() : const SignUpPage(),
    );
  }
}
