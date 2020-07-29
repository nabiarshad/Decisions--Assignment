import 'package:decisions_assignment/constants/stringConstants.dart';
import 'package:decisions_assignment/productInsertScreen.dart';
import 'package:flutter/material.dart';
import 'package:decisions_assignment/model/productModel.dart';

class productList extends Container
{
  productList(arrResultList) : super(
    child: ListView.builder
      (
        primary: false,
        scrollDirection: Axis.vertical,
        itemCount: arrResultList != null ? arrResultList.length : 0,
        itemBuilder: (oContext, int nListIndex)
        {
          if(arrResultList != null)
          {
            productModel oProductModel = productModel.fromJson(arrResultList[nListIndex]);
            return CardWidget(oContext, oProductModel);
          }
        }
    ),
  );
}

class CardWidget extends Card
{
  CardWidget(oContext, oProductModel) : super(
    margin: EdgeInsets.all(10),
    elevation: 3,
    child: Container
      (
        decoration: BoxDecoration
        (
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column
        (
          children: <Widget>
          [
            infoLayout(oContext, oProductModel),
          ],
        ),
      ),
  );


  static navigateToProductInsertScreen(oContext,oProductModel)
  {
    var oDestination = new MaterialPageRoute(builder: (BuildContext oContext) => productInsertScreen(oProductModel : oProductModel));
    Navigator.of(oContext).push(oDestination);
  }

  static infoLayout(oContext, oProductModel)
  {
    return Container
      (
        padding: EdgeInsets.only(left:10, right:5, top:2, bottom:2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [
            Row
              (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>
              [
                Flexible(
                  child:Column
                    (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Text(oProductModel.name.toString(),overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 22,),textAlign: TextAlign.center,),
                      Divider(height: 1),
                      RaisedButton
                        (
                          shape: RoundedRectangleBorder
                          (
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(stringConstants.strAddButton +oProductModel.name.toString(), style: TextStyle(fontSize: 15)),
                          color: Colors.teal,
                          textColor: Colors.white,
                          onPressed: ()
                          {
                            navigateToProductInsertScreen(oContext,oProductModel);
                          },
                        ),
                    ],
                  ),flex: 5),
              ],
            ),
          ],
        )
    );
  }
}