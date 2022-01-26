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
        img: "https://www.munchkin.co.uk/media/catalog/product/cache/fa94a348188ff11085d90b41566e795b/s/m/small_72_dpi_jpg-31001_047f.jpg"
      )
    ];
  }
}