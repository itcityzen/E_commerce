import 'package:e_commerce/features/Home/Data/Model/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(100.r)),
            child: Image.network(
              product.thumbnail!,
              height: 120.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          Text(product.description!)
        ],
      ),
    );
  }
}
