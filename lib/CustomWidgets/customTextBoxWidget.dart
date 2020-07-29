import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class customTextBoxWidget
{
  static buildTextbox (oProductInsertModel, isNumberFiled)
  {
    var m_oTextbox = new TextEditingController(text: oProductInsertModel.defaultValue);
    return Container
    (
      child : TextFormField
      (
        keyboardType: isNumberFiled ? TextInputType.number : TextInputType.text,
        controller: m_oTextbox,
        autofocus: false,
        decoration: InputDecoration
        (
          errorStyle: TextStyle
          (
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          labelText: oProductInsertModel.caption,
          hintStyle: TextStyle
          (
            color: Colors.red,
          ),
        ),
        validator: oProductInsertModel.mandatory ? (oValue)
        {
          String strValidationMessage;
          if (oValue.isEmpty)
            strValidationMessage = oProductInsertModel.validationMessage;
          return strValidationMessage;
        }: null,
      ),
    );
  }
}
