import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/custom_style_text.dart';
import 'package:to_do_list/model/coffee_model.dart';
import 'package:to_do_list/service/navigation_to_page.dart';
import 'package:to_do_list/service/session_helper.dart';
import 'package:to_do_list/srcreens/order_page.dart';

class Bottomsheet extends StatefulWidget {
  final Coffee coffee;
  final String selectedVariation;

  const Bottomsheet({Key? key, required this.coffee, required this.selectedVariation}) : super(key: key);

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}
class _BottomsheetState extends State<Bottomsheet> with NavigationToPage{
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
                style:CustomStyleText.header(
                  color: const Color(0xFFC67C4E),
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            ontap: () async {
              List<Coffee> selectedCoffees = await SessionHelper.getSelectedCoffees();
              widget.coffee.selectedVariation = widget.selectedVariation;
              bool isAlreadySelected = selectedCoffees.any(
                      (coffee) =>
                  coffee.id == widget.coffee.id &&
                      coffee.selectedVariation == widget.coffee.selectedVariation
              );
              if (isAlreadySelected) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text('This coffee with selected variation is already selected.'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                    elevation: 4,
                   behavior: SnackBarBehavior.floating,
                    backgroundColor:  Color(0xFFC67C4E),
                    duration: Duration(seconds: 2),
                    content: Text('Your order is being processed'),
                  ),
                );
                selectedCoffees.add(widget.coffee);
                await SessionHelper.saveSelectedCoffees(selectedCoffees);
              navigateTo(context, OrderPage(order: widget.coffee));
              }
            },
            backgrouncolor: const Color(0xFFC67C4E),
            text: 'Buy Now',
          ),
        ],
      ),
    );
  }
}
