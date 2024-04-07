import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_c10_sun/core/failure/failures.dart';
import '../../data/data_source/category_data_source/category_data_source.dart';
import '../../data/model/category_data_model.dart';
import '../../domain/entities/category_data.dart';
import '../../domain/repository/category_repository.dart';

class CategoryRepositoryImp implements CategoryRepository {
  final CategoryDataSource dataSource;

  CategoryRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<CategoryData>>> getCategoryData() async {
    try {
      final response = await dataSource.getCategoryDataList();
      if (response.statusCode == 200) {

        List<CategoryDataModel> categoryDataList = [];

        var responseDataList = response.data["data"] as List;

        for (var element in responseDataList) {
          categoryDataList.add(CategoryDataModel.fromJSON(element));
        }

        return Right(categoryDataList);
        // List of json objects => List of category data
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
        ),
      );
    }
  }
}
