import 'package:flutter/material.dart';
import 'package:random_cat/domain/entities/cat.dart';

class CatDisplay extends StatelessWidget {
  final Cat cat;
  const CatDisplay({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(cat.urlImage),
    );
  }
}
