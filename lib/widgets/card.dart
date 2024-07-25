import 'package:flutter/material.dart';
import 'package:to_do_list/service/custom_sizedbox.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/custom_style_text.dart';
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
  const ImageCard({
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
                            //  const SizedBox(width: 4),
                              SizedBoxHelper.width(4),
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
              SizedBoxHelper.height( 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  coffee.name,
                  textAlign: TextAlign.start,
                  style: CustomStyleText.header(),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  coffee.category,
                  textAlign: TextAlign.start,
                  style: CustomStyleText.subheader(),
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
                      style: CustomStyleText.header(),
                    ),
                     SizedBoxHelper.width( 24),
                    const CustomButton(
                      width: 60,
                      text: "+",
                      isActive: true,
                      foregroundcolor: Colors.white,
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
