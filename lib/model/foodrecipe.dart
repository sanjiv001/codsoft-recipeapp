class FoodRecipeModel {
  int? id;
  String? title;
  String? image;
  String? imageType;
  int? calories;
  String? protein;
  String? fat;
  String? carbs;

  FoodRecipeModel(
      {this.id,
      this.title,
      this.image,
      this.imageType,
      this.calories,
      this.protein,
      this.fat,
      this.carbs});

  FoodRecipeModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
    calories = json['calories'];
    protein = json['protein'];
    fat = json['fat'];
    carbs = json['carbs'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    data['calories'] = this.calories;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['carbs'] = this.carbs;
    return data;
  }
}
