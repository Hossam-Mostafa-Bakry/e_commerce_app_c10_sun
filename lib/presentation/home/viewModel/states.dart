import '../../../domain/entities/category_data.dart';

sealed class CategoryStates {}

class LoadingCategoryState extends CategoryStates {}
class SuccessCategoryState extends CategoryStates {
  final List<CategoryData> categoryDataList;
  SuccessCategoryState(this.categoryDataList);
}
class ErrorCategoryState extends CategoryStates {}
