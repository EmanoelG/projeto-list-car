import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace == true) {
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

void pop(BuildContext context) {
  Navigator.pop(context);
}
