import 'package:flutter/material.dart';
import 'contact_form.dart';

class TheAppMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: ListTile(
            title: Text('Account'),
            leading: Icon(Icons.account_box),
          ),
          decoration: BoxDecoration(
            color: Colors.orange,
          ),
        ),
        ListTile(
          title: Text('Favorites'),
          leading: Icon(Icons.favorite),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Contact us'),
          leading: Icon(Icons.call),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return ContactFormPage();
                },
              ),
            );
          },
        ),
        ListTile(
          title: Text('About'),
          leading: Icon(Icons.restaurant_menu),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
