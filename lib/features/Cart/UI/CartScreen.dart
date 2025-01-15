import 'package:e_commerce/features/Cart/UI/Cart%20Builder.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('CART'),centerTitle: true,),
    body: CartBuilder());
  }
}
