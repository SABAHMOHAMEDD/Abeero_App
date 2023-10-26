class CategoryModel {
  String? name;
  String? categoryImage;
  String? categoryId;
  CategoryModel({
    this.name,
    this.categoryImage,
    this.categoryId,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          categoryImage: json['categoryImage'],
          categoryId: json['categoryId'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'categoryImage': categoryImage,
      'categoryId': categoryId,
    };
  }
}
