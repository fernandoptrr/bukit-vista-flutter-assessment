class Booking {
  Booking({
    required this.id,
    required this.placeName,
    required this.status,
    required this.startDate,
    required this.endDate,
    this.detail,
  });

  final String id;
  final String placeName;
  final String status;
  final DateTime startDate;
  final DateTime endDate;
  final BookingDetail? detail;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        placeName: json["place_name"],
        status: json["status"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
      );

  @override
  String toString() {
    return 'Booking(id: $id, placeName: $placeName, status: $status, startDate: $startDate, endDate: $endDate, detail: $detail)';
  }

  Booking copyWith({
    String? id,
    String? placeName,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    BookingDetail? detail,
  }) {
    return Booking(
      id: id ?? this.id,
      placeName: placeName ?? this.placeName,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      detail: detail ?? this.detail,
    );
  }
}

class BookingDetail {
  BookingDetail({
    required this.id,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    required this.numOfNight,
    required this.numOfGuest,
    required this.phoneNumber,
    required this.value,
    required this.host,
    required this.profileName,
    required this.propertyUnit,
    required this.listingName,
  });

  final String id;
  final DateTime checkIn;
  final DateTime checkOut;
  final String status;
  final int numOfNight;
  final int numOfGuest;
  final String phoneNumber;
  final double value;
  final String host;
  final String profileName;
  final String propertyUnit;
  final String listingName;

  factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
        id: json["id"],
        checkIn: DateTime.parse(json["check_in"]),
        checkOut: DateTime.parse(json["check_out"]),
        status: json["status"],
        numOfNight: json["num_of_night"],
        numOfGuest: json["num_of_guest"],
        phoneNumber: json["phone_number"],
        value: json["value"].toDouble(),
        host: json["host"],
        profileName: json["profile_name"],
        propertyUnit: json["property_unit"],
        listingName: json["listing_name"],
      );

  @override
  String toString() {
    return 'BookingDetail(id: $id, checkIn: $checkIn, checkOut: $checkOut, status: $status, numOfNight: $numOfNight, numOfGuest: $numOfGuest, phoneNumber: $phoneNumber, value: $value, host: $host, profileName: $profileName, propertyUnit: $propertyUnit, listingName: $listingName)';
  }
}
