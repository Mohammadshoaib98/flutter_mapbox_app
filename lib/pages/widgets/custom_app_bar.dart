import 'package:flutter/material.dart';
import 'package:flutter_mapbox_blog/constants/app_assets.dart';
import 'package:flutter_mapbox_blog/constants/app_colors.dart';
import 'package:flutter_mapbox_blog/pages/widgets/custom_floating_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomFloatingButton(
              onTap: () {},
              color: AppColors.primaryColor,
              image: AppAssets.iconMenu,
              imageColor: AppColors.secondaryColor,
            ),
            CustomFloatingButton(
              onTap: () {},
              color: AppColors.backgroundColor,
              image: AppAssets.iconWave,
              imageColor: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
