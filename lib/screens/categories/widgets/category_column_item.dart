import 'package:flutter/material.dart';

import '../../../models/entities/index.dart';
import '../../../widgets/common/flux_image.dart';

class CategoryColumnItem extends StatelessWidget {
  final Category category;

  const CategoryColumnItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LayoutBuilder(builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            child: Center(
              child: FluxImage(
                imageUrl: category.image!,
                fit: BoxFit.cover,
                width: constraints.maxWidth,
              ),
            ),
          );
        }),
        Text(
          category.name!,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
