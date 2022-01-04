
import 'package:firstproject/categories/shopstate.dart';
import 'package:firstproject/enddd/end_point.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modelcategories.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState()){}
  CategoriesModel categoriesModel = CategoriesModel();

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  void getCategories() {
    // diohelper
    //     .getdata(
    //   url: GET_CATEGORIES,
    // )
    //     .then((value) {
    //  // categoriesModel = CategoriesModel.fromJson(value.data);
    //
    //   emit(ShopSuccessCategoriesState());
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(ShopErrorCategoriesState());
    // });
  }
}
