import 'package:flutter/material.dart';
import 'package:random_cat/domain/entities/cat.dart';

class CatDisplay extends StatelessWidget {
  final Cat cat;
  const CatDisplay({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'id item : (${cat.id})',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            child: Image.network(cat.urlImage, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
