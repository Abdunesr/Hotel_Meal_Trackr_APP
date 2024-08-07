import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
 const  MealsScreen({super.key,  this.title, required this.meals});

  final String?title;
 final  List<Meal> meals;
 

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Uh Oh ....nothing here!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            " Try Selecting a diffrent catagory!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) =>MealItem(meal: meals[index]) ,
      );
    }

    if(title==null){
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
