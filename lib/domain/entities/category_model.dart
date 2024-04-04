
import 'item_model.dart';

class CategoryModel{
  final String categoryTitle;
  final List<Items> items;
  final String itemCover;
   const CategoryModel({
  required this.categoryTitle,
      required this.items,
     required this.itemCover
  });

}
