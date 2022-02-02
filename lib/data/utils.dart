import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/data/allducks.dart';

class Utils {
  static List <DuckModel> getDucksFoundByUser(userId) {
    return ducks.where((duck) => duck.finderId == 2).toList();
  }

  static List <DuckModel> getDucksMadeByUser(int userId) {
    return ducks.where((duck) => duck.makerId == 2).toList();
  }
}