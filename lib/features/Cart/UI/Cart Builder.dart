import 'package:e_commerce/core/Routes/approuter.dart';
import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/features/Cart/Logic/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartBuilder extends StatelessWidget {
  const CartBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      if (state is CartLoading) {
        return CircularProgressIndicator();
      }
      if (state is CartError) {
        return Center(child: Text(state.Error));
      }
      if (state is CartSuccess) {
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: state.cart.products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                            state.cart.products[index].thumbnail!),
                        title: Text(state.cart.products[index].title),
                        subtitle: Text("${state.cart.products[index].price}"),
                        trailing: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (state.cart.products[index].quantity > 1) {
                                    context.read<CartCubit>().updateCart(
                                        state.cart.products[index].id,
                                        state.cart.products[index].quantity -
                                            1);
                                  } else {
                                    context.read<CartCubit>().removeCart(
                                        state.cart.products[index].id);
                                  }
                                },
                                icon: Icon(Icons.minimize)),
                            Text("${state.cart.products[index].quantity}"),
                            IconButton(
                                onPressed: () {
                                  context.read<CartCubit>().updateCart(
                                      state.cart.products[index].id,
                                      state.cart.products[index].quantity + 1);
                                },
                                icon: Icon(Icons.add))
                          ],
                        ),
                      );
                    })),
            Container(
              color: Colors.white70,
              child: Row(
                children: [
                  Text('${state.cart.total}'),
                  CustomButton(
                      text: 'Checkout',
                      onPressed: () {
                        context.push(ConstantRouter.PaymentScreen);
                      })
                ],
              ),
            )
          ],
        );
      }
      return Text('No Items');
    });
  }
}
