import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bukit_vista_assessment/models/booking.dart';
import 'package:flutter_bukit_vista_assessment/models/guest.dart';

class MockApiService {
  Future<List<Guest>> getListGuest() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 500));
    // Load json from file system
    final response = await rootBundle.loadString('assets/json/list_guest.json');
    // decode the json
    final data = jsonDecode(response);
    if (data['guests'] != null) {
      final List<Guest> listguest =
          List<Guest>.from(data["guests"].map((x) => Guest.fromJson(x)));
      return listguest;
    } else {
      return [];
    }
  }

  Future<BookingDetail?> getBookingDetail({required String id}) async {
    String jsonPath = "";
    switch (id) {
      case "HMASJKSSCL":
        jsonPath = 'assets/json/hmasjksscl_booking_detail.json';
        break;
      case "HDOLANCSPP":
        jsonPath = 'assets/json/hdolancspp_booking_detail.json';
        break;
      case "HKADJKSLDR":
        jsonPath = 'assets/json/hkadjksldr_booking_detail.json';
        break;
      case "LAMXJDSISA":
        jsonPath = 'assets/json/lamxjdsisa_booking_detail.json';
        break;
      case "PAXLAPFLSS":
        jsonPath = 'assets/json/paxlapflss_booking_detail.json';
        break;
      default:
        return null;
    }
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 500));
    // Load json from file system
    final response = await rootBundle.loadString(jsonPath);
    // decode the json
    final data = jsonDecode(response);
    if (data['data'] != null) {
      final BookingDetail bookingDetail = BookingDetail.fromJson(data['data']);
      return bookingDetail;
    } else {
      return null;
    }
  }
}
