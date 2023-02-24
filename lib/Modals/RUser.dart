

class RUser {
  late String uid;
  late String name;
  late String email;
  late String role;
  RUser({required String uid,required String name,required String email,required String role}) {
    this.email = email;
    this.name = name;
    this.uid = uid;
    this.role = role;
  }
  Map<String, dynamic> toJSON() => {
        "uid": uid,
        "name": name,
        "email": email,
        "role": role
      };
}