import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:delivero/pages/home_page.dart';
import 'package:delivero/models/app_state.dart';
import 'package:delivero/reducers/app_reducer.dart';

void main() => runApp(new TheApp());

class TheApp extends StatelessWidget {
  final String title = 'Delivero'; // new

  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(),
    middleware: [],
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store, 
      child: new MaterialApp(
        title: title,
        home: new HomePage(title),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'meal_model.dart';
// import 'meal_list.dart';
// import 'menu.dart';

// // finish setting up firebase analytics from this link:
// // https://firebase.google.com/docs/flutter/setup

// void main() => runApp(TheApp());

// class TheApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Delivero',
//       theme: ThemeData(
//         primaryColor: Colors.orange,
//       ),
//       home: TheHomePage(title: 'Delivero'),
//     );
//   }
// }

// class TheHomePage extends StatefulWidget {
//   TheHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _TheHomePageState createState() => _TheHomePageState();
// }

// class _TheHomePageState extends State<TheHomePage> {
//   List<Meal> initialMeals = []
//     ..add(Meal('Плов', 'Чайхона №1', 'Лучший плов в городе', '10.0'))
//     ..add(Meal('Самса', 'Чайхона №2', 'Лучшая самса в городе', '25.0'))
//     ..add(Meal('Burger', 'SteakHouse', 'The burgers of the house', '45.0'));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//           child: Center(
//         child: MealList(initialMeals),
//       )),
//       drawer: new Drawer(
//         child: TheAppMenuPage(),
//       ),
//     );
//   }
// }
