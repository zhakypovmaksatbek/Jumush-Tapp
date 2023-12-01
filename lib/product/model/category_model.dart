class Categories {
  String? name;
  String? categoryID;

  Categories({this.name, this.categoryID});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryID = json['categoryID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['categoryID'] = categoryID;
    return data;
  }
}
