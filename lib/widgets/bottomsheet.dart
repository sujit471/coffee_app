import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/button.dart';
import '../model/coffee_model.dart';
import '../service/session_helper.dart';
import '../srcreens/order_page.dart';

class Bottomsheet extends StatefulWidget {
  final Coffee coffee;
  final String selectedVariation;

  const Bottomsheet({Key? key, required this.coffee, required this.selectedVariation}) : super(key: key);

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                "Price",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                '\$${widget.coffee.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC67C4E),
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            ontap: () async {
              List<Coffee> selectedCoffees = await SessionHelper.getSelectedCoffees();
              widget.coffee.selectedVariation = widget.selectedVariation;
              selectedCoffees.add(widget.coffee);
              await SessionHelper.saveSelectedCoffees(selectedCoffees);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPage(order: widget.coffee,),
                ),
              );
            },
            backgrouncolor: const Color(0xFFC67C4E),
            text: 'Buy Now',
          ),
        ],
      ),
    );
  }
}
