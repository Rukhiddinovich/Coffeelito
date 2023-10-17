import 'package:coffeelito/presentation/tab_box/app_routes.dart';
import 'package:coffeelito/utils/colors.dart';
import 'package:coffeelito/utils/icons.dart';
import 'package:coffeelito/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_F9F9F9,
      // appBar: AppBar(
      //   toolbarHeight: 0,
      //   // title: Text("Coffee Lito", style: TextStyle(color: AppColors.C_2F2D2C)),
      //   // backgroundColor: AppColors.C_F9F9F9,
      // ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 38.h,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: AppColors.white,
                statusBarIconBrightness: Brightness.dark),
            backgroundColor: AppColors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                  bottom: 8.h,
                ),
                child: SizedBox(
                  height: 36.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        10,
                        (index) => ZoomTapAnimation(
                          onTap: () {},
                          child: Container(
                            height: 20.h,
                            margin: EdgeInsets.symmetric(
                              horizontal: 4.w,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: index == 0
                                  ? AppColors.C_C67C4E
                                  : AppColors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Cappuccino",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: index == 0
                                        ? AppColors.white
                                        : AppColors.C_2F4B4E),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.h,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
                childAspectRatio: 0.6.h,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ZoomTapAnimation(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.detailScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 3,
                                blurRadius: 6,
                                color: Colors.grey,
                                offset: Offset(6.w, 6.h))
                          ]),
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
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
