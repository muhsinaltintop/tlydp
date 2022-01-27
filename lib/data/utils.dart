import 'package:tlydp/data/user_found_ducks.dart';
import 'package:tlydp/data/user_made_ducks.dart';


class Utils {
  static List <UserFoundDucks> getUserFoundDucks() {
    return [
      UserFoundDucks(
        maker: "van3ssa",
        finder: "elisabeth21",
        duckName: "Juan",
        locationFound: "London",
        comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tristique finibus nulla et consectetur. Nam id ligula velit. Duis eu lacus gravida nibh fermentum venenatis ut sed velit. Sed et massa ut nisi ornare bibendum nec vitae lorem. Nullam tincidunt est sapien, in consectetur libero tempus sit amet. Maecenas vestibulum tortor eget efficitur dignissim. Maecenas hendrerit cursus est, faucibus rutrum mi sodales facilisis. Mauris sollicitudin tellus odio, eu fermentum nibh imperdiet at. Sed ut iaculis nulla.",
        img: "https://m.media-amazon.com/images/I/51V3kV6BH2L._AC_SL1500_.jpg"
      ),
      UserFoundDucks(
        maker: "lizz0000",
        finder: "elisabeth21",
        duckName: "Habanero",
        locationFound: "Leeds",
        comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tristique finibus nulla et consectetur. Nam id ligula velit. Duis eu lacus gravida nibh fermentum venenatis ut sed velit. Sed et massa ut nisi ornare bibendum nec vitae lorem. Nullam tincidunt est sapien, in consectetur libero tempus sit amet. Maecenas vestibulum tortor eget efficitur dignissim. Maecenas hendrerit cursus est, faucibus rutrum mi sodales facilisis. Mauris sollicitudin tellus odio, eu fermentum nibh imperdiet at. Sed ut iaculis nulla.",
        img: "https://media.istockphoto.com/photos/mallard-duck-on-white-background-picture-id464988959?k=20&m=464988959&s=612x612&w=0&h=J1Xy59x7bGH01hlt0YDdxXlBHlRX87KqvghQRepuo_o="
      )
    ];
  }

  static List <UserMadeDucks> getUserMadeDucks() {
    return [
      UserMadeDucks(
        maker: "suzy678",
        duckName: "Jacqueline",
        locationPlaced: "A cool place",
        clues: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas malesuada porttitor tellus id imperdiet. Cras ultricies libero odio, vitae posuere eros hendrerit sit amet. Praesent sit amet augue accumsan dolor lobortis euismod placerat eget magna. Duis faucibus ipsum eget tortor laoreet faucibus. Quisque ac ultrices erat. In a ex interdum, placerat neque a, pellentesque urna. Duis suscipit vestibulum nunc quis porttitor. Nullam lacus dolor, tristique eu turpis nec, laoreet porta sem. Mauris mattis quam id pretium elementum. Praesent id dignissim odio. Pellentesque dictum id turpis nec porta. Donec id risus at erat facilisis bibendum et et mauris. Phasellus at odio eget tellus viverra tincidunt. Sed finibus non est sit amet lobortis. Quisque magna purus, tempus a elit sed, bibendum auctor enim. Quisque libero velit, ultricies dapibus magna vel, ullamcorper suscipit nisl."
      ),
      UserMadeDucks(
        maker: "suzy678",
        duckName: "Jacqueline",
        locationPlaced: "The Arcade",
        clues: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas malesuada porttitor tellus id imperdiet. Cras ultricies libero odio, vitae posuere eros hendrerit sit amet. Praesent sit amet augue accumsan dolor lobortis euismod placerat eget magna. Duis faucibus ipsum eget tortor laoreet faucibus. Quisque ac ultrices erat. In a ex interdum, placerat neque a, pellentesque urna. Duis suscipit vestibulum nunc quis porttitor. Nullam lacus dolor, tristique eu turpis nec, laoreet porta sem. Mauris mattis quam id pretium elementum. Praesent id dignissim odio. Pellentesque dictum id turpis nec porta. Donec id risus at erat facilisis bibendum et et mauris. Phasellus at odio eget tellus viverra tincidunt. Sed finibus non est sit amet lobortis. Quisque magna purus, tempus a elit sed, bibendum auctor enim. Quisque libero velit, ultricies dapibus magna vel, ullamcorper suscipit nisl."
      )
    ];
  }
}