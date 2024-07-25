import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/button.dart';

import '../service/custom_sizedbox.dart';
import 'custom_style_text.dart';
class MapsBottom extends StatefulWidget {
  const MapsBottom({Key? key}) : super(key: key);

  @override
  State<MapsBottom> createState() => _MapsBottomState();
}
class _MapsBottomState extends State<MapsBottom> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      color: Colors.white,
      padding:  const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(

        children: [
          SizedBoxHelper.height(30),
          Text('10 Minutes left', style: CustomStyleText.header(),),
          const Text('Delivery to J1.kpg Sutoyo'),
          SizedBoxHelper.height(10),
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

            child:  Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CustomButton.icon(iconPath: 'icon/scooter.svg'),
                  SizedBoxHelper.width(10),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivered your order', style: CustomStyleText.header(),),
                      const Text('We will deliver your goods to you in',style: TextStyle(fontSize: 12),),
                      const Text('the shortest possible time.',style: TextStyle(fontSize: 12),),

                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBoxHelper.height(15),
          Row(

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                  child: Image.asset('image/coffee.jpg',height: 50,width: 50,),),
              SizedBoxHelper.width(5),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Brooklyn Simmons', style: CustomStyleText.header(),),
                  const Text('Personal Courier'),
                ],
              ),
              const SizedBox(width: 38,),

              const CustomButton.icon(iconPath: 'icon/wallet.svg',),
            ],
          )
        ],
      ),
    );
  }
}
