import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final double? width;
  final Color? foregroundcolor;
  final Color? backgrouncolor;
  final Function? ontap;
  final String iconPath;

  const CustomButton({
    super.key,
    this.color,
    required this.text,
    this.width,
    this.foregroundcolor,
    this.ontap,
    this.backgrouncolor,
  }) : iconPath = '';

  const CustomButton.icon({
    super.key,
    this.color,
    required this.iconPath,
    this.width,
    this.foregroundcolor,
    this.ontap,
    this.backgrouncolor,
  }) : text = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      height: 50,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundcolor ?? Colors.white,
          backgroundColor: backgrouncolor ?? Theme.of(context).primaryColor,
        ),
        onPressed: () {
          if (ontap != null) {
            ontap!();
          }
        },
        child: Center(
          child: iconPath.isNotEmpty
              ? SvgPicture.asset(height: 50,
            width: 30,
            iconPath,
            color: const Color(0xFFC67C4E),
          )
              : Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
