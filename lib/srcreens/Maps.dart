import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/mapsbottom.dart';
class Maps extends StatelessWidget {
  const Maps({super.key});

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
          const Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    CustomButton.icon(iconPath: 'icon/arrow.svg'),
                    CustomButton.icon(iconPath: 'icon/location.svg'),
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
