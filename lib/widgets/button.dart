import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? foregroundcolor;
  final Color? backgrouncolor;
  final Function? ontap;
  final String iconPath;
  final IconData? icon;
  final bool? isActive;

  const CustomButton({
    super.key,
    required this.text,
    this.width,
    this.foregroundcolor,
    this.ontap,
    this.backgrouncolor,
    this.icon,
    this.isActive,
  }) : iconPath = '';

  const CustomButton.icon({
    super.key,
    required this.iconPath,
    this.width,
    this.foregroundcolor,
    this.ontap,
    this.backgrouncolor,
    this.icon,
    this.isActive,
  }) : text = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isActive ?? false ? const Color(0xFFC67C4E) : Colors.white,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundcolor ?? Colors.white,
          backgroundColor: backgrouncolor ??Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: ontap as void Function()?,
        child: Center(
          child: iconPath.isNotEmpty
              ? SvgPicture.asset(
            height: 30,
            width: 30,
            iconPath,
            color: foregroundcolor ?? const Color(0xFFC67C4E),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) Icon(icon, color: foregroundcolor ?? Colors.white),
              if (icon != null) const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    color: foregroundcolor ?? Colors.white,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
