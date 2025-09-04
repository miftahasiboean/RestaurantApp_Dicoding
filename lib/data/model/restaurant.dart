class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final List<Category> categories;
  final Menus menus;
  final List<CustomerReview> customerReview;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.categories,
    required this.menus,
    required this.customerReview,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": String id,
        "name": String name,
        "description": String description,
        "pictureId": String pictureId,
        "city": String city,
        "rating": double rating,
        "categories": List<Category> categories,
        "menus": Menus menus,
        "customerReview": List<CustomerReview> customerReview,
      } =>
        Restaurant(
          id: id,
          name: name,
          description: description,
          pictureId: pictureId,
          city: city,
          rating: rating,
          categories: categories,
          menus: menus,
          customerReview: customerReview,
        ),
      _ => throw const FormatException('Failed to load Restaurant data.'),
    };
  }
}

class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(name: json["name"]);
  }
}

class Menus {
  final List<Category> foods;
  final List<Category> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: List<Category>.from(
        json["foods"].map((x) => Category.fromJson(x)),
      ),
      drinks: List<Category>.from(
        json["drinks"].map((x) => Category.fromJson(x)),
      ),
    );
  }
}

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return CustomerReview(
      name: json["name"],
      date: json["date"],
      review: json["review"],
    );
  }
}
