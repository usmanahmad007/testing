import 'dart:convert';

class UserModel {
  bool? status;
  String? token;
  User? user;
  String? message;
  UserModel({
    this.status,
    this.token,
    this.user,
    this.message,
  });
  void updateFrom(UserModel newUser) {
    if (newUser.status != null) {
      status = newUser.status;
    }
    if (newUser.token != null) {
      token = newUser.token;
    }
    if (newUser.user != null) {
      user ??= User();
      user!.updateFrom(newUser.user!);
    }
    if (newUser.message != null) {
      message = newUser.message;
    }
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) {
      result.addAll({'status': status});
    }
    if (token != null) {
      result.addAll({'token': token});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }
    if (message != null) {
      result.addAll({'message': message});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      status: map['status'],
      token: map['token'],
      user: map['user'] != null
          ? User.fromMap(map['user'])
          : map['data'] != null
              ? User.fromMap(map['data'])
              : null,
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(status: $status, token: $token, user: $user, message: $message)';
  }
}

class User {
  int? id;
  String? fullName;
  String? username;
  String? email;
  String? phoneNo;
  String? address;
  int? status;
  String? dateOfBirth;
  String? country;
  String? gender;
  String? image;
  String? bio;
  String? role;
  String? lastLoginDate;
  int? emailVerified;
  int? phoneVerified;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;
  List<Followers>? followers;
  List<Followings>? followings;
  List<MyVenues>? myVenues;
  List<MyFavoriteVenues>? myFavoriteVenues;
  List<Prefrences>? prefrences;
  Location? location;
  List<Posts>? posts;
  String? password;
  User({
    this.id,
    this.fullName,
    this.username,
    this.email,
    this.phoneNo,
    this.address,
    this.status,
    this.dateOfBirth,
    this.country,
    this.gender,
    this.image,
    this.bio,
    this.role,
    this.lastLoginDate,
    this.emailVerified,
    this.phoneVerified,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
    this.followers,
    this.followings,
    this.myVenues,
    this.myFavoriteVenues,
    this.prefrences,
    this.location,
    this.posts,
    this.password,
  });

