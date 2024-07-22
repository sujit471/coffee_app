import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/srcreens/home_screen.dart';
import 'package:to_do_list/srcreens/onboarding.dart';
import 'package:to_do_list/srcreens/order_page.dart';
import 'service/coffee_service.dart';
import 'model/coffee_model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        textTheme: GoogleFonts.soraTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: FutureBuilder<List<Coffee>>(
        future: CoffeeService.getCoffeeList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
           //return CoffeeListPage(coffeeList: snapshot.data!, coffee:const []);
           return Onboarding(coffeeList: snapshot.data!, coffee:const []);




          }
        },
      ),
    );
  }
}
