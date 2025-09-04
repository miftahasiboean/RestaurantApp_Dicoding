import 'package:restaurant_app/data/model/restaurant.dart';

class Images {
  final Restaurant smallImage;
  final Restaurant mediumImage;
  final Restaurant largeImage;

  Images({
    required this.smallImage,
    required this.mediumImage,
    required this.largeImage,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      smallImage: Restaurant.fromJson(json["pictureId"]),
      mediumImage: Restaurant.fromJson(json["pictureId"]),
      largeImage: Restaurant.fromJson(json["pictureId"]),
    );
  }
}
