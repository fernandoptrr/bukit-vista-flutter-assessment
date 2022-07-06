part of 'booking_detail_cubit.dart';

abstract class BookingDetailState extends Equatable {
  const BookingDetailState();

  @override
  List<Object> get props => [];
}

class BookingDetailInitial extends BookingDetailState {}

class BookingDetailLoaded extends BookingDetailState {
  final BookingDetail bookingDetail;

  const BookingDetailLoaded({
    required this.bookingDetail,
  });

  @override
  List<Object> get props => [bookingDetail];

  @override
  String toString() => 'BookingDetailLoaded(bookingDetail: $bookingDetail)';
}

class BookingDetailLoadingFailed extends BookingDetailState {
  final String message;

  const BookingDetailLoadingFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'BookingDetailLoadingFailed(message: $message)';
}
