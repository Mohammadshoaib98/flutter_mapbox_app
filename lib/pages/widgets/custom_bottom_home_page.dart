import 'package:flutter/material.dart';
import 'package:flutter_mapbox_blog/constants/app_assets.dart';
import 'package:flutter_mapbox_blog/constants/app_colors.dart';
import 'package:flutter_mapbox_blog/pages/common/sized_box_height.dart';
import 'package:flutter_mapbox_blog/pages/widgets/custom_floating_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomHomePage extends StatelessWidget {
 final Function()? onTap;

   const CustomBottomHomePage({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.305,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.h,
                ),
                const SizedBoxH(
                  height: 5,
                ),
                 CustomFloatingButton(
                  onTap:onTap ,
                  color: AppColors.primaryColor,
                  imageColor: AppColors.secondaryColor,
                  image: AppAssets.iconLocation,
                ),
              ],
            ),
            const Column(
              children: [
                CustomFloatingButton(
                  color: AppColors.primaryColor,
                  imageColor: AppColors.secondaryColor,
                  image: AppAssets.iconUsers,
                ),
                SizedBoxH(
                  height: 3,
                ),
                CustomFloatingButton(
                  color: AppColors.primaryColor,
                  imageColor: AppColors.secondaryColor,
                  image: AppAssets.iconLight,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
