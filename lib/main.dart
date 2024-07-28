import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/srcreens/home_screen.dart';
import 'package:to_do_list/srcreens/onboarding.dart';
import 'package:to_do_list/srcreens/order_page.dart';
import 'package:to_do_list/srcreens/signup_page.dart';
import 'package:to_do_list/widgets/load_page.dart';
import 'captcha.dart';
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
      home: const LoadPage(),
      //home: const CaptachaVerification(),


    );
  }
}
