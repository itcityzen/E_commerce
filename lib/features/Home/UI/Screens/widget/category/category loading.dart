import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/category/category%20shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingCategory extends StatelessWidget {
  const LoadingCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {

            return ShimmerCategoryItem();

          }),
    );
  }
}
