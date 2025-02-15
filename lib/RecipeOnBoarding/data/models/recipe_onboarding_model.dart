class OnboardingPageModel {
  final int id;
  final String title, subtitle, image;

  final int order;

  OnboardingPageModel({
    required this.id,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.order,
  });

  factory OnboardingPageModel.fromJson(Map<String, dynamic> json) {
    return OnboardingPageModel(
        id: json['id'],
        title: json['title'],
        image: json['picture'],
        subtitle: json['subtitle'],
        order: json['order']);
  }
}
