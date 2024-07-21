import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/button.dart';
import '../model/coffee_model.dart';
import '../srcreens/detailspage.dart';

class ImageCard extends StatelessWidget {
  final Coffee coffee;
  final double? tag;
  final Color? tagColor;
  final double imageWidth;
  final double imageHeight;
  final double? space;
  final String? type;

  ImageCard({
    required this.coffee,
    this.tag,
    this.tagColor,
    this.imageWidth = 300,
    this.imageHeight = 400,
    this.space,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detailspage(coffee: coffee, coffeeList: [],),
            )
        );
      },
      child: Card(
        elevation: 4,
        child: Container(
          width: double.infinity,
         height: 160,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(coffee.image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:  BorderRadius.circular(12),
                      ),
                    ),
                    if (tag != null)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: tagColor ?? Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 4),
                              Text(
                                tag!.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  coffee.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  coffee.category,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                  ),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${coffee.price.toStringAsFixed(2)}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 24),
                    const CustomButton(
                      width: 60,
                      text: "+",
                      foregroundcolor: Color(0xFFEDD6CB),
                      backgrouncolor: Color(0xFFC67C4E),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
