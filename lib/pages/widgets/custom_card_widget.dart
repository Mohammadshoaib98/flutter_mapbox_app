import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardWidget extends StatelessWidget {
  final String? image;
  final String title;
  final String price;
  final String time;
  final Color? color;
  final Color? textColor;
  const CustomCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    this.color = Colors.white,
    this.textColor,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Expanded(
      child: Card(
        shadowColor: color,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Container(
          height: size.height.h * 0.15,
          width: 200.w,
          decoration: BoxDecoration(
              color: color,
          
              borderRadius: BorderRadius.circular(8.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                Text(
                  price,
                  style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time,
                        style: TextStyle(color: textColor, fontSize: 14.sp),
                      ),
                      Container(
                        height: 120.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              image ?? '',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
