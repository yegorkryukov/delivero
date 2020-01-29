import 'package:flutter/material.dart';
import 'meal_card.dart';
import 'meal_model.dart';

class MealList extends StatelessWidget {
  final List<Meal> meals;
  MealList(this.meals);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, int) {
        return MealCard(meals[int]);
      },
    );
  }
}