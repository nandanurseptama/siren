abstract class Env {
  static Env create({String envName = "DEV"}) {
    return EnvDev();
  }

  String get baseUrl => "https://dummyapi.io/data/v1";
  String get apiKey => "647adddd347adb508046eb37";
  String get postUrl => "$baseUrl/post";
  String get userUrl => "$baseUrl/user";

  String get meId => "60d0fe4f5311236168a109f4";
}

class EnvDev extends Env {}