  void updateFrom(User other) {
    id = other.id ?? id;
    fullName = other.fullName ?? fullName;
    username = other.username ?? username;
    email = other.email ?? email;
    phoneNo = other.phoneNo ?? phoneNo;
    address = other.address ?? address;
    status = other.status ?? status;
    dateOfBirth = other.dateOfBirth ?? dateOfBirth;
    country = other.country ?? country;
    gender = other.gender ?? gender;
    image = other.image ?? image;
    bio = other.bio ?? bio;
    role = other.role ?? role;
    lastLoginDate = other.lastLoginDate ?? lastLoginDate;
    emailVerified = other.emailVerified ?? emailVerified;
    phoneVerified = other.phoneVerified ?? phoneVerified;
    deviceToken = other.deviceToken ?? deviceToken;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    followers = other.followers ?? followers;
    followings = other.followings ?? followings;
    myVenues = other.myVenues ?? myVenues;
    myFavoriteVenues = other.myFavoriteVenues ?? myFavoriteVenues;
    prefrences = other.prefrences ?? prefrences;
    location = other.location ?? location;
    posts = other.posts ?? posts;
    password = other.password ?? password;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (fullName != null) {
      result.addAll({'fullName': fullName});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (phoneNo != null) {
      result.addAll({'phoneNo': phoneNo});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (dateOfBirth != null) {
      result.addAll({'dateOfBirth': dateOfBirth});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (bio != null) {
      result.addAll({'bio': bio});
    }
    if (role != null) {
      result.addAll({'role': role});
    }
    if (lastLoginDate != null) {
      result.addAll({'lastLoginDate': lastLoginDate});
    }
    if (emailVerified != null) {
      result.addAll({'emailVerified': emailVerified});
    }
    if (phoneVerified != null) {
      result.addAll({'phoneVerified': phoneVerified});
    }
    if (deviceToken != null) {
      result.addAll({'deviceToken': deviceToken});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (followers != null) {
      result.addAll({'followers': followers!.map((x) => x.toMap()).toList()});
    }
    if (followings != null) {
      result.addAll({'followings': followings!.map((x) => x.toMap()).toList()});
    }
    if (myVenues != null) {
      result.addAll({'myVenues': myVenues!.map((x) => x.toMap()).toList()});
    }
    if (myFavoriteVenues != null) {
      result.addAll({
        'myFavoriteVenues': myFavoriteVenues!.map((x) => x.toMap()).toList()
      });
    }
    if (prefrences != null) {
      result.addAll({'prefrences': prefrences!.map((x) => x.toMap()).toList()});
    }
    if (location != null) {
      result.addAll({'location': location!.toMap()});
    }
    if (posts != null) {
      result.addAll({'posts': posts!.map((x) => x.toMap()).toList()});
    }
    if (password != null) {
      result.addAll({'password': password});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      fullName: map['fullName'],
      username: map['username'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      address: map['address'],
      status: map['status']?.toInt(),
      dateOfBirth: map['dateOfBirth'],
      country: map['country'],
      gender: map['gender'],
      image: map['image'],
      bio: map['bio'],
      role: map['role'],
      lastLoginDate: map['lastLoginDate'],
      emailVerified: map['emailVerified']?.toInt(),
      phoneVerified: map['phoneVerified']?.toInt(),
      deviceToken: map['deviceToken'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      followers: map['followers'] != null
          ? List<Followers>.from(
              map['followers']?.map((x) => Followers.fromMap(x))).toList()
          : [],
      followings: map['followings'] != null
          ? List<Followings>.from(
              map['followings']?.map((x) => Followings.fromMap(x))).toList()
          : [],
      myVenues: map['myVenues'] != null
          ? List<MyVenues>.from(
              map['myVenues']?.map((x) => MyVenues.fromMap(x)))
          : [],
      myFavoriteVenues: map['myFavoriteVenues'] != null
          ? List<MyFavoriteVenues>.from(
              map['myFavoriteVenues']?.map((x) => MyFavoriteVenues.fromMap(x)))
          : [],
      prefrences: map['prefrences'] != null
          ? List<Prefrences>.from(
              map['prefrences']?.map((x) => Prefrences.fromMap(x)))
          : [],
      location:
          map['location'] != null ? Location.fromMap(map['location']) : null,
      posts: map['posts'] != null
          ? List<Posts>.from(map['posts']?.map((x) => Posts.fromMap(x)))
          : [],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, username: $username, email: $email, phoneNo: $phoneNo, address: $address, status: $status, dateOfBirth: $dateOfBirth, country: $country, gender: $gender, image: $image, bio: $bio, role: $role, lastLoginDate: $lastLoginDate, emailVerified: $emailVerified, phoneVerified: $phoneVerified, deviceToken: $deviceToken, createdAt: $createdAt, updatedAt: $updatedAt, followers: $followers, followings: $followings, myVenues: $myVenues, myFavoriteVenues: $myFavoriteVenues, prefrences: $prefrences, location: $location, posts: $posts, password: $password)';
  }
}

class Followers {
  int? id;
  int? userId;
  int? followerId;
  String? createdAt;
  String? updatedAt;
  User? followerData;
  Followers({
    this.id,
    this.userId,
    this.followerId,
    this.createdAt,
    this.updatedAt,
    this.followerData,
  });

  void updateFrom(Followers other) {
    id = other.id ?? id;
    userId = other.userId ?? userId;
    followerId = other.followerId ?? followerId;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    followerData = other.followerData ?? followerData;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (followerId != null) {
      result.addAll({'followerId': followerId});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (followerData != null) {
      result.addAll({'followerData': followerData!.toMap()});
    }

    return result;
  }

  factory Followers.fromMap(Map<String, dynamic> map) {
    return Followers(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      followerId: map['followerId']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      followerData: map['followerData'] != null
          ? User.fromMap(map['followerData'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Followers.fromJson(String source) =>
      Followers.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Followers(id: $id, userId: $userId, followerId: $followerId, createdAt: $createdAt, updatedAt: $updatedAt, followerData: $followerData)';
  }
}

class Followings {
  int? id;
  int? userId;
  int? followerId;
  String? createdAt;
  String? updatedAt;
  User? followingData;
  Followings({
    this.id,
    this.userId,
    this.followerId,
    this.createdAt,
    this.updatedAt,
    this.followingData,
  });

  void updateFrom(Followings other) {
    id = other.id ?? id;
    userId = other.userId ?? userId;
    followerId = other.followerId ?? followerId;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    followingData = other.followingData ?? followingData;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (followerId != null) {
      result.addAll({'followerId': followerId});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (followingData != null) {
      result.addAll({'followingData': followingData!.toMap()});
    }

    return result;
  }

  factory Followings.fromMap(Map<String, dynamic> map) {
    return Followings(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      followerId: map['followerId']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      followingData: map['followingData'] != null
          ? User.fromMap(map['followingData'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Followings.fromJson(String source) =>
      Followings.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Followings(id: $id, userId: $userId, followerId: $followerId, createdAt: $createdAt, updatedAt: $updatedAt, followingData: $followingData)';
  }
}

class MyVenues {
  Location? location;
  List<BusinessHours>? businessHours;
  int? id;
  int? userId;
  int? categoryId;
  String? name;
  String? coverImage;
  String? description;
  String? status;
  int? totalRating;
  String? area;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<GalleryImageTypes>? galleryImageTypes;
  List<Reviews>? reviews;
  MyVenues({
    this.location,
    this.businessHours,
    this.id,
    this.userId,
    this.categoryId,
    this.name,
    this.coverImage,
    this.description,
    this.status,
    this.totalRating,
    this.area,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.galleryImageTypes,
    this.reviews,
  });

  void updateFrom(MyVenues other) {
    location = other.location ?? location;
    businessHours = other.businessHours ?? businessHours;
    id = other.id ?? id;
    userId = other.userId ?? userId;
    categoryId = other.categoryId ?? categoryId;
    name = other.name ?? name;
    coverImage = other.coverImage ?? coverImage;
    description = other.description ?? description;
    status = other.status ?? status;
    totalRating = other.totalRating ?? totalRating;
    area = other.area ?? area;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    category = other.category ?? category;
    galleryImageTypes = other.galleryImageTypes ?? galleryImageTypes;
    reviews = other.reviews ?? reviews;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (location != null) {
      result.addAll({'location': location!.toMap()});
    }
    if (businessHours != null) {
      result.addAll(
          {'businessHours': businessHours!.map((x) => x.toMap()).toList()});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (categoryId != null) {
      result.addAll({'categoryId': categoryId});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (coverImage != null) {
      result.addAll({'coverImage': coverImage});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (totalRating != null) {
      result.addAll({'totalRating': totalRating});
    }
    if (area != null) {
      result.addAll({'area': area});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (category != null) {
      result.addAll({'category': category!.toMap()});
    }
    if (galleryImageTypes != null) {
      result.addAll({
        'galleryImageTypes': galleryImageTypes!.map((x) => x.toMap()).toList()
      });
    }
    if (reviews != null) {
      result.addAll({'reviews': reviews!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory MyVenues.fromMap(Map<String, dynamic> map) {
    return MyVenues(
      location:
          map['location'] != null ? Location.fromMap(map['location']) : null,
      businessHours: map['businessHours'] != null
          ? List<BusinessHours>.from(
              map['businessHours']?.map((x) => BusinessHours.fromMap(x)))
          : [],
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      categoryId: map['categoryId']?.toInt(),
      name: map['name'],
      coverImage: map['coverImage'],
      description: map['description'],
      status: map['status'],
      totalRating: map['totalRating']?.toInt(),
      area: map['area'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      category:
          map['category'] != null ? Category.fromMap(map['category']) : null,
      galleryImageTypes: map['galleryImageTypes'] != null
          ? List<GalleryImageTypes>.from(map['galleryImageTypes']
              ?.map((x) => GalleryImageTypes.fromMap(x)))
          : [],
      reviews: map['reviews'] != null
          ? List<Reviews>.from(map['reviews']?.map((x) => Reviews.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory MyVenues.fromJson(String source) =>
      MyVenues.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyVenues(location: $location, businessHours: $businessHours, id: $id, userId: $userId, categoryId: $categoryId, name: $name, coverImage: $coverImage, description: $description, status: $status, totalRating: $totalRating, area: $area, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, galleryImageTypes: $galleryImageTypes, reviews: $reviews)';
  }
}

class BusinessHours {
  List<WeekDays>? monday;
  List<WeekDays>? tuesday;
  List<WeekDays>? wednesday;
  List<WeekDays>? thursday;
  List<WeekDays>? friday;
  List<WeekDays>? saturday;
  List<WeekDays>? sunday;
  BusinessHours({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  void updateFrom(BusinessHours other) {
    monday = other.monday ?? monday;
    tuesday = other.tuesday ?? tuesday;
    wednesday = other.wednesday ?? wednesday;
    thursday = other.thursday ?? thursday;
    friday = other.friday ?? friday;
    saturday = other.saturday ?? saturday;
    sunday = other.sunday ?? sunday;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (monday != null) {
      result.addAll({'monday': monday!.map((x) => x.toMap()).toList()});
    }
    if (tuesday != null) {
      result.addAll({'tuesday': tuesday!.map((x) => x.toMap()).toList()});
    }
    if (wednesday != null) {
      result.addAll({'wednesday': wednesday!.map((x) => x.toMap()).toList()});
    }
    if (thursday != null) {
      result.addAll({'thursday': thursday!.map((x) => x.toMap()).toList()});
    }
    if (friday != null) {
      result.addAll({'friday': friday!.map((x) => x.toMap()).toList()});
    }
    if (saturday != null) {
      result.addAll({'saturday': saturday!.map((x) => x.toMap()).toList()});
    }
    if (sunday != null) {
      result.addAll({'sunday': sunday!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory BusinessHours.fromMap(Map<String, dynamic> map) {
    return BusinessHours(
      monday: map['monday'] != null
          ? List<WeekDays>.from(map['monday']?.map((x) => WeekDays.fromMap(x)))
          : [],
      tuesday: map['tuesday'] != null
          ? List<WeekDays>.from(map['tuesday']?.map((x) => WeekDays.fromMap(x)))
          : [],
      wednesday: map['wednesday'] != null
          ? List<WeekDays>.from(
              map['wednesday']?.map((x) => WeekDays.fromMap(x)))
          : [],
      thursday: map['thursday'] != null
          ? List<WeekDays>.from(
              map['thursday']?.map((x) => WeekDays.fromMap(x)))
          : [],
      friday: map['friday'] != null
          ? List<WeekDays>.from(map['friday']?.map((x) => WeekDays.fromMap(x)))
          : [],
      saturday: map['saturday'] != null
          ? List<WeekDays>.from(
              map['saturday']?.map((x) => WeekDays.fromMap(x)))
          : [],
      sunday: map['sunday'] != null
          ? List<WeekDays>.from(map['sunday']?.map((x) => WeekDays.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessHours.fromJson(String source) =>
      BusinessHours.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BusinessHours(monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday)';
  }
}

class WeekDays {
  String? open;
  String? close;
  WeekDays({
    this.open,
    this.close,
  });

  void updateFrom(WeekDays other) {
    open = other.open ?? open;
    close = other.close ?? close;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (open != null) {
      result.addAll({'open': open});
    }
    if (close != null) {
      result.addAll({'close': close});
    }

    return result;
  }

  factory WeekDays.fromMap(Map<String, dynamic> map) {
    return WeekDays(
      open: map['open'],
      close: map['close'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeekDays.fromJson(String source) =>
      WeekDays.fromMap(json.decode(source));

  @override
  String toString() => 'WeekDays(open: $open, close: $close)';
}

class Category {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  Category({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  void updateFrom(Category other) {
    id = other.id ?? id;
    name = other.name ?? name;
    image = other.image ?? image;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt(),
      name: map['name'],
      image: map['image'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(id: $id, name: $name, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

class GalleryImageTypes {
  int? id;
  int? venueId;
  String? title;
  String? createdAt;
  String? updatedAt;
  List<GalleryImages>? galleryImages;
  GalleryImageTypes({
    this.id,
    this.venueId,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.galleryImages,
  });

  void updateFrom(GalleryImageTypes other) {
    id = other.id ?? id;
    venueId = other.venueId ?? venueId;
    title = other.title ?? title;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    galleryImages = other.galleryImages ?? galleryImages;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (venueId != null) {
      result.addAll({'venueId': venueId});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (galleryImages != null) {
      result.addAll(
          {'galleryImages': galleryImages!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory GalleryImageTypes.fromMap(Map<String, dynamic> map) {
    return GalleryImageTypes(
      id: map['id']?.toInt(),
      venueId: map['venueId']?.toInt(),
      title: map['title'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      galleryImages: map['galleryImages'] != null
          ? List<GalleryImages>.from(
              map['galleryImages']?.map((x) => GalleryImages.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryImageTypes.fromJson(String source) =>
      GalleryImageTypes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GalleryImageTypes(id: $id, venueId: $venueId, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, galleryImages: $galleryImages)';
  }
}

class GalleryImages {
  int? id;
  int? venueId;
  int? galleryImageTypeId;
  String? image;
  String? createdAt;
  String? updatedAt;
  GalleryImages({
    this.id,
    this.venueId,
    this.galleryImageTypeId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  void updateFrom(GalleryImages other) {
    id = other.id ?? id;
    venueId = other.venueId ?? venueId;
    galleryImageTypeId = other.galleryImageTypeId ?? galleryImageTypeId;
    image = other.image ?? image;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (venueId != null) {
      result.addAll({'venueId': venueId});
    }
    if (galleryImageTypeId != null) {
      result.addAll({'galleryImageTypeId': galleryImageTypeId});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }

    return result;
  }

  factory GalleryImages.fromMap(Map<String, dynamic> map) {
    return GalleryImages(
      id: map['id']?.toInt(),
      venueId: map['venueId']?.toInt(),
      galleryImageTypeId: map['galleryImageTypeId']?.toInt(),
      image: map['image'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryImages.fromJson(String source) =>
      GalleryImages.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GalleryImages(id: $id, venueId: $venueId, galleryImageTypeId: $galleryImageTypeId, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

class MyFavoriteVenues {
  int? id;
  int? userId;
  int? venueId;
  String? createdAt;
  String? updatedAt;
  Venue? venue;
  MyFavoriteVenues({
    this.id,
    this.userId,
    this.venueId,
    this.createdAt,
    this.updatedAt,
    this.venue,
  });

  void updateFrom(MyFavoriteVenues other) {
    id = other.id ?? id;
    userId = other.userId ?? userId;
    venueId = other.venueId ?? venueId;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    venue = other.venue ?? venue;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (venueId != null) {
      result.addAll({'venueId': venueId});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (venue != null) {
      result.addAll({'venue': venue!.toMap()});
    }

    return result;
  }

  factory MyFavoriteVenues.fromMap(Map<String, dynamic> map) {
    return MyFavoriteVenues(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      venueId: map['venueId']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      venue: map['venue'] != null ? Venue.fromMap(map['venue']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyFavoriteVenues.fromJson(String source) =>
      MyFavoriteVenues.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyFavoriteVenues(id: $id, userId: $userId, venueId: $venueId, createdAt: $createdAt, updatedAt: $updatedAt, venue: $venue)';
  }
}

class Venue {
  Location? location;
  List<BusinessHours>? businessHours;
  int? id;
  int? userId;
  int? categoryId;
  String? name;
  String? coverImage;
  String? description;
  String? status;
  int? totalRating;
  String? area;
  String? createdAt;
  String? updatedAt;
  Category? category;
  User? user;
  List<GalleryImageTypes>? galleryImageTypes;
  List<Reviews>? reviews;
  Venue({
    this.location,
    this.businessHours,
    this.id,
    this.userId,
    this.categoryId,
    this.name,
    this.coverImage,
    this.description,
    this.status,
    this.totalRating,
    this.area,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.user,
    this.galleryImageTypes,
    this.reviews,
  });

  void updateFrom(Venue other) {
    location = other.location ?? location;
    businessHours = other.businessHours ?? businessHours;
    id = other.id ?? id;
    userId = other.userId ?? userId;
    categoryId = other.categoryId ?? categoryId;
    name = other.name ?? name;
    coverImage = other.coverImage ?? coverImage;
    description = other.description ?? description;
    status = other.status ?? status;
    totalRating = other.totalRating ?? totalRating;
    area = other.area ?? area;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    category = other.category ?? category;
    user = other.user ?? user;
    galleryImageTypes = other.galleryImageTypes ?? galleryImageTypes;
    reviews = other.reviews ?? reviews;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (location != null) {
      result.addAll({'location': location!.toMap()});
    }
    if (businessHours != null) {
      result.addAll(
          {'businessHours': businessHours!.map((x) => x.toMap()).toList()});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (categoryId != null) {
      result.addAll({'categoryId': categoryId});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (coverImage != null) {
      result.addAll({'coverImage': coverImage});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (totalRating != null) {
      result.addAll({'totalRating': totalRating});
    }
    if (area != null) {
      result.addAll({'area': area});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (category != null) {
      result.addAll({'category': category!.toMap()});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }
    if (galleryImageTypes != null) {
      result.addAll({
        'galleryImageTypes': galleryImageTypes!.map((x) => x.toMap()).toList()
      });
    }
    if (reviews != null) {
      result.addAll({'reviews': reviews!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory Venue.fromMap(Map<String, dynamic> map) {
    return Venue(
      location:
          map['location'] != null ? Location.fromMap(map['location']) : null,
      businessHours: map['businessHours'] != null
          ? List<BusinessHours>.from(
              map['businessHours']?.map((x) => BusinessHours.fromMap(x)))
          : [],
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      categoryId: map['categoryId']?.toInt(),
      name: map['name'],
      coverImage: map['coverImage'],
      description: map['description'],
      status: map['status'],
      totalRating: map['totalRating']?.toInt(),
      area: map['area'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      category:
          map['category'] != null ? Category.fromMap(map['category']) : null,
      user: map['user'] != null ? User.fromMap(map['user']) : null,
      galleryImageTypes: map['galleryImageTypes'] != null
          ? List<GalleryImageTypes>.from(map['galleryImageTypes']
              ?.map((x) => GalleryImageTypes.fromMap(x)))
          : [],
      reviews: map['reviews'] != null
          ? List<Reviews>.from(map['reviews']?.map((x) => Reviews.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Venue.fromJson(String source) => Venue.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Venue(location: $location, businessHours: $businessHours, id: $id, userId: $userId, categoryId: $categoryId, name: $name, coverImage: $coverImage, description: $description, status: $status, totalRating: $totalRating, area: $area, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, user: $user, galleryImageTypes: $galleryImageTypes, reviews: $reviews)';
  }
}

class Reviews {
  int? id;
  int? userId;
  int? venueId;
  int? rating;
  String? message;
  String? createdAt;
  String? updatedAt;
  User? user;
  Reviews({
    this.id,
    this.userId,
    this.venueId,
    this.rating,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  void updateFrom(Reviews other) {
    id = other.id ?? id;
    userId = other.userId ?? userId;
    venueId = other.venueId ?? venueId;
    rating = other.rating ?? rating;
    message = other.message ?? message;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    user = other.user ?? user;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (venueId != null) {
      result.addAll({'venueId': venueId});
    }
    if (rating != null) {
      result.addAll({'rating': rating});
    }
    if (message != null) {
      result.addAll({'message': message});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }

    return result;
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      venueId: map['venueId']?.toInt(),
      rating: map['rating']?.toInt(),
      message: map['message'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      user: map['user'] != null ? User.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromJson(String source) =>
      Reviews.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Reviews(id: $id, userId: $userId, venueId: $venueId, rating: $rating, message: $message, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }
}

class Prefrences {
  int? id;
  int? userId;
  int? interestId;
  String? createdAt;
  String? updatedAt;
  Interest? interest;
  Prefrences({
    this.id,
    this.userId,
    this.interestId,
    this.createdAt,
    this.updatedAt,
    this.interest,
  });

  void updateFrom(Prefrences other) {
    id = other.id ?? id;
    userId = other.userId ?? userId;
    interestId = other.interestId ?? interestId;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    interest = other.interest ?? interest;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (interestId != null) {
      result.addAll({'interestId': interestId});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (interest != null) {
      result.addAll({'interest': interest!.toMap()});
    }

    return result;
  }

  factory Prefrences.fromMap(Map<String, dynamic> map) {
    return Prefrences(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      interestId: map['interestId']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      interest:
          map['interest'] != null ? Interest.fromMap(map['interest']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Prefrences.fromJson(String source) =>
      Prefrences.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Prefrences(id: $id, userId: $userId, interestId: $interestId, createdAt: $createdAt, updatedAt: $updatedAt, interest: $interest)';
  }
}

class Interest {
  int? id;
  String? interest;
  String? createdAt;
  String? updatedAt;
  Interest({
    this.id,
    this.interest,
    this.createdAt,
    this.updatedAt,
  });

  void updateFrom(Interest other) {
    id = other.id ?? id;
    interest = other.interest ?? interest;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (interest != null) {
      result.addAll({'interest': interest});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }

    return result;
  }

  factory Interest.fromMap(Map<String, dynamic> map) {
    return Interest(
      id: map['id']?.toInt(),
      interest: map['interest'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Interest.fromJson(String source) =>
      Interest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Interest(id: $id, interest: $interest, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

class Location {
  Location? cordinates;
  int? id;
  int? userId;
  String? createdAt;
  String? updatedAt;
  double? latitude;
  double? longitude;
  String? name;
  Location({
    this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.name,
  });

  void updateFrom(Location other) {
    cordinates = other.cordinates ?? cordinates;
    id = other.id ?? id;
    userId = other.userId ?? userId;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    latitude = other.latitude ?? latitude;
    longitude = other.longitude ?? longitude;
    name = other.name ?? name;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (latitude != null) {
      result.addAll({'latitude': latitude});
    }
    if (longitude != null) {
      result.addAll({'longitude': longitude});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Location(id: $id, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, latitude: $latitude, longitude: $longitude, name: $name)';
  }
}

class Posts {
  int? id;
  int? userId;
  int? venueId;
  String? description;
  String? createdAt;
  String? updatedAt;
  Venue? venue;
  List<PostLikes>? postLikes;
  List<PostComments>? postComments;
  Posts({
    this.id,
    this.userId,
    this.venueId,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.venue,
    this.postLikes,
    this.postComments,
  });

  void updateFrom(Posts other) {
    id = other.id ?? id;
    userId = other.userId ?? userId;
    venueId = other.venueId ?? venueId;
    description = other.description ?? description;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    venue = other.venue ?? venue;
    postLikes = other.postLikes ?? postLikes;
    postComments = other.postComments ?? postComments;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (venueId != null) {
      result.addAll({'venueId': venueId});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (venue != null) {
      result.addAll({'venue': venue!.toMap()});
    }
    if (postLikes != null) {
      result.addAll({'postLikes': postLikes!.map((x) => x.toMap()).toList()});
    }
    if (postComments != null) {
      result.addAll(
          {'postComments': postComments!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      venueId: map['venueId']?.toInt(),
      description: map['description'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      venue: map['venue'] != null ? Venue.fromMap(map['venue']) : null,
      postLikes: map['postLikes'] != null
          ? List<PostLikes>.from(
              map['postLikes']?.map((x) => PostLikes.fromMap(x)))
          : [],
      postComments: map['postComments'] != null
          ? List<PostComments>.from(
              map['postComments']?.map((x) => PostComments.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Posts.fromJson(String source) => Posts.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Posts(id: $id, userId: $userId, venueId: $venueId, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, venue: $venue, postLikes: $postLikes, postComments: $postComments)';
  }
}

class PostLikes {
  int? id;
  int? userId;
  int? postId;
  String? createdAt;
  String? updatedAt;
  User? user;
  PostLikes({
    this.id,
    this.userId,
    this.postId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  void updateFrom(PostLikes other) {
    id = other.id ?? id;
    userId = other.userId ?? userId;
    postId = other.postId ?? postId;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    user = other.user ?? user;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (postId != null) {
      result.addAll({'postId': postId});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }

    return result;
  }

  factory PostLikes.fromMap(Map<String, dynamic> map) {
    return PostLikes(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      postId: map['postId']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      user: map['user'] != null ? User.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostLikes.fromJson(String source) =>
      PostLikes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostLikes(id: $id, userId: $userId, postId: $postId, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }
}

class PostComments {
  int? id;
  int? userId;
  int? postId;
  String? comment;
  String? createdAt;
  String? updatedAt;
  User? user;
  PostComments({
    this.id,
    this.userId,
    this.postId,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  void updateFrom(PostComments other) {
    id = other.id ?? id;
    userId = other.userId ?? userId;
    postId = other.postId ?? postId;
    comment = other.comment ?? comment;
    createdAt = other.createdAt ?? createdAt;
    updatedAt = other.updatedAt ?? updatedAt;
    user = other.user ?? user;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (postId != null) {
      result.addAll({'postId': postId});
    }
    if (comment != null) {
      result.addAll({'comment': comment});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }

    return result;
  }

  factory PostComments.fromMap(Map<String, dynamic> map) {
    return PostComments(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      postId: map['postId']?.toInt(),
      comment: map['comment'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      user: map['user'] != null ? User.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostComments.fromJson(String source) =>
      PostComments.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostComments(id: $id, userId: $userId, postId: $postId, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }
}
