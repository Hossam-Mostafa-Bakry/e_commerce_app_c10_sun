import 'package:e_commerce_app_c10_sun/presentation/home/viewModel/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewModel extends Cubit<CategoryStates> {

  CategoryViewModel() : super(LoadingCategoryState());

  // Future<bool> getCategoryList() async {
  //
  // }
}