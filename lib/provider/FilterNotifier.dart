import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meal_provider.dart';

enum Filter {
  gluttenFree,
  LactoseFree,
  vegeterian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.LactoseFree: false,
          Filter.gluttenFree: false,
          Filter.vegeterian: false,
          Filter.vegan: false,
        });
  void setFilters(Map<Filter ,bool> chooseFilter){
    state=chooseFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier,Map<Filter,bool>>(
  (ref) => FilterNotifier(),
);


final flitetedMealProvider=Provider((ref){
 final mealAvaliable=ref.watch(mealsProvider);
 final activeFilters=ref.watch(filterProvider);


  return   mealAvaliable.where((meal){
     if(activeFilters[Filter.gluttenFree]! && !meal.isGlutenFree) {
      return false;
     }
      if(activeFilters[Filter.LactoseFree]! && !meal.isLactoseFree) {
      return false;
     }

      if(activeFilters[Filter.vegeterian]! && !meal.isVegetarian) {
      return false;
     }

      if(activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
     }
     return true;


    }).toList();



});