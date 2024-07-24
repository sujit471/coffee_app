import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/srcreens/Maps.dart';
import 'package:to_do_list/widgets/button.dart';
import '../model/coffee_model.dart';
import '../srcreens/order_page.dart';

class Bottomsheet1 extends StatefulWidget {
  final Coffee coffee;

  const Bottomsheet1({Key? key, required this.coffee}) : super(key: key);

  @override
  State<Bottomsheet1> createState() => _Bottomsheet1State();
}

class _Bottomsheet1State extends State<Bottomsheet1> {
  String get total {
    return (widget.coffee.price + 1.0).toStringAsFixed(2);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'icon/wallet.svg',
                color: const Color(0xFFC67C4E),
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Cash/Wallet",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(' \$ $total',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC67C4E),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 200,
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
          const Spacer(),
          CustomButton(
            ontap: () {

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(backgroundColor:Color(0xFFC67C4E),elevation: BorderSide.strokeAlignOutside,
                padding: EdgeInsets.all(8),
                duration: Duration(seconds: 2),
                    content: Text("Your order has been placed")),

              );

              // Navigate to the next page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Maps(coffee: widget.coffee,),
                ),
              );
            },
            backgrouncolor: const Color(0xFFC67C4E),
            text: 'Order',
          )

        ],
      ),
    );
  }
}
