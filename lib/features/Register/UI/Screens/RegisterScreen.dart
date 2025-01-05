import 'package:e_commerce/features/Register/UI/Screens/Widgets/ButtonConsumer.dart';
import 'package:e_commerce/features/Register/UI/Screens/Widgets/formRegister.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150.h,
          ),
          Text(
            'Register Now ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 30.h,
          ),
          formRegister(),
          SizedBox(
            height: 30.h,
          ),
          RegisterButtonConsumer()
        ],
      ),
    );
  }
}
