import 'dart:convert';
import 'package:decisions_assignment/Utils.dart';
import 'package:decisions_assignment/constants/stringConstants.dart';
import 'package:decisions_assignment/productInsertList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:decisions_assignment/controllers/dart/dataController.dart';

class productInsertScreen extends StatefulWidget
{
  var oProductModel;
  productInsertScreen({this.oProductModel}) : super();
  productInsertScreenState  createState()=> productInsertScreenState();
}

class productInsertScreenState extends State<productInsertScreen>
{
  var arrProductResults;
  final GlobalKey<FormState> oProductInsertScreenGlobalFormKey = GlobalKey<FormState>();
  @override
  void initState()
  {
    super.initState();
    this.getProductData();
  }

  getProductData() async
  {
    await dataController.getJsonData(widget.oProductModel.definitionUrl.toString()).then((dynamic oResponse)
    {
      if (oResponse.statusCode==200)
      {
        setState(()
        {
          arrProductResults = json.decode(oResponse.body);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold
    (
      appBar: AppBar(title: Text(stringConstants.strProductTtile +widget.oProductModel.name.toString(), style: TextStyle(backgroundColor: Colors.blueGrey,fontStyle: FontStyle.italic)),backgroundColor: Colors.blueGrey),
      body:  Container(child: ProductInsertBody(), padding: EdgeInsets.all(10)),
    );
  }

  ProductInsertBody()
  {
    return Container
        (
          padding: EdgeInsets.all(2),
          child: Form
          (
            key: oProductInsertScreenGlobalFormKey,
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>
              [
                Flexible
                (
                    child:  arrProductResults != null ? productInsertList(arrProductResults) : Utils.LoadingScreen(),
                    flex: 1
                ),
                arrProductResults != null ? RaisedButton
                (
                  shape: RoundedRectangleBorder
                  (
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(stringConstants.strSubmit, style: TextStyle(fontSize: 15)),
                  color: Colors.teal,
                  textColor: Colors.white,
                  onPressed: ()
                  {
                  if(oProductInsertScreenGlobalFormKey.currentState.validate())
                    {
                      Utils.showToastAlert(stringConstants.strThankyou);
                    }
                  },
                ) : Container(),
              ],
            ),
          )
    );
  }
}
