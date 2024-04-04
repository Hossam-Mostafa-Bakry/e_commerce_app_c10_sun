
import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';

class ItemView extends StatelessWidget {
  final String imageItem;
  final String titleItem;
  const ItemView({super.key,required this.imageItem,required this.titleItem});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Expanded(
            child:
            Container(
              decoration:  BoxDecoration(
                image: DecorationImage(image: AssetImage(imageItem))
              ),
            ),
          ),
          Text(titleItem,style: Constants.theme.textTheme.bodySmall,)
        ],
      );
  }
}
