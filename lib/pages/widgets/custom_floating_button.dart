import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingButton extends StatelessWidget {
  final Color color;
  final String image;
  final Color imageColor;
  final Function()? onTap;
  const CustomFloatingButton(
      {super.key,
      required this.color,
      required this.image,
      this.onTap,
      required this.imageColor});

  @override
  Widget build(BuildContext context) {
    return 
    
    
    
    InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 45.w,
        height: 45.h,
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                
                child: Image.asset(
                  image,
                  color: imageColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
