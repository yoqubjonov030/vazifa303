class ProfileRecipeModel {
  final int id, categoryId;
  final String title, description, image, videoRecipe;
  final int timeRequired;
  final double rating;

  ProfileRecipeModel(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.description,
      required this.image,
      required this.videoRecipe,
      required this.timeRequired,
      required this.rating});

  factory ProfileRecipeModel.fromJson(Map<String, dynamic> json) {
    return ProfileRecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      image: json['photo'],
      videoRecipe: json['videoRecipe'] ?? "placeholder",
      timeRequired: json['timeRequired'],
      rating: json['rating'],
    );
  }
}
