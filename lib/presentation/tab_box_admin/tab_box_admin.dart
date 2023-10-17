import 'package:coffeelito/cubit/tab_box/tab_box_cubit.dart';
import 'package:coffeelito/presentation/tab_box/home/product_screen.dart';
import 'package:coffeelito/presentation/tab_box/order/order_screen.dart';
import 'package:coffeelito/presentation/tab_box_admin/home/product_screen_admin.dart';
import 'package:coffeelito/presentation/tab_box_admin/order/order_screen.dart';
import 'package:coffeelito/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TabBoxAdmin extends StatelessWidget {
  TabBoxAdmin({super.key});

  List<Widget> pages = [
    const ProductScreenAdmin(),
    const ProductScreenAdmin(),
    const OrderScreenAdmin(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: context.watch<TabCubit>().state,
        children: pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
          child: BottomNavigationBar(
            backgroundColor: AppColors.C_131313,
            elevation: 0,
            currentIndex: context.watch<TabCubit>().state,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: context.read<TabCubit>().changeTab,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.house_alt_fill,
                    color: AppColors.white, size: 28.r),
                activeIcon: Icon(CupertinoIcons.house_alt_fill,
                    color: const Color(0xFFBE9173), size: 28.r),
                label: '•',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart_fill,
                    color: AppColors.white, size: 28.r),
                activeIcon: Icon(CupertinoIcons.cart_fill,
                    color: const Color(0xFFBE9173), size: 28.r),
                label: '•',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_fill,
                    color: AppColors.white, size: 28.r),
                activeIcon: Icon(CupertinoIcons.person_fill,
                    color: const Color(0xFFBE9173), size: 28.r),
                label: '•',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
