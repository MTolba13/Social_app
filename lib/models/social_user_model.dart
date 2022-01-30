class SocialUserModel {
   String? name;
   String? email;
   String? password;
   String? phone;
   String? uId;
   String? image;
   String? cover;
   String? bio;
   bool? isEmailVerified;

  SocialUserModel({
     this.name,
     this.email,
     this.password,
     this.phone,
     this.uId,
     this.image,
     this.cover,
     this.bio,
     this.isEmailVerified,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'image': image,
      'cover': cover,
      'bio': bio,
    };
  }
}
