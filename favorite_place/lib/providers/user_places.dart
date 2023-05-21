import 'dart:io';

import 'package:favorite_place/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacessNotifier extends StateNotifier<List<Place>> {
  UserPlacessNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = Place(title: title, image: image, location: location);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacessNotifier, List<Place>>(
  (ref) => UserPlacessNotifier(),
);
