class Clubusermodel {
  String? status;
  String? message;
  List<Data>? data;

  Clubusermodel({this.status, this.message, this.data});

  Clubusermodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userName;
  String? email;
  String? password;
  String? countryCode;
  String? mobile;
  String? gender;
  String? dob;
  String? image;
  String? otp;
  String? accountStatus;
  String? address;
  String? lat;
  String? long;
  String? language;
  String? updatedAt;
  String? createdAt;
  String? generalNotification;
  String? sound;
  String? vibrate;
  String? appUpdate;
  String? newTipsAvailable;
  String? newServiceAvailable;
  String? firstName;
  String? lastName;
  String? wallet;
  String? deviceId;
  String? status;
  String? userType;
  String? clubName;
  String? city;
  String? state;
  String? postalCode;
  Null? clubId;
  String? clubIs;


  Data(
      {this.id,
        this.userName,
        this.email,
        this.password,
        this.countryCode,
        this.mobile,
        this.gender,
        this.dob,
        this.image,
        this.otp,
        this.accountStatus,
        this.address,
        this.lat,
        this.long,
        this.language,
        this.updatedAt,
        this.createdAt,
        this.generalNotification,
        this.sound,
        this.vibrate,
        this.appUpdate,
        this.newTipsAvailable,
        this.newServiceAvailable,
        this.firstName,
        this.lastName,
        this.wallet,
        this.deviceId,
        this.status,
        this.userType,
        this.clubName,
        this.city,
        this.state,
        this.postalCode,
        this.clubId,
        this.clubIs});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    image = json['image'];
    otp = json['otp'];
    accountStatus = json['account_status'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    language = json['language'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    generalNotification = json['general_notification'];
    sound = json['sound'];
    vibrate = json['vibrate'];
    appUpdate = json['app_update'];
    newTipsAvailable = json['new_tips_available'];
    newServiceAvailable = json['new_service_available'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    wallet = json['wallet'];
    deviceId = json['device_id'];
    status = json['status'];
    userType = json['user_type'];
    clubName = json['club_name'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    clubId = json['club_id'];
    clubIs = json['club_is'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['image'] = this.image;
    data['otp'] = this.otp;
    data['account_status'] = this.accountStatus;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['language'] = this.language;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['general_notification'] = this.generalNotification;
    data['sound'] = this.sound;
    data['vibrate'] = this.vibrate;
    data['app_update'] = this.appUpdate;
    data['new_tips_available'] = this.newTipsAvailable;
    data['new_service_available'] = this.newServiceAvailable;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['wallet'] = this.wallet;
    data['device_id'] = this.deviceId;
    data['status'] = this.status;
    data['user_type'] = this.userType;
    data['club_name'] = this.clubName;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postal_code'] = this.postalCode;
    data['club_id'] = this.clubId;
    data['club_is'] = this.clubIs;
    return data;
  }
}
