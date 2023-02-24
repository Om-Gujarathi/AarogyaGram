class Doctor {
  String? uid;
  String? Name;
  String? Hospital_Name;
  int? Experience;
  String? Specialisation;
  String? Photo;

  Doctor( 
      {required this.uid,
      required this.Name,
      required this.Experience,
      required this.Specialisation,
      required this.Hospital_Name,
      required this.Photo});

  Map<String, dynamic> toJSON() => {
        "doctorUID": uid,
        "Name": Name,
        "Hospital_Name": Hospital_Name,
        "Experience": Experience,
        "Specialisation": Specialisation,
        "Photo": Photo,
      };
  static Doctor fromJSON(Map<String, dynamic>? map, String uid) => Doctor(
      uid: uid,
      Name: map!["Name"],
      Experience: map["Experience"],
      Specialisation: map["Specialisation"],
      Hospital_Name: map["Hospital_Name"],
Photo: map["Photo"]
      );
}
