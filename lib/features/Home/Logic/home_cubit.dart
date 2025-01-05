import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/Styles/ColorsManager.dart';
import 'package:e_commerce/features/Home/Data/Model/ProductResponse.dart';
import 'package:e_commerce/features/Home/Data/Repository/HomeRepository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;

  HomeCubit(this.homeRepository) : super(HomeInitial());
  List<String> Categories = [];
  List<Product> Products = [];

  Future HomeData() async {
    emit(HomeLoading());
    if (!Categories.isEmpty && !Products.isEmpty) {
      return;
    }

    try {
      final resultCategory = await homeRepository.getCategory();
      final resultProducts = await homeRepository.getNewArrivals();

      if (resultCategory.isSuccess && resultProducts.isSuccess) {
        Categories = resultCategory.Data!;
        Products = resultProducts.Data!.products!;

        emit(HomeSuccess(Categories, Products));
      } else {
        emit(HomeError(resultCategory.Error!));
      }
    } catch (e) {
      emit(HomeError('Error $e '));
    }
  }
}
