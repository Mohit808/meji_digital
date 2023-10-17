/// id : "5f929254-079e-4bd6-8181-b1fe65142e45"
/// firstName : "Coding"
/// lastName : "Skill Test"
/// email : "codingskills-demo101@mejidigital.in"
/// status : "ACTIVE"
/// avatar : "https://ui-avatars.com/api/?name=Demo%20Lyfcon"
/// fullName : "Coding Skill Test"

class UserModel {
  UserModel({
      String? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? status, 
      String? avatar, 
      String? fullName,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _status = status;
    _avatar = avatar;
    _fullName = fullName;
}

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _status = json['status'];
    _avatar = json['avatar'];
    _fullName = json['fullName'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _status;
  String? _avatar;
  String? _fullName;
UserModel copyWith({  String? id,
  String? firstName,
  String? lastName,
  String? email,
  String? status,
  String? avatar,
  String? fullName,
}) => UserModel(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  status: status ?? _status,
  avatar: avatar ?? _avatar,
  fullName: fullName ?? _fullName,
);
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get status => _status;
  String? get avatar => _avatar;
  String? get fullName => _fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['status'] = _status;
    map['avatar'] = _avatar;
    map['fullName'] = _fullName;
    return map;
  }

}