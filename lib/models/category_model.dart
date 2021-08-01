class Category {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;
  Category(
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  );
  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
      map['idCategory'] as String,
      map['strCategory'] as String,
      map['strCategoryThumb'] as String,
      map['strCategoryDescription'] as String,
    );
  }
}
