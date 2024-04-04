
import 'package:flutter/material.dart';

import '../../../domain/entities/item_model.dart';
import 'item_view.dart';


class CategoryGridView extends StatelessWidget {
  final List<Items> items;

  const CategoryGridView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 0.3,
              mainAxisSpacing: 0.2,
              childAspectRatio: 0.9,
              children: items
                  .map(
                    (item) => GridTile(
                  child: ItemView(
                    titleItem: item.title,
                    imageItem: item.image,
                  ),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
