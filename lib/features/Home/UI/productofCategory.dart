import 'package:e_commerce/features/Home/Logic/productofcategory_cubit.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/category/category%20loading.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/products/product%20item.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/products/product%20shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductofCategory extends StatelessWidget {
  final String CategoryName;
  const ProductofCategory({super.key, required this.CategoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<ProductofcategoryCubit, ProductofcategoryState>(
            builder: (context, state) {
      if (state is ProductofcategoryLoading) {
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1.sp,
                mainAxisSpacing: 1.sp,
                childAspectRatio: 0.59.sp),
            itemCount: 8,
            itemBuilder: (context, index) {
              return ShimmerProductItem();
            });
      }
      if (state is ProductofcategorySuccess) {
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1.sp,
                mainAxisSpacing: 1.sp,
                childAspectRatio: 0.59.sp),
            itemCount: state.productsCategory.length,
            itemBuilder: (context, index) {
              return ProductItem(product: state.productsCategory[index]);
            });
      }
      if (state is ProductofcategoryError) {
        return Text(state.Failure);
      }
      return Text('No Data');
    }));
  }
}
