import 'package:flutter/material.dart';
import 'meal_model.dart';
import 'meal_list.dart';

void main() => runApp(TheApp());

class TheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivero',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: TheHomePage(title: 'Delivero'),
    );
  }
}

class TheHomePage extends StatefulWidget {
  TheHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TheHomePageState createState() => _TheHomePageState();
}

class _TheHomePageState extends State<TheHomePage> {
  List<Meal> initialMeals = []
    ..add(Meal('Плов', 'Чайхона №1', 'Лучший плов в городе', '10.0'))
    ..add(Meal('Самса', 'Чайхона №2', 'Лучшая самса в городе', '25.0'))
    ..add(Meal('Burger', 'SteakHouse', 'The burgers of the house', '45.0'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: Center(
        child: MealList(initialMeals),
      )),
    );
  }
}
