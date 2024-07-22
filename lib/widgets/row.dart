import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_list/widgets/button.dart';
import '../model/coffee_model.dart';

class ItemsinRow extends StatelessWidget {
  final Coffee coffee;

  ItemsinRow({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffee.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    coffee.category,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 12),
                   CustomButton.icon(
                    iconPath: 'icon/scooter.svg',
                    width: 40,
                    backgrouncolor: Colors.grey,
                  ),
                  const SizedBox(width: 12),
                CustomButton.icon(
                    iconPath: 'icon/coffee beans.svg',
                    width: 40,
                    backgrouncolor: Colors.grey,
                  ),
                  const SizedBox(width: 12),
                  CustomButton.icon(
                    iconPath: 'icon/milk.svg',
                    width: 40,
                    backgrouncolor: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
