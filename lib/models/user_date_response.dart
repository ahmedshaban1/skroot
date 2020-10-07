import 'package:skroot/network/network-mappers.dart';

class UpdateUserResponse extends BaseMappable {
  User user;
  Settings settings;
  AccessToken accessToken;

  UpdateUserResponse({this.user, this.settings, this.accessToken});

  UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    accessToken = json['access_token'] != null
        ? new AccessToken.fromJson(json['access_token'])
        : null;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    accessToken = json['access_token'] != null
        ? new AccessToken.fromJson(json['access_token'])
        : null;
    return UpdateUserResponse(
      user: user ,
      accessToken: accessToken ,
      settings: settings
    );
  }

}

class User {
  int id;
  String name;
  String email;
  String phone;
  Country country;
  Country city;
  String bio;
  String avatarUrl;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.country,
        this.city,
        this.bio,
        this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    city = json['city'] != null ? new Country.fromJson(json['city']) : null;
    bio = json['bio'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['bio'] = this.bio;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}

class Country {
  int id;
  String nameEn;
  String nameAr;

  Country({this.id, this.nameEn, this.nameAr});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    return data;
  }
}

class Settings {
  bool banned;
  String locale;
  bool notificationToggle;

  Settings({this.banned, this.locale, this.notificationToggle});

  Settings.fromJson(Map<String, dynamic> json) {
    banned = json['banned'];
    locale = json['locale'];
    notificationToggle = json['notification_toggle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banned'] = this.banned;
    data['locale'] = this.locale;
    data['notification_toggle'] = this.notificationToggle;
    return data;
  }
}

class AccessToken {
  String token;
  String tokenType;
  String expiresAt;

  AccessToken({this.token, this.tokenType, this.expiresAt});

  AccessToken.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}
