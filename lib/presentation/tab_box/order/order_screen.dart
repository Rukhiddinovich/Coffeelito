import 'package:coffeelito/presentation/widgets/global_button.dart';
import 'package:coffeelito/utils/colors.dart';
import 'package:coffeelito/utils/icons.dart';
import 'package:coffeelito/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: AppColors.white,
        title: Text(
          "Order",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ...List.generate(2, (index) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 24.w),
                    child: Row(
                      children: [
                        Image.asset(
                          AppIcons.capucino,
                          width: 54.w,
                          fit: BoxFit.cover,
                        ),
                        12.pw,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cappucino",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                            ),
                            Text(
                              "with Chocolate",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Ink(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(100.r),
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.C_EAEAEA)),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppIcons.minus,
                                        width: 16.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              8.pw,
                              Text(
                                "1",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              8.pw,
                              Ink(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(100.r),
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.C_EAEAEA)),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppIcons.plus,
                                        width: 16.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
                Container(
                    height: 4.h,
                    decoration: const BoxDecoration(color: Color(0xFFF4F4F4)))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Summary",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.C_2F2D2C),
                ),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.C_2F2D2C),
                    ),
                    Text(
                      "\$ 4.53",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.C_2F2D2C),
                    ),
                  ],
                ),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Free",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.C_2F2D2C),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$ 2.0",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.C_2F2D2C),
                        ),
                        8.pw,
                        Text(
                          "\$ 1.0",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.C_2F2D2C),
                        ),
                      ],
                    ),
                  ],
                ),
                16.ph,
                const Divider(height: 1),
                16.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Payment",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.C_2F2D2C),
                    ),
                    Text(
                      "\$ 5.53",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.C_2F2D2C),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: GlobalButton(text: "Order", onTap: () {}),
          )
        ],
      ),
    );
  }
}
