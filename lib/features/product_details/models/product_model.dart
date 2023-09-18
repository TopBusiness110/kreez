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


  @override
  String toString() {
    return 'ProductModel{name: $name, details: $description, unit: $unit, price: $price, id: $id, quantity: $quantity}';
  }
}