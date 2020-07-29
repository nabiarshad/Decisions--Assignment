import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils
{
  static void showExitDialogBox (BuildContext oContext)
  {
    showDialog
      (
        context: oContext,
        barrierDismissible: false,
        builder: (_) => AlertDialog
          (
          title: Text("Exit?"),
          actions: <Widget>
          [
            FlatButton(
              child: Text("no"),
              onPressed: ()
              {
                Navigator.of (oContext).pop ();
              },
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: ()=> exit(0),
            )
          ],
        )
    );
  }

  static void showToastAlert (String strData)
  {
    Fluttertoast.showToast
      (
        msg: strData,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        fontSize: 15,
        timeInSecForIos: 5,
        textColor: Colors.white
    );
  }

  static LoadingScreen()
  {
    return Column
    (
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>
      [
        new Center
        (
          child: new SizedBox
            (
            height: 50.0,
            width: 50.0,
            child: new CircularProgressIndicator(value: null, strokeWidth: 7.0),
          ),
        ),
      ],
    );
  }
}