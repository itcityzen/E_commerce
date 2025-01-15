import 'package:e_commerce/core/Routes/approuter.dart';
import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/features/Home/UI/Screens/BannerCarouselSlider.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/category/category%20builder.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/products/product%20builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../Cart/Logic/cart_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                context.read<CartCubit>().getCart();
                context.push(ConstantRouter.cartScreen);
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            BannerCarouselSlider(),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Category',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            CategoryBuilder(),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'New Arrivals',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            ProductBuilder()
          ],
        ),
      ),
    );
  }
}
