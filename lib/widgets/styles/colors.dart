import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    return int.parse("FF$hexColor".toUpperCase().replaceAll("#", ""), radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppColor {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color midBlue = Color(0xFF246BB3);
  static const Color darkSlateBlue = Color(0xFF264C71);
  static const Color blueyGrey = Color(0xFF92A5B8);
  static const Color battleshipGrey = Color(0xff6c7c86);
  static const Color slate = Color(0xFF3E5061);
  static const Color blueGrey = Color(0xFF547C86);
  static const Color darkGreenBlue = Color(0xFF268074);
  static const Color paleTeal = Color(0xFF92BFB9);
  static const Color tea = Color(0xFF70A886);
  static const Color lichen = Color(0xFF8AC372);
  static const Color lightSage = Color(0xFFC4E1B8);
  static const Color khaki = Color(0xFF929D67);
  static const Color drabGreen = Color(0xFF708A4A);
  static const Color desert = Color(0xFFC3B966);
  static const Color yellowishOrange = Color(0xFFFEA61D);
  static const Color wheat = Color(0xFFFED28E);
  static const Color pastelOrange = Color(0xFFF49D53);
  static const Color dullOrange = Color(0xFFEB7f2C);
  static const Color lightSalmon = Color(0xFFF5BF95);
  static const Color orangish = Color(0xFFF28854);
  static const Color terracota = Color(0xFFE86631);
  static const Color darkPeach = Color(0xFFE97C58);
  static const Color tomato = Color(0xFFE74C2E);
  static const Color blush = Color(0xFFF3A596);
  static const Color melon = Color(0xFFEB7b6C);
  static const Color salmon = Color(0xFFEF7D72);
  static const Color lightPeach = Color(0xFFF7BEB8);
  static const Color duskyRose = Color(0xFFB46B6D);
  static const Color earth = Color(0xFFAE504E);
  static const Color dustyRose = Color(0xFFB77B85);
  static const Color dirtyPurple = Color(0xFF7B4D73);
  static const Color lightMauve = Color(0xFFBDA6B9);
  static const Color greyPurple = Color(0xFF6C6B85);
  static const Color duskBlue = Color(0xFF255b91);
  static const Color paleBlue = Color(0xFFdee4ea);
  static const Color lightGreyBlue = Color(0xFFa1b2c2);
  static const Color flatGreen = Color(0xFF619d47);
  static const Color paleGrey = Color(0xFFF4F6F8);
  static const Color veryLightBlue = Color(0xFFE8EBED);
}
