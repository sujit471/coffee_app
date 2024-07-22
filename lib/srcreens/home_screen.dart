import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/coffee_model.dart';
import '../widgets/card.dart';
import '../srcreens/detailspage.dart';

class CoffeeListPage extends StatefulWidget {
  final List<Coffee> coffeeList;
  const CoffeeListPage({required this.coffeeList, required List coffee});

  @override
  _CoffeeListPageState createState() => _CoffeeListPageState();
}

class _CoffeeListPageState extends State<CoffeeListPage> {

  int _selectedIndex = 0;
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
       preferredSize: const Size.fromHeight(150.0),
       child: AppBar(
         flexibleSpace: SafeArea(
           child: Container(
             decoration: const BoxDecoration(
               color: Colors.black,
             ),
             child: Padding(
               padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Location', style: TextStyle(color: Colors.white)),
                       SizedBox(height: 5),
                       Text('Blizen, Istanbul', style: TextStyle(color: Colors.white)),
                     ],
                   ),
                   const SizedBox(height: 10),
                   Row(
                     children: [
                       Expanded(
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                           ),
                           child: TextField(
                             decoration: InputDecoration(
                               prefixIcon: const Icon(Icons.search),
                               hintText: 'Search coffee',
                               filled: true,
                               fillColor: Colors.grey,
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10.0),
                                 borderSide: BorderSide.none,
                               ),
                               contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                             ),
                             onChanged: (value) {},
                           ),
                         ),
                       ),
                       const SizedBox(width: 12),
                       ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           backgroundColor: const Color(0xFFC67C4E),
                         ),
                         onPressed: () {},
                         child: const Icon(Icons.menu, color: Colors.white),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),
     ),

     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child:Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: widget.coffeeList.asMap().entries.map((entry) {
                 int index = entry.key;
                 Coffee coffee = entry.value;
                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: GestureDetector(
                     onTap: () {
                       setState(() {
                         _currentIndex = index;
                       });
                     },
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                       decoration: BoxDecoration(
                         color: _currentIndex == index ? Color(0xFFC67C4E) : Colors.transparent,
                         borderRadius: BorderRadius.circular(12.0),
                       ),
                       child: Text(
                         coffee.name,
                         textAlign: TextAlign.start,
                         style: TextStyle(
                           fontSize: 19,
                           fontWeight: FontWeight.bold,
                           color: _currentIndex == index ? Colors.white: Colors.black,
                         ),
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                       ),
                     ),
                   ),
                 );
               }).toList(),
             ),
           ),
         ),
         const SizedBox(height: 12),
         Expanded(
           child: GridView.builder(
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               childAspectRatio: 0.75,
               mainAxisSpacing: 10.0,
               crossAxisSpacing: 10.0,
               mainAxisExtent: MediaQuery.sizeOf(context).width * .8,
             ),
             padding: const EdgeInsets.all(10.0),
             itemCount: widget.coffeeList.length,
             itemBuilder: (context, index) {
               Coffee coffee = widget.coffeeList[index];
               return ImageCard(
                 imageWidth: 160,
                 imageHeight: 180,
                 coffee: coffee,
                 tag: coffee.rating,
                 tagColor: Colors.black54,
               );
             },
           ),
         ),
       ],
     ),
     bottomNavigationBar: Theme(
       data: ThemeData(
         canvasColor:  Colors.white,
       ),
       child: SizedBox(
         width: 93,
         height: 80,
         child: BottomNavigationBar(
           items: <BottomNavigationBarItem>[
             BottomNavigationBarItem(
               icon: BuildBottomNavItem('icon/home.svg', 0),
               label: 'Home',
             ),
             BottomNavigationBarItem(
               icon: BuildBottomNavItem('icon/heart.svg', 1),
               label: 'Category',
             ),
             BottomNavigationBarItem(
               icon: BuildBottomNavItem('icon/notification.svg', 2),
               label: 'Profile',
             ),
             BottomNavigationBarItem(
               icon: BuildBottomNavItem('icon/wallet.svg', 3),
               label: 'Profile',
             ),
           ],
           currentIndex: _selectedIndex,
           onTap: _onItemTapped,
           showSelectedLabels: true,
           showUnselectedLabels: true,
           selectedItemColor: Colors.black,
           unselectedItemColor: Colors.black.withOpacity(0.5),
           selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
           unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
           backgroundColor: Colors.white,
         ),
       ),
     ),
            );
  }

  Widget BuildBottomNavItem(String assetName, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      width: 90,
      decoration: isSelected
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFC67C4E),
      )
          : null,
      padding: EdgeInsets.all(isSelected ? 8.0 : 0),
      child: SvgPicture.asset(
        assetName,
        height: 32,
        width: 32,
      ),
    );
  }
}
