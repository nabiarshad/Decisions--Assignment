import 'dart:convert';
import 'package:decisions_assignment/Utils.dart';
import 'package:decisions_assignment/constants/stringConstants.dart';
import 'package:decisions_assignment/productList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:decisions_assignment/controllers/dart/dataController.dart';

class dashboard extends StatefulWidget
{
  dashboard();
  dashboardState  createState()=> dashboardState();
}

class dashboardState extends State<dashboard>
{
  var arrResults;
  @override
  void initState()
  {
    super.initState();
    this.getDashboard();
  }

  getDashboard() async
  {
    await dataController.getDashboardData().then((dynamic oResponse)
    {
      if (oResponse.statusCode==200)
      {
        setState(()
        {
          arrResults = json.decode(oResponse.body);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return DashboardScaffold(context);
  }

  WillPopScope DashboardScaffold(oContext)
  {
    onBackButtonPress()
    {
      Utils.showExitDialogBox(oContext);
    }
    return WillPopScope
    (
      onWillPop: onBackButtonPress,
      child:  Scaffold
      (
        appBar: AppBar(title: Text(stringConstants.strWelcome,style: TextStyle(backgroundColor: Colors.blueGrey,fontStyle: FontStyle.italic)),backgroundColor: Colors.blueGrey),
        body:  Container(child:DashboardBody(), padding: EdgeInsets.all(10)),
      ),
    );
  }

  DashboardBody()
  {
    return Container
      (
          padding: EdgeInsets.all(2),
          child:Column
            (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>
            [
              Flexible
              (
                  child: arrResults != null ? productList(arrResults) : Utils.LoadingScreen(),
                  flex: 1
              )
            ],
          )
      );
  }
}
