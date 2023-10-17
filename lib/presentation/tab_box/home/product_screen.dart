import 'package:coffeelito/presentation/tab_box/app_routes.dart';
import 'package:coffeelito/utils/colors.dart';
import 'package:coffeelito/utils/icons.dart';
import 'package:coffeelito/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_F9F9F9,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ZoomTapAnimation(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    margin: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 6,
                              color: Colors.grey,
                              offset: Offset(6.w, 6.h))
                        ]
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.asset(
                            AppIcons.capucino,
                            width: double.infinity,
                            height: 132.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        12.ph,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Capucino",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    fontFamily: "Poppins",
                                    color: AppColors.C_2F2D2C),
                              ),
                              Text(
                                "with Chocolate",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    fontFamily: "Poppins",
                                    color: AppColors.C_9B9B9B),
                              ),
                              8.ph,
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$ 4.53",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: "Sora",
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.C_2F4B4E),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10.r),
                                        color: AppColors.C_C67C4E),
                                    child: SvgPicture.asset(
                                      AppIcons.plusBold,
                                      width: 16.w,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
