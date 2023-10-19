import 'package:coffeelito/presentation/widgets/global_button.dart';
import 'package:coffeelito/utils/colors.dart';
import 'package:coffeelito/utils/icons.dart';
import 'package:coffeelito/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashRadius: 20.r,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppIcons.arrowLeft, width: 20.w),
        ),
        title: Text(
          "Detail",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              fontFamily: "Poppins",
              color: AppColors.C_2F2D2C),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            splashRadius: 20.r,
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.likeBold),
          ),
          12.pw
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              physics: const BouncingScrollPhysics(),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    AppIcons.capucino,
                    height: 226.h,
                    fit: BoxFit.cover,
                  ),
                ),
                20.ph,
                Text(
                  "Cappucino",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      fontFamily: "Poppins",
                      color: AppColors.C_2F2D2C),
                ),
                8.ph,
                Text(
                  "with Chocolate",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      fontFamily: "Poppins",
                      color: AppColors.C_9B9B9B),
                ),
                5.ph,
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: AppColors.C_F9F9F9),
                      child: Center(
                        child: Image.asset(AppIcons.coffeeBean,
                            width: 20.w, height: 20.h),
                      ),
                    ),
                    12.pw,
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: AppColors.C_F9F9F9),
                      child: Center(
                        child: Image.asset(AppIcons.milk,
                            width: 20.w, height: 20.h),
                      ),
                    ),
                  ],
                ),
                20.ph,
                Divider(thickness: 1.sp),
                20.ph,
                Text(
                  "Description",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Poppins",
                      color: AppColors.C_2F2D2C),
                ),
                12.ph,
                Text(
                  "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      color: AppColors.C_9B9B9B),
                ),
                20.ph,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Price\n",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        fontFamily: "Poppins",
                        color: AppColors.C_9B9B9B),
                    children: [
                      TextSpan(
                        text: "\$ 4.53",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            fontFamily: "Poppins",
                            color: AppColors.C_C67C4E),
                      ),
                    ],
                  ),
                ),
                40.pw,
                Expanded(child: GlobalButton(text: "Buy Now", onTap: () {}))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
