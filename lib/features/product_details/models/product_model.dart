class ProductModel{
  String? name;
  dynamic description;
  String? unit;
  dynamic image;
  double? price;
  int? id;
  double quantity;
  dynamic inSale;


  ProductModel({this.name, this.description, this.unit, this.image,this.price,this.id,this.quantity=0,this.inSale});

  addQuantity(){
      quantity++;
  }
  //from json method
  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
         name:json["name"],
         description:json["description"],
         unit:json["unit"],
       //  image:json["image"],
         price:json["price"].toDouble(),
         id:json["id"],
         quantity:json["quantity"].toDouble(),
         inSale:json["inSale"],
    );
  }
  //to json method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'unit': unit,
    //  'image':image,
      'price':price,
      "id":id,
      'quantity':quantity,
      'inSale':inSale
    };
  }
  @override
  String toString() {
    return 'ProductModel{name: $name, details: $description, unit: $unit, price: $price, id: $id, quantity: $quantity}';
  }
}