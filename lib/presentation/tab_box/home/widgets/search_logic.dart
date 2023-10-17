import 'package:coffeelito/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchLogic extends StatelessWidget {
  const SearchLogic({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      controller: controller,
      decoration: InputDecoration(
        hintText: "Search coffee",
        hintStyle:TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              fontFamily: "Poppins",
              color: AppColors.C_9B9B9B),
        fillColor: AppColors.C_313131,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.C_313131)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.C_313131)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.C_313131)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.C_C67C4E)),
      ),
    );
  }
}
