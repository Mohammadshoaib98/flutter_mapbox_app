import 'package:flutter/material.dart';
import 'package:flutter_mapbox_blog/constants/app_colors.dart';
import 'package:flutter_mapbox_blog/models/map_marker_model.dart';
import 'package:flutter_mapbox_blog/pages/widgets/custom_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItem extends StatelessWidget {
  final MapMarker item;
  const CustomItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        height: size.height*0.30,
        decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Economy",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                  Container(
                    height: 35.h,
                    width: size.width * 0.44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.backgroundColor),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text("Go",
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 18.sp)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Row(
                children: [
                  CustomCardWidget(
                    image: item.image2,
                    title: 'Carpool',
                    textColor: AppColors.primaryColor,
                    time: '12:28',
                    color: AppColors.backgroundColor,
                    price: '16.68\$',
                  ),
                  CustomCardWidget(
                    image: item.image,
                    title: 'Carpool',
                    textColor: AppColors.secondaryColor,
                    time: '12:28',
                    color: AppColors.primaryColor,
                    price: '16.68\$',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                   
                    child: Row(
                      
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w),
                          child: Text(
                            item.title ?? '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
