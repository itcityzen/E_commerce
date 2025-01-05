import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrettyLoadingWidget extends StatelessWidget {
  const PrettyLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SpinKitFadingCircle(
        color: Colors.blue,
        size: 50.0.sp,
      ),
    );
  }
}