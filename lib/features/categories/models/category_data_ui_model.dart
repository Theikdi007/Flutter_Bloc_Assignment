import 'dart:convert';

CategoryDataUiModel categoryDataUiModelFromJson(String str) =>
    CategoryDataUiModel.fromJson(json.decode(str));

String categoryDataUiModelToJson(CategoryDataUiModel data) =>
    json.encode(data.toJson());

class CategoryDataUiModel {
  String slug;
  String name;
  String url;

  CategoryDataUiModel({
    required this.slug,
    required this.name,
    required this.url,
  });

  factory CategoryDataUiModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataUiModel(
        slug: json["slug"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "url": url,
      };
}
