import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/srcreens/Maps.dart';
import 'package:to_do_list/widgets/button.dart';
import '../model/coffee_model.dart';
import '../srcreens/order_page.dart';

class Bottomsheet2 extends StatefulWidget {
  const Bottomsheet2({Key? key}) : super(key: key);

  @override
  State<Bottomsheet2> createState() => _Bottomsheet2State();
}

class _Bottomsheet2State extends State<Bottomsheet2> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(

        children: [
          SizedBox(height: 30,),
          const Text('10 Minutes left',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),),
          const Text('Delivery to J1.kpg Sutoyo'),
          SizedBox(height: 10,),
          Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),

            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomButton.icon(iconPath: 'icon/scooter.svg'),
                  SizedBox(
                    width: 10,
                  ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivered your order',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
                      Text('We will deliver your goods to you in',style: TextStyle(fontSize: 12),),
                      Text('the shortest possible time.',style: TextStyle(fontSize: 12),),

                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Row(

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                  child: Image.asset('image/coffee.jpg',height: 50,width: 50,),),
              SizedBox(width: 5,),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Brooklyn Simmons',style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
                  Text('Personal Courier'),
                ],
              ),
              SizedBox(width: 38,),

              const CustomButton.icon(iconPath: 'icon/wallet.svg',),
            ],
          )
        ],
      ),
    );
  }
}
