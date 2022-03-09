class ProductsModel {
  ProductsModel({
    this.categories,
    this.types,
    this.all,
  });

  List<Category>? categories;
  List<Type>? types;
  List<All>? all;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        categories: List<Category>.from(
            json["Categories"].map((x) => Category.fromJson(x))),
        types: List<Type>.from(json["Types"].map((x) => Type.fromJson(x))),
        all: List<All>.from(json["All"].map((x) => All.fromJson(x))),
      );
}

class All {
  All({
    this.name,
    this.category,
    this.timeDelivery,
    this.color,
    this.price,
    this.image,
    this.description,
  });

  String? name;
  String? category;
  String? timeDelivery;
  String? color;
  double? price;
  String? image;
  String? description;

  factory All.fromJson(Map<String, dynamic> json) => All(
        name: json["name"],
        category: json["category"],
        timeDelivery: json["timeDelivery"],
        color: json["color"],
        price: json["price"].toDouble(),
        image: json["image"],
        description: json["description"],
      );
}

class Category {
  Category({
    this.name,
    this.image,
    this.builder,
  });

  String? name;
  String? image;
  List<All>? builder;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        image: json["image"],
        builder: List<All>.from(json["builder"].map((x) => All.fromJson(x))),
      );
}

class Type {
  Type({
    this.type,
    this.builder,
  });

  String? type;
  List<All>? builder;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["type"],
        builder: List<All>.from(json["builder"].map((x) => All.fromJson(x))),
      );
}
