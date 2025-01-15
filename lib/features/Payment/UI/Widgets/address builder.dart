import 'package:e_commerce/features/Payment/Address/Logic/address_cubit.dart';
import 'package:e_commerce/features/Payment/UI/Widgets/address%20card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBuilder extends StatelessWidget {
  const AddressBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
      if (state is AddressLoading) {
        return AddressCard(
            content: 'Loading', iconData: Icons.location_on_outlined);
      }
      if (state is AddressSuccess) {
        return AddressCard(content: state.Address, iconData: Icons.location_on);
      }
      if (state is AddressError) {
        return AddressCard(content: state.Error, iconData: Icons.location_off);
      }
      return AddressCard(
          content: 'Start Address', iconData: Icons.location_city);
    });
  }
}
