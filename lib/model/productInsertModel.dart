class productInsertModel
{
  var caption;
  var type;
  var mandatory;
  var defaultValue;
  var validationMessage;

  productInsertModel
    (
      {
        this.caption,
        this.type,
        this.mandatory,
        this.defaultValue,
        this.validationMessage,
      }
    );

  productInsertModel.fromJson(Map<String, dynamic> json):
        caption = json['caption'],
        type = json['type'],
        mandatory = json['mandatory'],
        defaultValue = json['defaultValue'],
        validationMessage = json['validationMessage'];

  Map<String, dynamic> toJson() =>
      {
        'caption' : caption,
        'type' : type,
        'mandatory' : mandatory,
        'defaultValue' : defaultValue,
        'validationMessage' : validationMessage,
      };
}