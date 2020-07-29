import 'package:decisions_assignment/CustomWidgets/customCheckBoxWidget.dart';
import 'package:decisions_assignment/CustomWidgets/customTextBoxWidget.dart';
import 'package:decisions_assignment/constants/stringConstants.dart';
import 'package:decisions_assignment/model/productInsertModel.dart';
import 'package:flutter/material.dart';

class productInsertList extends Container
{
  productInsertList(arrResultList) : super(
    child: ListView.builder
    (
        primary: false,
        scrollDirection: Axis.vertical,
        itemCount: arrResultList != null ? arrResultList.length : 0,
        itemBuilder: (oContext, int nListIndex)
        {
          if(arrResultList != null)
          {
            productInsertModel oProductInsertModel = productInsertModel.fromJson(arrResultList[nListIndex]);
            return dynamicWidget(oProductInsertModel);
          }
        }
    ),
  );

  static dynamicWidget(oProductInsertModel)
  {
    var widgetType = oProductInsertModel.type;
    switch(widgetType)
    {
      case stringConstants.strText:
          {
            return customTextBoxWidget.buildTextbox(oProductInsertModel,false);
          }
      break;

      case stringConstants.strInt:
        {
          return customTextBoxWidget.buildTextbox(oProductInsertModel,true);
        }
      break;

      case stringConstants.strBool:
        {
          return customCheckBoxWidget(oProductInsertModel: oProductInsertModel,);
        }
      break;

      default:
        {
          return Container();
        }
      break;
    }
  }
}
