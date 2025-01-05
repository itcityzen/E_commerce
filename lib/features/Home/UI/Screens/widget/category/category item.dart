import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/features/Home/Logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String Category;

  CategoryItem({super.key, required this.Category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20.sp),
          height: 50.h,
          width: 50.h,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blueAccent.withOpacity(0.2)),
          child: Center(
            child: Text(
              Category[0].toUpperCase(),
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          Category.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
