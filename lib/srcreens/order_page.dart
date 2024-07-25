import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/model/coffee_model.dart';
import 'package:to_do_list/service/custom_sizedbox.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/custom_style_text.dart';
import '../widgets/order_bottom.dart';
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
  int _curretIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          _curretIndex = _tabController.index;

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
        bottomSheet: OrderBottom(
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
              CustomButton(
                width: 160,
                foregroundcolor: _curretIndex== 0 ? Colors.white : Colors.black,
                text: 'Deliver',
                isActive: _curretIndex== 0,
                ontap: () {
                  _tabController.animateTo(0);
                },
              ),
              CustomButton(
                width: 160,
                foregroundcolor: _curretIndex == 1 ? Colors.white : Colors.black,
                text: 'Pickup',
                isActive: _curretIndex == 1,
                ontap: () {
                  _tabController.animateTo(1);
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            // Deliver Tab
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxHelper.height(40),
                  Text(
                    'Delivery Address',
                    style: CustomStyleText.subheader(fontweight: FontWeight.bold),
                  ),
                  SizedBoxHelper.height(10),
                 Text(
                    'J1 . Kpg Sutuyo',
                    style: CustomStyleText.subheader(fontweight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Kpg.Sutyo no. 820, Blizen, Istanbul',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                   SizedBoxHelper.height(15),
                   Row(
                    children: [
                      const CustomButton(
                        fontsize: 15,
                        text: 'Edit address',
                        width: 190,
                        backgrouncolor: Colors.white,
                        foregroundcolor: Colors.black,
                        icon: Icons.note_add_outlined,
                      ),
                      SizedBoxHelper.width(12),
                      const CustomButton(
                        fontsize: 15,
                        text: 'Add note',
                        width: 160,
                        foregroundcolor: Colors.black,
                        backgrouncolor: Colors.white,
                        icon: Icons.newspaper,
                      ),
                    ],
                  ),
                 SizedBoxHelper.height( 12),
                  const Divider(height: 1),
                   SizedBoxHelper.height(12),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48),
                          child: Image.asset(widget.order.image, fit: BoxFit.cover),
                        ),
                      ),
                       SizedBoxHelper.width( 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.order.name,
                            style: CustomStyleText.subheader(fontweight: FontWeight.bold),
                          ),
                          Text(
                            widget.order.category,
                            style: CustomStyleText.subheader(color: Colors.grey),
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
                   SizedBoxHelper.height(12),
                  const Divider(height: 1),
                   SizedBoxHelper.height(12),
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
                            'assets/icon/discount.svg',
                            color: const Color(0xFFC67C4E),
                            height: 40,
                          ),
                          Text(
                            "1 Discount in Applies",
                            style: CustomStyleText.subheader(fontweight: FontWeight.bold),
                          ),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Pickup Summary",
                    style: CustomStyleText.header(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: CustomStyleText.subheader(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Fee',
                          style: CustomStyleText.subheader()),
                     Row(
                        children: [
                          const Text(
                            '\$2.0',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBoxHelper.width(12),
                          const Text('\$1.0'),
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
                  Text("Self Pickup", style: CustomStyleText.subheader()),
                  SizedBoxHelper.height(10),
                  Text(
                    'J1 . Kpg Sutuyo',
                    style: CustomStyleText.header(),
                  ),
                  SizedBoxHelper.height(12),
                 Text(
                    'Kpg.Sutyo no. 820, Blizen, Istanbul',
                      style: CustomStyleText.subheader(color: Colors.grey)
                  ),
                  SizedBoxHelper.height(15),
                  const CustomButton(
                    fontsize: 15,
                    text: 'Add note',
                    width: 160,
                    foregroundcolor: Colors.black,
                    backgrouncolor: Colors.white,
                    icon: Icons.newspaper,
                  ),
                  SizedBoxHelper.height(12),
                  const Divider(height: 1),
                  SizedBoxHelper.height(12),
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
                  SizedBoxHelper.height(12),
                  const Divider(height: 1),
                  SizedBoxHelper.height(12),
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
