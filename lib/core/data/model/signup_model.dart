class ModAuth {
  String? name;
  String? email;
  String? password;
  String? gender;
  String? birth;
  String? phone;

  ModAuth(
      {this.name,
      this.email,
      this.password,
      this.gender,
      this.birth,
      this.phone});

  ModAuth.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    birth = json['birth'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['birth'] = this.birth;
    data['phone'] = this.phone;
    return data;
  }
}
