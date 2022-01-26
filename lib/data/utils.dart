import 'package:tlydp/data/user_found_ducks.dart';


class Utils {
  static List <UserFoundDucks> getUserFoundDucks() {
    return [
      UserFoundDucks(
        duckName: "Juan",
        locationFound: "London",
        comments: "Easy to find",
        img: "https://m.media-amazon.com/images/I/51V3kV6BH2L._AC_SL1500_.jpg"
      ),
      UserFoundDucks(
        duckName: "Habanero",
        locationFound: "Leeds",
        comments: "Did not mean to find this duck",
        img: "https://www.stuff4pools.co.uk/wp-content/uploads/2020/10/Hot-Tub-Duck-1.jpg"
      )
    ];
  }
}