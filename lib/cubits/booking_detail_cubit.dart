import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bukit_vista_assessment/models/booking.dart';
import 'package:flutter_bukit_vista_assessment/services/mock_api_service.dart';

part 'booking_detail_state.dart';

class BookingDetailCubit extends Cubit<BookingDetailState> {
  BookingDetailCubit() : super(BookingDetailInitial());

  Future<void> getBookingDetail({required String id}) async {
    emit(BookingDetailInitial());

    final BookingDetail? result =
        await MockApiService().getBookingDetail(id: id);

    if (result != null) {
      emit(BookingDetailLoaded(bookingDetail: result));
    } else {
      emit(
        const BookingDetailLoadingFailed(
            message: "Booking detail guest loading failed"),
      );
    }
  }
}
