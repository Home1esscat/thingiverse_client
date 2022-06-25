import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.view_in_ar_rounded),
              title: const Text('3D Printing'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.palette_rounded),
              title: const Text('Art'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.diamond_rounded),
              title: const Text('Fashion'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.precision_manufacturing_rounded),
              title: const Text('Gadgets'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.sentiment_very_satisfied_rounded),
              title: const Text('Hobby'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.home_rounded),
              title: const Text('Household'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.import_contacts_rounded),
              title: const Text('Learning'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.design_services_rounded),
              title: const Text('Models'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.construction_rounded),
              title: const Text('Tools'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.toys_rounded),
              title: const Text('Toys'),
            ),
            ListTile(
              onTap: () => _selectCategory(context, 1, "Other"),
              leading: const Icon(Icons.workspaces_rounded),
              title: const Text('Other'),
            ),
          ],
        ).toList(),
      ),
    );
  }

  void _selectCategory(
      BuildContext context, int category, String categoryName) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => Container(
          child: Center(
            child: Text(categoryName),
          ),
        ),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }
}
