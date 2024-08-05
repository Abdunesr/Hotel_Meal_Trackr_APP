import 'package:flutter/material.dart';

import 'package:meals/model/catagory.dart';

class CatagoryGridItem extends StatelessWidget {
  CatagoryGridItem(
      {super.key, required this.catagory, required this.onSelectedCatagory});

  final Catagory catagory;
  void Function() onSelectedCatagory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectedCatagory,
      splashColor: Theme.of(context).primaryColorLight,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            catagory.color.withOpacity(0.55),
            catagory.color.withOpacity(0.9),
          ]),
        ),
        child: Text(
          catagory.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
