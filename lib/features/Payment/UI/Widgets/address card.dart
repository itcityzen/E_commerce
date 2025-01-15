import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String content;
  final IconData iconData;

  const AddressCard({super.key, required this.content, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 3,
      child: ListTile(
        title: Text('Shipping Address'),
        subtitle: Text(content),
        leading: Icon(iconData),
      ),
    );
  }
}
