import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../srcreens/home_screen.dart';
import '../srcreens/onboarding.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key? key}) : super(key: key);

  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State<LoadPage> {
  bool newLaunch = true;

  @override
  void initState() {
    super.initState();
    loadNewLaunch();
  }

  Future<void> loadNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      newLaunch = (prefs.getBool('newLaunch') ?? true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newLaunch ? const Onboarding() : const CoffeeListPage(coffeeList: [], coffee: []),
    );
  }
}
