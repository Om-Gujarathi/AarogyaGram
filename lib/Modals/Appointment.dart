class Appointment {
  final String doctorUID;
  final String rUserPatientUID;
  final Map<String, dynamic> patientData;
  final DateTime time;
  final bool isCompleted;

  Appointment(
      {required this.isCompleted,
      required this.doctorUID,
      required this.rUserPatientUID,
      required this.patientData,
      required this.time});

  Map<String, dynamic> toJSON() => {
        "doctorUID": doctorUID,
        "rUserPatientUID": rUserPatientUID,
        "patientData": patientData,
        "time": time,
        "isCompleted": isCompleted
      };
  static Appointment fromJSON(Map<String, dynamic> map) => Appointment(
        doctorUID: map["uid"],
        rUserPatientUID: map["rUserPatientUID"],
        patientData: map["patientData"],
        time: map["time"],
        isCompleted: map["isCompleted"]
      );
}
