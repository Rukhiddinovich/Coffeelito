import 'package:coffeelito/presentation/tab_box/app_routes.dart';
import 'package:coffeelito/presentation/widgets/global_button.dart';
import 'package:coffeelito/utils/colors.dart';
import 'package:coffeelito/utils/icons.dart';
import 'package:coffeelito/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.black,
            statusBarIconBrightness: Brightness.light),
      ),
      body: Stack(
        children: [
          Image.asset(AppIcons.onBoarding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Coffee so good, your taste buds will love it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: "Poppins",
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w600),
                ),
                8.ph,
                Text(
                  "The best grain, the finest roast, the powerful flavor.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.C_A9A9A9,
                      fontFamily: "Poppins",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                24.ph,
                GlobalButton(
                    text: "Get Started",
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.tabBox);
                    }),
                12.ph
              ],
            ),
          )
        ],
      ),
    );
  }
}
