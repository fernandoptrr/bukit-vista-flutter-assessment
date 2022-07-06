import 'package:flutter_bukit_vista_assessment/models/booking.dart';

class Guest {
  Guest({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.location,
    required this.email,
    required this.phoneNumber,
    required this.guestSince,
    required this.bookings,
  });

  final String id;
  final String name;
  final String avatarUrl;
  final String location;
  final String email;
  final String phoneNumber;
  final DateTime guestSince;
  final List<Booking>? bookings;

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        id: json["id"],
        name: json["name"],
        avatarUrl: json["avatar_url"],
        location: json["location"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        guestSince: DateTime.parse(json["guest_since"]),
        bookings: json["bookings"] == null
            ? null
            : List<Booking>.from(
                json["bookings"].map((x) => Booking.fromJson(x))),
      );

  @override
  String toString() {
    return 'Guest(id: $id, name: $name, avatarUrl: $avatarUrl, location: $location, email: $email, phoneNumber: $phoneNumber, guestSince: $guestSince, bookings: $bookings)';
  }
}
