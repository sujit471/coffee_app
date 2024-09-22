import 'package:flutter/material.dart';
import 'package:to_do_list/service/image_helper.dart';
import 'package:to_do_list/service/navigation_to_page.dart';
import 'package:to_do_list/srcreens/order_page.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/maps_bottom.dart';
import 'package:to_do_list/model/coffee_model.dart';
class Maps extends StatelessWidget  with NavigationToPage{
  const Maps({super.key, required this.coffee});
final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:MapsBottom(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
           AssetList.maps,
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
                   goBack(context , OrderPage(order: coffee));
                      },
                        child: const CustomButton.icon(iconPath:    AssetList.back,)),
                    const CustomButton.icon(iconPath:    AssetList.location,),
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
