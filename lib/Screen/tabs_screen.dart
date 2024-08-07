import 'package:flutter/material.dart';
import 'package:meals/Screen/catagories_screen.dart';
import 'package:meals/Screen/developer.dart';
import 'package:meals/Screen/filters.dart';
import 'package:meals/Screen/meals_screen.dart';
import 'package:meals/provider/favourite_provider.dart';
import 'package:meals/widget/main_drawer.dart';
import 'package:meals/provider/meal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/FilterNotifier.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _selcetedPageIndex = 0;

  /* void _toggleMealFavouriteStatus(Meal meal) {
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
  } */

  void _selectPage(int Index) {
    setState(() {
      _selcetedPageIndex = Index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
    if (identifier == 'Developer') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const Developer()));
    }
  }

  @override
  Widget build(context) {
    final avaliableMeals = ref.watch(flitetedMealProvider);

    Widget activePage = CatagoriesScreen(
      avaliableMeals: avaliableMeals,
    );
    var activePageTitel = 'Catagories';
    if (_selcetedPageIndex == 1) {
      final favouriteMeal = ref.watch(favouriteMealProvider);
      activePage = MealsScreen(
        meals: favouriteMeal,
      );
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
