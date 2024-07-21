import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/button.dart';
import '../model/coffee_model.dart';

import '../service/coffee_service.dart';
import 'home_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

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
              child: InkWell(
                onTap: () async {
                  List<Coffee> coffeeList = await CoffeeService.getCoffeeList();
                  // Navigator.push(
                  //   context
                  //   MaterialPageRoute(
                  //     builder: (context) => CoffeeListPage(coffeeList: coffeeList, coffee: ,),
                  //   ),
                  // );
                },
                child: const CustomButton(
                  foregroundcolor: Color(0xFFEDD6CB),
                  backgrouncolor: Color(0xFFC67C4E),
                  width: 350,
               text: 'Get Started',
                  // text: 'Get Started',

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
