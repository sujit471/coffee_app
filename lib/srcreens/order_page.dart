import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/model/coffee_model.dart';
import 'package:to_do_list/widgets/button.dart';
import '../widgets/bottom.dart';

class OrderPage extends StatefulWidget {
  final Coffee order;

  const OrderPage({super.key, required this.order});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _currentIndex = 0;
  int count = 0;

  String get total {
    return (widget.order.price + 1.0).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Bottomsheet1(
        coffee: widget.order,
      ),
      appBar: AppBar(
        title: const Text(
          "Order",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0x00ededed),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      CustomButton(
                        width: 160,
                        foregroundcolor:
                            _currentIndex == 1 ? Colors.white : Colors.black,
                        text: 'Deliver',
                        isActive: _currentIndex == 1,
                        ontap: () {
                          setState(() {
                            _currentIndex = 1;
                            print('tapped');
                          });
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomButton(
                        width: 160,
                        foregroundcolor:
                            _currentIndex == 2 ? Colors.white : Colors.black,
                        text: 'Pickup',
                        isActive: _currentIndex == 2,
                        ontap: () {
                          setState(() {
                            _currentIndex = 2;
                            print('tapped');
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Delivery Address',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'J1 . Kpg Sutuyo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Kpg.Sutyo no. 820,Blizen , Istanbul',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                CustomButton(
                  text: 'Edit address',
                  width: 200,
                  backgrouncolor: Colors.white,
                  foregroundcolor: Colors.black,
                  icon: Icons.note_add_outlined,
                ),
                SizedBox(
                  width: 12,
                ),
                CustomButton(
                  text: 'Add note',
                  width: 150,
                  foregroundcolor: Colors.black,
                  backgrouncolor: Colors.white,
                  icon: Icons.newspaper,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              height: 1,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48),
                    child: Image.asset(widget.order.image, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Text(
                      widget.order.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.order.category,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (count > 1) count--;
                    });
                  },
                  icon: const Icon(Icons.remove, color: Colors.green),
                ),
                Text(
                  '$count',
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  icon: const Icon(Icons.add, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              height: 1,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'icon/discount.svg',
                      color: const Color(0xFFC67C4E),
                      height: 40,
                    ),
                    const Text(
                      "1 Discount in Applies ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Payment Summary",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '\$${widget.order.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery Fee',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                Row(
                  children: [
                    Text(
                      '\$2.0',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text('\$1.0'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
