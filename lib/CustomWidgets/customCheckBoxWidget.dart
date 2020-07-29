import 'package:decisions_assignment/Utils.dart';
import 'package:flutter/material.dart';

class customCheckBoxWidget extends StatefulWidget
{
  var oProductInsertModel;
  customCheckBoxWidget({this.oProductInsertModel}) : super();
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State<customCheckBoxWidget>
{
  bool isChecked = false;
  void toggleCheckbox(bool value)
  {
    if(value)
    {
      setState(()
      {
        isChecked = true;
      });
    }
    else
    {
      setState(()
      {
        isChecked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context)
  {
    final GlobalKey<FormState> oCheckBoxFormKey = GlobalKey<FormState>();
    return FormField<bool>
    (
      key: oCheckBoxFormKey,
      builder: (state)
      {
        return Column
        (
          children: <Widget>
          [
            CheckboxListTile
            (
              value: isChecked,
              onChanged: (value)
              {
                toggleCheckbox(value);
              },
              activeColor: Colors.pink,
              checkColor: Colors.white,
              title: Text(widget.oProductInsertModel.caption.toString()),
            ),
          ],
        );
      },
      validator: widget.oProductInsertModel.mandatory ? (oValue)
      {
        if(!isChecked)
          {
            Utils.showToastAlert(widget.oProductInsertModel.validationMessage);
            return widget.oProductInsertModel.validationMessage;
          }
      }: null,
    );
  }
}