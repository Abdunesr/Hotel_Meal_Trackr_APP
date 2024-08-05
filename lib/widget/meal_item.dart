import 'package:flutter/material.dart';
import 'package:meals/Screen/meal_details.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,required this.onSelectFavourite});

  final Meal meal;
  final void Function(Meal meal) onSelectFavourite;

  void screenswitching(BuildContext context){
  Navigator.of(context).push(
      
      MaterialPageRoute(
        
        builder: (ctx) =>  MealDetailsScreen(meal: meal,onSelectFavourite: onSelectFavourite,),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          screenswitching(context);
        },
        child: Stack(
          children: [
            FadeInImage(
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: meal.duration.toString() + ' min'),
                      const   SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(icon: Icons.work, label:meal.complexity.name ),
                     const    SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.attach_money, label: meal.affordability.name)
                        

                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
