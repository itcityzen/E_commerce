import 'package:e_commerce/core/Routes/approuter.dart';
import 'package:e_commerce/features/Cart/Logic/cart_cubit.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/NameRating.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/ProductImageViewer.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/ProductInfoSection.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/ReviewSection.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/CustomButton.dart';
import '../../Data/Model/ProductResponse.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageViewer(images: product.images!),
            verticalSpace(20),
            NameRating(
              product: product,
            ),
            verticalSpace(20),
            ProductInfoSection(product: product),
            verticalSpace(20),
            Text('Description', style: Theme.of(context).textTheme.titleSmall),
            Text(product.description ?? 'No description available'),
            verticalSpace(20),
            ReviewSection(reviews: product.reviews!),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.grey),
            iconSize: 24.sp,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: CustomButton(
                  text: "Buy Now",
                  onPressed: () {
                    context.push(ConstantRouter.PaymentScreen);
                  }),
            ),
          ),
          BlocListener<CartCubit, CartState>(
            listener: (context, stateCart) {
              if (stateCart is CartSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Added to cart successfully!")));
              }
            },
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: CustomButton(
                    text: "Add to cart",
                    onPressed: () {
                      context.read<CartCubit>().addCart(product);

                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
