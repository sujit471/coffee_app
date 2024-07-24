import 'package:flutter/material.dart';
import 'package:to_do_list/srcreens/order_page.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/mapsbottom.dart';

import '../model/coffee_model.dart';
class Maps extends StatelessWidget {
  const Maps({super.key, required this.coffee});
final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:Bottomsheet2(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'image/map.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context,MaterialPageRoute(builder:(context)=>OrderPage(order:coffee)));
                      },
                        child: const CustomButton.icon(iconPath: 'icon/arrow.svg')),
                    const CustomButton.icon(iconPath: 'icon/location.svg'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
