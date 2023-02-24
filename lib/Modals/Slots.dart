class Slot {
  late String doctorUID;
  late String slotUID;
  late DateTime time;
  late bool isAvailable;
  Slot(
      {required String doctorUID,
      required String slotUID,
      required DateTime time,
      required bool isAvailable}) {
    this.doctorUID = doctorUID;
    this.slotUID = slotUID;
    this.time = time;
    this.isAvailable = isAvailable;
  }
  Map<String, dynamic> toJSON() => {
        "doctorUID": doctorUID,
        // "slotUID": slotUID,
        "time": time,
        "available": isAvailable
      };
  static Slot fromJSON(Map<String, dynamic> map, String slotUID) => Slot(
      doctorUID: map["doctorUID"],
      slotUID: slotUID,
      // this line is converting Timestamp DT<Firebase> into DateTime DT<Dart>
      time: DateTime.fromMillisecondsSinceEpoch(map["time"].seconds * 1000),
      isAvailable: map["available"]);
}
