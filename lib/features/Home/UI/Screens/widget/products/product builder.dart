import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/features/Home/Logic/home_cubit.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/products/product%20item.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/products/product%20shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.sp,
              mainAxisSpacing: 2.sp,
              childAspectRatio: 0.64.sp),
          itemCount: 6,
          itemBuilder: (context, index) {
            return ShimmerProductItem();
          },
        );
      }
      if (state is HomeSuccess) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.sp,
              mainAxisSpacing: 2.sp,
              childAspectRatio: 0.79.sp),
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            return ProductItem(product: state.products[index]);
          },
        );
      }
      if (state is HomeError) {
        return Text(state.Failure);
      }
      return Text('Error');
    });
  }
}
