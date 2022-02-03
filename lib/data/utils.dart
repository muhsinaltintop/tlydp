import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/data/allducks.dart';

class Utils {
  static List <DuckModel> getDucksFoundByUser(userId) {
    return ducks.where((duck) => duck.finderId == userId).toList();
  }

  static List <DuckModel> getDucksMadeByUser(int userId) {
    return ducks.where((duck) => duck.makerId == userId).toList();
  }

  static List <DuckModel> getDucksToFind() {
    return ducks.where((duck) => duck.locationFoundLat == null && duck.locationFoundLng == null).toList();
  }
}