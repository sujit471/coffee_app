import 'package:flutter/material.dart';
import 'package:to_do_list/model/coffee_model.dart';

class OrderPage extends StatefulWidget {
  final Coffee order;

  OrderPage({super.key, required this.order});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order",
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12,),
          const Divider(
            height: 1,
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              ClipRRect(
                child: Image.asset(
                height: 120,
                widget.order.image,
                            ),
              ),
             SizedBox(width: 12,),
             Column(
                children: [
                  Text(widget.order.name,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                  Text(widget.order.category,style: const TextStyle(

                    fontSize: 14,
                  ),),

                ],
              ),
              SizedBox(width: 100,),
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
          const SizedBox(height: 12,),
          const Divider(
            height: 1,
          ),
          const SizedBox(height: 12,),
        ],
      ),
    );
  }
}
