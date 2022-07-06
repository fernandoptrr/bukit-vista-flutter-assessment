part of 'list_guest_cubit.dart';

abstract class ListGuestState extends Equatable {
  const ListGuestState();

  @override
  List<Object> get props => [];
}

class ListGuestInitial extends ListGuestState {}

class ListGuestLoaded extends ListGuestState {
  final List<Guest> listguest;

  const ListGuestLoaded({
    required this.listguest,
  });

  @override
  List<Object> get props => [listguest];

  @override
  String toString() => 'ListGuestLoaded(listguest: $listguest)';
}

class ListGuestLoadingFailed extends ListGuestState {
  final String message;

  const ListGuestLoadingFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'ListGuestLoadingFailed(message: $message)';
}
