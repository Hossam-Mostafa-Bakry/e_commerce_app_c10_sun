import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c10_sun/core/failure/failures.dart';
import 'package:e_commerce_app_c10_sun/domain/entities/category_data.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryData>>> getCategoryData();
}
