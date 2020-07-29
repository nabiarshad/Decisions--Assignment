class productModel
{
  var name;
  var definitionUrl;

  productModel
      (
        {
          this.name,
          this.definitionUrl,
        }
      );

  productModel.fromJson(Map<String, dynamic> json):
        name = json['name'],
        definitionUrl = json['definitionUrl'];

  Map<String, dynamic> toJson() =>
      {
        'name' : name,
        'definitionUrl' : definitionUrl,
      };
}