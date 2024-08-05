import 'package:flutter/material.dart';
/* import 'package:meals/Screen/tabs_screen.dart';
import 'package:meals/widget/main_drawer.dart';
 */
enum Filter{
  gluttenFree,
  LactoseFree,
  vegeterian,
  vegan,

}
class FiltersScreen extends StatefulWidget {
 const  FiltersScreen({super.key,required this.curentFilter});

  final Map<Filter,bool> curentFilter;

  @override
  State<FiltersScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
   _gluttenFreeFilterSet=widget.curentFilter[Filter.gluttenFree]!;
   _lactoseFreeFilterSet=widget.curentFilter[Filter.LactoseFree]!;
   _vegterianFilterSet=widget.curentFilter[Filter.vegeterian]!;
   _veganFilterSet=widget.curentFilter[Filter.vegan]!;

    super.initState();
  }




  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
     /*  drawer: MainDrawer(onSelectedScreen: (String identifier) {
        Navigator.of(context).pop();
        if (identifier == 'meals') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => TabsScreen(),
            ),
          );
        }
      }), */
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluttenFree:_gluttenFreeFilterSet,
            Filter.LactoseFree:_lactoseFreeFilterSet,
            Filter.vegeterian:_vegterianFilterSet,
            Filter.vegan:_veganFilterSet,

          });
          return false;
          
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _gluttenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'only include Lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
             SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Glutten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'only include glutten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
        
              SwitchListTile(
              value: _vegterianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegterianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'only include Vegterian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
        
              SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'only include Vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            
        
            
        
            
        
        
        
          ],
        ),
      ),
    );
  }
}
