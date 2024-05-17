import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favoriteItems = <Map<String, dynamic>>[].obs;

  void addFavorite(Map<String, dynamic> item) {
    if (!favoriteItems.contains(item)) {
      favoriteItems.add(item);
    }
  }

  void removeFavorite(Map<String, dynamic> item) {
    favoriteItems.remove(item);
  }

  bool isFavorite(Map<String, dynamic> item) {
    return favoriteItems.contains(item);
  }
}
