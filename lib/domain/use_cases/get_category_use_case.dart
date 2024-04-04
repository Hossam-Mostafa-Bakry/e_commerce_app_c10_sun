import 'package:dartz/dartz.dart';
import '../../domain/repository/category_repository.dart';

import '../../core/failure/failure.dart';
import '../entities/category_data.dart';

class GetCategoryUseCase {
  final CategoryRepository repository;

  GetCategoryUseCase(this.repository);

  Future<Either<Failure, List<CategoryData>>> execute() async {
    return await repository.getCategoryData();
  }
}
