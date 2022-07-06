import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bukit_vista_assessment/components/app_bar.dart';
import 'package:flutter_bukit_vista_assessment/components/item_card.dart';
import 'package:flutter_bukit_vista_assessment/components/shimmer_loading.dart';
import 'package:flutter_bukit_vista_assessment/cubits/list_guest_cubit.dart';
import 'package:flutter_bukit_vista_assessment/pages/guest_details_page.dart';
import 'package:flutter_bukit_vista_assessment/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const nameRoute = '/home';

  @override
  Widget build(BuildContext context) {
    context.read<ListGuestCubit>().getListGuest();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Guest List",
        showBackButton: false,
        showSearchBar: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await context.read<ListGuestCubit>().getListGuest();
          },
          child: BlocBuilder<ListGuestCubit, ListGuestState>(
            builder: (context, state) {
              if (state is ListGuestInitial) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 7,
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 26),
                  itemBuilder: (context, index) {
                    return ShimmerLoading(
                      child: Container(
                        height: 82,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 9);
                  },
                );
              } else if (state is ListGuestLoaded) {
                final guests = state.listguest;
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: guests.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 26),
                  itemBuilder: (context, index) {
                    final guest = guests[index];
                    return CustomItemCard(
                      title: guest.name,
                      subtitle: guest.location,
                      imagePath: guest.avatarUrl,
                      onTapped: () {
                        Navigator.pushNamed(context, GuestDetails.nameRoute,
                            arguments: guest);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 9);
                  },
                );
              } else {
                if (state is ListGuestLoadingFailed) {
                  debugPrint(state.toString());
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/undraw.png",
                      height: 150,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Something Went Wrong",
                      style: AppTheme.h3,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
