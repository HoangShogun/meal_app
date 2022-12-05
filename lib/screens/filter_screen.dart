import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget _mySwitchListTile(String title, String description, bool crrValue,
      Function(bool)? updatevalue, bool selectedValue) {
    return SwitchListTile(
      title: Text(title),
      value: crrValue,
      subtitle: Text(description),
      onChanged: updatevalue,
      selected: selectedValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Chọn mục bạn muốn.',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _mySwitchListTile(
                'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                (newvalue) {
              setState(() {
                _glutenFree = newvalue;
              });
            }, _glutenFree),
            _mySwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                (newvalue) {
              setState(() {
                _vegan = newvalue;
              });
            }, _vegan),
            _mySwitchListTile(
                'Lactose-free', 'Only include Lactose-free meals', _lactoseFree,
                (newvalue) {
              setState(() {
                _lactoseFree = newvalue;
              });
            }, _lactoseFree),
            _mySwitchListTile(
                'Vegetarian', 'Only include Vegetarian meals', _vegetarian,
                (newvalue) {
              setState(() {
                _vegetarian = newvalue;
              });
            }, _vegetarian),
          ],
        ))
      ]),
    );
  }
}
