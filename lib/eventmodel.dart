class Eventmodel {
  String? status;
  String? message;
  List<Data>? data;

  Eventmodel({this.status, this.message, this.data});

  Eventmodel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? address;
  String? lat;
  String? long;
  String? dateTime;
  String? about;
  Null? categoryId;
  String? rating;
  String? userId;
  String? createdAt;
  Null? link;
  Null? visibleDate;
  Null? recurring;
  String? endDate;
  String? startTime;
  String? endTime;
  String? cost;
  String? eventImage;
  String? currencySymbol;
  String? type;
  EventUser? eventUser;
  List<FollowEventUsers>? followEventUsers;
  bool? fav;
  String? followEvent;
  List<Images>? images;

  Data(
      {this.id,
        this.title,
        this.address,
        this.lat,
        this.long,
        this.dateTime,
        this.about,
        this.categoryId,
        this.rating,
        this.userId,
        this.createdAt,
        this.link,
        this.visibleDate,
        this.recurring,
        this.endDate,
        this.startTime,
        this.endTime,
        this.cost,
        this.eventImage,
        this.currencySymbol,
        this.type,
        this.eventUser,
        this.followEventUsers,
        this.fav,
        this.followEvent,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    dateTime = json['date_time'];
    about = json['about'];
    categoryId = json['category_id'];
    rating = json['rating'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    link = json['link'];
    visibleDate = json['visible_date'];
    recurring = json['recurring'];
    endDate = json['end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    cost = json['cost'];
    eventImage = json['event_image'];
    currencySymbol = json['currency_symbol'];
    type = json['type'];
    eventUser = json['event_user'] != null
        ? new EventUser.fromJson(json['event_user'])
        : null;
    if (json['follow_event_users'] != null) {
      followEventUsers = <FollowEventUsers>[];
      json['follow_event_users'].forEach((v) {
        followEventUsers!.add(new FollowEventUsers.fromJson(v));
      });
    }
    fav = json['fav'];
    followEvent = json['follow_event'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['date_time'] = this.dateTime;
    data['about'] = this.about;
    data['category_id'] = this.categoryId;
    data['rating'] = this.rating;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['link'] = this.link;
    data['visible_date'] = this.visibleDate;
    data['recurring'] = this.recurring;
    data['end_date'] = this.endDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['cost'] = this.cost;
    data['event_image'] = this.eventImage;
    data['currency_symbol'] = this.currencySymbol;
    data['type'] = this.type;
    if (this.eventUser != null) {
      data['event_user'] = this.eventUser!.toJson();
    }
    if (this.followEventUsers != null) {
      data['follow_event_users'] =
          this.followEventUsers!.map((v) => v.toJson()).toList();
    }
    data['fav'] = this.fav;
    data['follow_event'] = this.followEvent;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventUser {
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
  Null? firstName;
  Null? lastName;
  String? wallet;
  String? deviceId;
  String? status;
  String? userType;
  String? clubName;
  String? city;
  String? state;
  String? postalCode;
  Null? clubId;

  EventUser(
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
        this.clubId});

  EventUser.fromJson(Map<String, dynamic> json) {

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
    return data;
  }
}

class FollowEventUsers {
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
  Null? lastName;
  String? wallet;
  String? deviceId;
  String? status;
  String? userType;
  Null? clubName;
  Null? city;
  Null? state;
  Null? postalCode;
  Null? clubId;

  FollowEventUsers(
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
        this.clubId});

  FollowEventUsers.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Images {
  String? id;
  String? eventId;
  String? image;

  Images({this.id, this.eventId, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_id'] = this.eventId;
    data['image'] = this.image;
    return data;
  }
}
