import 'dart:io';

import 'package:favorite_place/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacessNotifier extends StateNotifier<List<Place>> {
  UserPlacessNotifier() : super(const []);

  void addPlace(String title, File image) {
    final newPlace = Place(title: title, image: image);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacessNotifier, List<Place>>(
  (ref) => UserPlacessNotifier(),
);
