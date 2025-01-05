import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryItem extends StatelessWidget {
  const ShimmerCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Shimmer.fromColors(
            baseColor: Colors.grey.shade50,
            highlightColor: Colors.grey,
            child: Container(
              height: 60.h,
              width: 60.w,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            )),
        SizedBox(
          height: 8.h,
        ),
        Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.white38,
          child: Container(
            height: 14.h,
            width: 60.w,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
