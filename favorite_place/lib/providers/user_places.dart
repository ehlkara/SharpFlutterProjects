import 'dart:io';

import 'package:favorite_place/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class UserPlacessNotifier extends StateNotifier<List<Place>> {
  UserPlacessNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final newPlace =
        Place(title: title, image: copiedImage, location: location);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacessNotifier, List<Place>>(
  (ref) => UserPlacessNotifier(),
);
