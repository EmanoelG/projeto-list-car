import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('Carros '),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Ok'))
              ],
            ));
      });
}
