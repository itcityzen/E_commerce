import 'package:e_commerce/core/Routes/approuter.dart';
import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/features/Home/Data/Model/ProductResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  Product product;

  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(ConstantRouter.productDetails,extra: product);
      },
      child: Container(
        width: 180.w,
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 3))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _ItemProductImage(),
            Padding(
              padding: EdgeInsets.all(1.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ItemProductTitle(context),
                  SizedBox(
                    height: 2.h,
                  ),
                  _ItemProductPrice()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _ItemProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      child: Image.network(
        product.images![0],
        height: 120.h,
        width: 100.w,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.error,
            size: 40.sp,
          );
        },
      ),
    );
  }

  Widget _ItemProductTitle(BuildContext context) {
    return Text(
      product.title ?? 'no title',
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _ItemProductPrice() {
    return Text(
      '${product.price} \$',
      style: TextStyle(
          fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.black),
      overflow: TextOverflow.ellipsis,
    );
  }
}
