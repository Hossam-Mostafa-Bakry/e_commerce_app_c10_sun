import 'package:e_commerce_app_c10_sun/domain/entities/category_data.dart';

class CategoryDataModel extends CategoryData {
  CategoryDataModel({
    required super.id,
    required super.title,
    required super.slug,
    required super.imageURL,
  });

  factory CategoryDataModel.fromJSON(Map<String, dynamic> json) =>
      CategoryDataModel(
        id: json["_id"],
        title: json["title"],
        slug: json["slug"],
        imageURL: json["image"],
      );
}
