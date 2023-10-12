class CategoryModel {
  String? name;
  String? categoryImage;

  CategoryModel({
    this.name,
    this.categoryImage,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          categoryImage: json['categoryImage'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'categoryImage': categoryImage,
    };
  }
}
