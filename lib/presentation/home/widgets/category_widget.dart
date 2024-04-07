import 'package:flutter/material.dart';

import '../../../domain/entities/category_data.dart';


class CategoryWidget extends StatefulWidget {
  CategoryData categoryData;

  CategoryWidget({super.key, required this.categoryData});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.categoryData.imageURL),
          radius: 40,
        ),
        Expanded(
          child: Container(
              // width: 80,
              child: Text(
                widget.categoryData.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.primaryColor,
                  fontSize: 14
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
        )
      ],
    );

  }
}

