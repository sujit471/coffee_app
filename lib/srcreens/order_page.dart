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

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int count = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          // Update the state when tab changes
        });
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomSheet: Bottomsheet1(
          coffee: widget.order,
        ),
        appBar: AppBar(
          title: const Text("Order"),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            dividerHeight: 0,
            controller: _tabController,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                child: CustomButton(
                  width: 160,
                  foregroundcolor: _tabController.index == 0 ? Colors.white : Colors.black,
                  text: 'Deliver',
                  isActive: _tabController.index == 0,
                  ontap: () {
                    _tabController.animateTo(0);
                  },
                ),
              ),
              Tab(
                child: CustomButton(
                  width: 160,
                  foregroundcolor: _tabController.index == 1 ? Colors.white : Colors.black,
                  text: 'Pickup',
                  isActive: _tabController.index == 1,
                  ontap: () {
                    _tabController.animateTo(1);
                  },
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            // Deliver Tab
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Delivery Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'J1 . Kpg Sutuyo',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Kpg.Sutyo no. 820, Blizen, Istanbul',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      CustomButton(
                        fontsize: 15,
                        text: 'Edit address',
                        width: 190,
                        backgrouncolor: Colors.white,
                        foregroundcolor: Colors.black,
                        icon: Icons.note_add_outlined,
                      ),
                      SizedBox(width: 12),
                      CustomButton(
                        fontsize: 15,
                        text: 'Add note',
                        width: 160,
                        foregroundcolor: Colors.black,
                        backgrouncolor: Colors.white,
                        icon: Icons.newspaper,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48),
                          child: Image.asset(widget.order.image, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.order.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
                      const Spacer(),
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
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 12),
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
                            "1 Discount in Applies",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    "Pickup Summary",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$${widget.order.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
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
                            fontSize: 16,
                          )),
                      Row(
                        children: [
                          Text(
                            '\$2.0',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text('\$1.0'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Pickup Tab
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Self Pickup"),
                  const SizedBox(height: 10),
                  const Text(
                    'J1 . Kpg Sutuyo',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Kpg.Sutyo no. 820, Blizen, Istanbul',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  const CustomButton(
                    fontsize: 15,
                    text: 'Add note',
                    width: 160,
                    foregroundcolor: Colors.black,
                    backgrouncolor: Colors.white,
                    icon: Icons.newspaper,
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48),
                          child: Image.asset(widget.order.image, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.order.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
                      const Spacer(),
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
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 12),
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
                            "1 Discount in Applies",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    "Pickup Summary",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$${widget.order.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
