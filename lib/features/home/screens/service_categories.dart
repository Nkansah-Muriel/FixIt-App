import 'package:fitit_app/shared/models/service_category_model.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.categoryName), // shows "Cleaning", "Plumbing" etc
      ),
      body: const Center(child: Text('Providers for this category go here')),
    );
  }
}
