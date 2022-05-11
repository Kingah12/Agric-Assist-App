import 'package:flutter/foundation.dart';

import 'category_model.dart';

List<CategoryModel> getCategoryNews() {
  List<CategoryModel> category = <CategoryModel>[];

  CategoryModel categoryModel = CategoryModel();
  categoryModel.title = 'Business';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = 'Entertainment';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1576633587201-20861f6ac680?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = 'General';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = 'Health';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1505576399279-565b52d4ac71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = 'Science';
  categoryModel.imageUrl =
      'https://media.istockphoto.com/photos/hands-typing-the-keyboard-to-research-stock-market-to-proceed-right-picture-id1322630176?s=612x612';
  category.add(categoryModel);

  return category;
}
