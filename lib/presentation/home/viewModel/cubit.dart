import 'package:e_commerce_app_c10_sun/core/failure/failures.dart';
import 'package:e_commerce_app_c10_sun/core/services/web_serivces.dart';
import 'package:e_commerce_app_c10_sun/data/data_source/category_data_source/category_data_source.dart';
import 'package:e_commerce_app_c10_sun/data/data_source/category_data_source/category_data_source_imp.dart';
import 'package:e_commerce_app_c10_sun/data/repository_imp/category_repository_imp.dart';
import 'package:e_commerce_app_c10_sun/domain/repository/category_repository.dart';
import 'package:e_commerce_app_c10_sun/domain/use_cases/get_category_use_case.dart';
import 'package:e_commerce_app_c10_sun/presentation/home/viewModel/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewModel extends Cubit<CategoryStates> {
  CategoryViewModel() : super(LoadingCategoryState());

  late GetCategoryUseCase getCategoryUseCase;
  late CategoryRepository categoryRepository;
  late CategoryDataSource categoryDataSource;
  final WebServices _services = WebServices();

  Future<bool> getCategoryList() async {

    emit(LoadingCategoryState());

    categoryDataSource = CategoryDataSourceImp(_services.freeDio);
    categoryRepository = CategoryRepositoryImp(categoryDataSource);
    getCategoryUseCase = GetCategoryUseCase(categoryRepository);
    final result = await getCategoryUseCase.execute();

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;

        emit(ErrorCategoryState());
        return Future.value(false);
      },
      (data) {

        emit(SuccessCategoryState(data));
        return Future.value(true);
      },
    );
  }
}
