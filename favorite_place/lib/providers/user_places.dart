import 'package:favorite_place/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacessNotifier extends StateNotifier<List<Place>> {
  UserPlacessNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacessNotifier, List<Place>>(
  (ref) => UserPlacessNotifier(),
);
