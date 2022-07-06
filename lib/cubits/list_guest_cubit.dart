import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bukit_vista_assessment/models/guest.dart';
import 'package:flutter_bukit_vista_assessment/services/mock_api_service.dart';

part 'list_guest_state.dart';

class ListGuestCubit extends Cubit<ListGuestState> {
  ListGuestCubit() : super(ListGuestInitial());

  Future<void> getListGuest() async {
    emit(ListGuestInitial());

    final List<Guest> result = await MockApiService().getListGuest();

    if (result.isNotEmpty) {
      emit(ListGuestLoaded(listguest: result));
    } else {
      emit(
        const ListGuestLoadingFailed(message: "List guest loading failed"),
      );
    }
  }
}
