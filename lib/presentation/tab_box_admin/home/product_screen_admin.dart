import 'package:coffeelito/presentation/tab_box/app_routes.dart';
import 'package:coffeelito/presentation/tab_box/home/widgets/search_logic.dart';
import 'package:coffeelito/utils/colors.dart';
import 'package:coffeelito/utils/icons.dart';
import 'package:coffeelito/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreenAdmin extends StatefulWidget {
  const ProductScreenAdmin({super.key});

  @override
  State<ProductScreenAdmin> createState() => _ProductScreenAdminState();
}

class _ProductScreenAdminState extends State<ProductScreenAdmin> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.C_F9F9F9,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColors.C_131313,
              statusBarIconBrightness: Brightness.light),
          toolbarHeight: 0,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      30.ph,
                      SearchLogic(controller: searchController),
                      20.ph,
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return Container(
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
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: AppColors.C_C67C4E),
                                    child: IconButton(
                                      onPressed: (){
                                        Navigator.pushNamed(context, RouteNames.editScreen);
                                      },
                                      icon: SvgPicture.asset(
                                        AppIcons.edit,
                                        color: Colors.white,
                                        width: 16.w,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
