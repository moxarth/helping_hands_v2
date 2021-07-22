class UserModel{
  String? userName, userId, userEmail, userBloodGroup, userLocation, userPhoto, userPhone;

  UserModel({this.userName, this.userId, this.userEmail, this.userBloodGroup,
      this.userLocation, this.userPhoto, this.userPhone});

  Map? toMap(UserModel userModel){
    var data = Map<String, dynamic>();
    data['name'] = userModel.userName;
    data['email'] = userModel.userEmail;
    data['photo'] = userModel.userPhoto;
    data['phone'] = userModel.userPhone;
    data['location'] = userModel.userLocation;
    data['bloodGroup'] = userModel.userBloodGroup;
    data['uid'] = userModel.userId;
    return data;
  }

  UserModel? fromMap(Map map){
    this.userName = map['name'];
    this.userEmail = map['email'];
    this.userPhoto = map['photo'];
    this.userPhone = map['phone'];
    this.userLocation = map['location'];
    this.userBloodGroup = map['bloodGroup'];
    this.userId = map['uid'];
  }
}