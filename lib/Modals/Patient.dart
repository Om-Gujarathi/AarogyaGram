class Patient {
  final String uid;
  final String email;
  final String name;
  final String phoneNumber;
  final String gender;
  final int age;
  Patient(
      this.uid, this.email, this.name, this.phoneNumber, this.gender, this.age);

  static Patient fromJSON(Map<String, dynamic> map) => Patient(map["uid"],
      map["email"], map["name"], map["phoneNumber"], map["gender"], map["age"]);

  Map<String, dynamic> toJSON(Patient patient) => {
        "uid": patient.uid,
        "email": patient.email,
        "name": patient.name,
        "phoneNumber": patient.phoneNumber,
        "gender": patient.gender,
        "age": patient.age,
      };
}
