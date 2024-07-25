import 'package:flutter/material.dart';
import 'package:to_do_list/model/coffee_model.dart';
import 'package:to_do_list/service/session_helper.dart';
class ItemsSelected extends StatefulWidget {
  @override
  _ItemsSelectedState createState() => _ItemsSelectedState();
}
class _ItemsSelectedState extends State<ItemsSelected> {
  late Future<List<Coffee>> _selectedCoffeesFuture;

  @override
  void initState() {
    super.initState();
    _selectedCoffeesFuture = SessionHelper.getSelectedCoffees();
  }

  Future<void> _deleteCoffee(int coffeeId) async {
    await SessionHelper.removeSelectedCoffee(coffeeId);
    setState(() {
      _selectedCoffeesFuture = SessionHelper.getSelectedCoffees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items Selected'),
      ),
      body: FutureBuilder<List<Coffee>>(
        future: _selectedCoffeesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No items selected.'));
          } else {
            final List<Coffee> selectedCoffees = snapshot.data!;
            return ListView.builder(
              itemCount: selectedCoffees.length,
              itemBuilder: (context, index) {
                final coffee = selectedCoffees[index];
                return Container(
                  margin: const EdgeInsets.all(8.0), // Margin outside the Container
                  padding: const EdgeInsets.all(16.0), // Padding inside the Container
                  decoration: BoxDecoration(
                    color: const Color(0xFFC67C4E),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: ListTile(
                    title: Text(
                      coffee.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '\$${coffee.price.toStringAsFixed(2)}\nVariation: ${coffee.selectedVariation ?? 'N/A'}',
                      style: const TextStyle(color: Colors.white70), // Subtitle text color
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white), // Icon color
                      onPressed: () {
                        _deleteCoffee(coffee.id);
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
