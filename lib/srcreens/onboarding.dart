import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/widgets/button.dart';
import '../model/coffee_model.dart';
import '../service/coffee_service.dart';
import 'home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  resetNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("newLaunch")) {
      prefs.setBool('newLaunch', false);
    } else {
      prefs.setBool('newLaunch', false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'image/coffee.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text:
                            'Fall in Love With \n',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        WidgetSpan(
                          child: Text('Coffee in Blisful',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 50,),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text:
                              'Welcome to our cozy coffee corner, where\n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              )),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text('every cup is a delightful for you',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 20), // Space between text and button
                  InkWell(
                    onTap: () async {
                      List<Coffee> coffeeList =
                      await CoffeeService.getCoffeeList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoffeeListPage(
                            coffeeList: coffeeList,
                            coffee: [],
                          ),
                        ),
                      );
                    },
                    child: const CustomButton(
                      isActive: true,
                      foregroundcolor: Color(0xFFEDD6CB),
                      backgrouncolor: Color(0xFFC67C4E),
                      width: 350,
                      text: 'Get Started',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
