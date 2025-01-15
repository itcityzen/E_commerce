import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/features/Home/Logic/home_cubit.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/category/category%20item.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/category/category%20loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return LoadingCategory();
      }
      if (state is HomeSuccess) {
        return Container(
          width: 400.w,
          height: 300.h,
          child: GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.sp,
                  mainAxisSpacing: 1.sp,
                  childAspectRatio: 1.3.sp),
              scrollDirection: Axis.horizontal,
              itemCount: state.category.length,
              itemBuilder: (context, index) {
                return CategoryItem(Category: state.category[index]);
              }
              ),
        );
      }
      if (state is HomeError) {
        return Text(state.Failure);
      }
      return Text('No Data');
    });
  }
}
