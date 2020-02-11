import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:delivero/actions/counter_actions.dart';
import 'package:delivero/models/app_state.dart';
import 'package:redux/redux.dart';

class DecreaseCountButton extends StatelessWidget {
  DecreaseCountButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, VoidCallback>(
      converter: (Store<AppState> store) {
        return () {
          store.dispatch(new DecrememtCountAction());
        };
      },
      builder: (BuildContext context, VoidCallback decrease) {
        return new RaisedButton(
          onPressed: decrease,
          child: new Icon(Icons.remove),
        );
      },
    );
  }
}