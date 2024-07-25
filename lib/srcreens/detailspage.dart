import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_list/srcreens/items_selected.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/custom_style_text.dart';
import '../model/coffee_model.dart';
import '../service/custom_sizedbox.dart';
import '../widgets/bottomsheet.dart';
class Detailspage extends StatefulWidget {
  final Coffee coffee;
  final List<Coffee> coffeeList;

  Detailspage({Key? key, required this.coffee, required this.coffeeList})
      : super(key: key);
  @override
  _DetailspageState createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Bottomsheet(
        coffee: widget.coffee,
        selectedVariation: widget.coffee.variations[_currentIndex],
      ),
      appBar: AppBar(
        toolbarHeight: 52,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "Details",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ItemsSelected()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: SvgPicture.asset('icon/heart.svg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(185),
                    child: Image.asset(widget.coffee.image, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.coffee.name,
                    style: CustomStyleText.header(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        widget.coffee.category,
                        style: CustomStyleText.subheader(),
                      ),
                      SizedBoxHelper.width(17),
                      const CustomButton.icon(
                        iconPath: 'icon/scooter.svg',
                        width: 70,
                        backgrouncolor: Colors.white,
                      ),
                      SizedBoxHelper.width(8),
                      const CustomButton.icon(
                        iconPath: 'icon/coffe beans.svg',
                        width: 70,
                        backgrouncolor: Colors.white,
                      ),
                      SizedBoxHelper.width(8),
                      const CustomButton.icon(
                        iconPath: 'icon/milk.svg',
                        width: 70,
                        backgrouncolor: Colors.white,
                      ),
                      SizedBoxHelper.width(8),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBoxHelper.width(2),
                      Text(
                        '${widget.coffee.rating}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBoxHelper.width(7),
                      Text('(${widget.coffee.ratingCount})'),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                SizedBoxHelper.height(12),
             Text(
                  "Description",
                  style: CustomStyleText.header(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.coffee.description,
                    style: CustomStyleText.subheader(
                      color: Colors.grey,
                    )
                  ),
                ),
                 Text(
                  "Size",
                  style:CustomStyleText.header()
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemExtent: 120,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.coffee.variations.length,
                    itemBuilder: (context, index) {
                      String variations = widget.coffee.variations[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? const Color(0xFFC67C4E)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              variations,
                              textAlign: TextAlign.start,
                              style: CustomStyleText.header(
                                color: _currentIndex == index
                                      ? Colors.white
                                : Colors.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
