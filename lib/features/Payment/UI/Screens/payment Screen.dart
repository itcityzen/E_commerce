import 'package:e_commerce/features/Payment/Address/Logic/address_cubit.dart';
import 'package:e_commerce/features/Payment/UI/Widgets/Payment%20Button%20Consumer.dart';
import 'package:e_commerce/features/Payment/UI/Widgets/address%20builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.read<AddressCubit>().getCurrentLocationData();
                  },
                  icon: Icon(Icons.location_on)),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Delivery Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          AddressBuilder(),
          SizedBox(
            height: 200.h,
          ),
          PaymentButtonConsumer(amount: 2000)
        ],
      ),
    );
  }
}
