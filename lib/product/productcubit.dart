
import 'package:firstproject/categories/shopstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modelproduct.dart';

class productcubit extends Cubit<ShopStates> {
productcubit() : super(ShopInitialState()){}
ProductModel categoriesModel = ProductModel();

static productcubit get(context) => BlocProvider.of(context);

int currentIndex = 0;



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
  //   // categoriesModel = CategoriesModel.fromJson(value.data);
  //
  //   emit(ShopSuccessCategoriesState());
  // }).catchError((error) {
  //   print(error.toString());
  //   emit(ShopErrorCategoriesState());
  // });
}
}