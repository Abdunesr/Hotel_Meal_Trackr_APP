import 'package:flutter/material.dart';
import 'package:meals/Screen/meals_screen.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/catagory.dart';
import 'package:meals/widget/catagory_grid_item.dart';
import 'package:meals/model/meal.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen(
      {super.key,
      required this.onSelectFavourite,
      required this.avaliableMeals});
  final void Function(Meal meal) onSelectFavourite;
  final List<Meal> avaliableMeals;
  _selectCatagory(BuildContext context, Catagory catagory) {
    final filteredMeals = avaliableMeals
        .where((meal) => meal.categories.contains(catagory.id))
        .toList();

    // Navigator.push(context, route):
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: catagory.title,
          meals: filteredMeals,
          onSelectFavourite: onSelectFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        //availableCategories.map((catagory)=>CatagoryGridItem(catagory: catagory))
        for (final catagory in availableCategories)
          CatagoryGridItem(
            catagory: catagory,
            onSelectedCatagory: () {
              _selectCatagory(context, catagory);
            },
          )
      ],
    );
  }
}
