class Products {
  String? id;
  String? name;
  String? description;
  String? brand;
  String? category;
  String? price;
  String? image;
  bool? state;

  Products(
    this.id,
    this.name,
    this.description,
    this.brand,
    this.category,
    this.price,
    this.image,
    this.state,
  );

  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    brand = json['brand'];
    category = json['category'];
    price = json['price'];
    image = json['img'];
    state = json['state'];
  }

  Products.empty(){
    id = '';
    name = '';
    description = '';
    brand = '';
    category = '';
    price = '';
    image = '';
    state = false;
  }

  Map<String, dynamic> toFilterMap(){
    return {
      'name': name!,
      'category': category!,
      'price': price!
    };
  }
}


// class Products {
//   final String name;
//   final String description;
//   final double price;
//   final String image;
//   Products({
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.image,
//   });
// }
