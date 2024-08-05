import 'package:flutter/material.dart';

import 'package:meals/Screen/catagories_screen.dart';
import 'package:meals/Screen/developer.dart';
import 'package:meals/Screen/filters.dart';

import 'package:meals/Screen/meals_screen.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widget/main_drawer.dart';

const kInitialFilter= {
  Filter.gluttenFree:false,
  Filter.LactoseFree:false,
  Filter.vegeterian:false,
Filter.vegan:false,

};




class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _selcetedPageIndex = 0;
  final List<Meal> _favouriteMeal = [];
  Map<Filter,bool> _selectedFilters=kInitialFilter;

  void _showInfoMessage(String Message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(Message),
      ),
    );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeal.contains(meal);
    if (isExisting) {
      setState(() {
        _favouriteMeal.remove(meal);
      });
      _showInfoMessage('you have removed the item from your Favourite');
    } else {
      setState(() {
        _favouriteMeal.add(meal);
      });
      _showInfoMessage('Marked as a Favourite');
    }
  }

  void _selectPage(int Index) {
    setState(() {
      _selcetedPageIndex = Index;
    });
  }

  void _setScreen(String identifier) async{
    Navigator.of(context).pop();
    if (identifier == 'filters') {
    final result=await  Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(curentFilter: _selectedFilters,),
        ),
        
      );
     setState((){
       _selectedFilters=result ?? kInitialFilter;

     });  
     

    } 
    if(identifier=='Developer'){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Developer()));
    }
  }

  @override
  Widget build(context) {
    final avaliableMeals=dummyMeals.where((meal){
     if(_selectedFilters[Filter.gluttenFree]! && !meal.isGlutenFree) {
      return false;
     }
      if(_selectedFilters[Filter.LactoseFree]! && !meal.isLactoseFree) {
      return false;
     }

      if(_selectedFilters[Filter.vegeterian]! && !meal.isVegetarian) {
      return false;
     }

      if(_selectedFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
     }
     return true;


    }).toList();




    Widget activePage =
        CatagoriesScreen(onSelectFavourite: _toggleMealFavouriteStatus,avaliableMeals:avaliableMeals,);
    var activePageTitel = 'Catagories';
    if (_selcetedPageIndex == 1) {
      activePage = MealsScreen(
          meals: _favouriteMeal, onSelectFavourite: _toggleMealFavouriteStatus);
      activePageTitel = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitel),
      ),
      drawer: MainDrawer(
        onSelectedScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selcetedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "catagories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
