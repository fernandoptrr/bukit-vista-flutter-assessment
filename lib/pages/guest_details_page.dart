import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bukit_vista_assessment/components/app_bar.dart';
import 'package:flutter_bukit_vista_assessment/components/item_card.dart';
import 'package:flutter_bukit_vista_assessment/components/shimmer_loading.dart';
import 'package:flutter_bukit_vista_assessment/components/text_field.dart';
import 'package:flutter_bukit_vista_assessment/cubits/booking_detail_cubit.dart';
import 'package:flutter_bukit_vista_assessment/models/booking.dart';
import 'package:flutter_bukit_vista_assessment/models/guest.dart';
import 'package:flutter_bukit_vista_assessment/theme/colors.dart';
import 'package:flutter_bukit_vista_assessment/theme/theme.dart';
import 'package:intl/intl.dart';

class GuestDetails extends StatelessWidget {
  const GuestDetails({Key? key}) : super(key: key);

  static const nameRoute = '/guest-detail';

  Column _tabPersonas() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/undraw.png",
          height: 150,
        ),
        const SizedBox(height: 8),
        const Text(
          "No Data Available",
          style: AppTheme.h3,
        ),
      ],
    );
  }

  Widget _tabBookings({required Guest guest}) {
    return (guest.bookings!.isNotEmpty)
        ? ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: guest.bookings!.length,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 26),
            itemBuilder: (context, index) {
              Booking booking = guest.bookings![index];
              return CustomItemCard(
                title: booking.id,
                subtitle: booking.placeName,
                type: ItemType.book,
                status: booking.status,
                dateRange:
                    "${DateFormat('d MMM y').format(booking.startDate)} - ${DateFormat('d MMM y').format(booking.startDate)}",
                onTapped: () {
                  context
                      .read<BookingDetailCubit>()
                      .getBookingDetail(id: booking.id);
                  _showDetailBooking(context, booking);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/undraw.png",
                height: 150,
              ),
              const SizedBox(height: 8),
              const Text(
                "No Data Available",
                style: AppTheme.h3,
              ),
            ],
          );
  }

  ListView _tabOverview(Map<String, String> fieldContents) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: fieldContents.length,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
      itemBuilder: (context, index) {
        final key = fieldContents.keys.elementAt(index);
        return CustomTextField(
          label: key,
          body: fieldContents[key]!,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 18);
      },
    );
  }

  Future<void> _showDetailBooking(BuildContext context, Booking booking) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: BlocBuilder<BookingDetailCubit, BookingDetailState>(
            builder: (context, state) {
              if (state is BookingDetailInitial) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShimmerLoading(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                  ],
                );
              } else if (state is BookingDetailLoaded) {
                booking = booking.copyWith(detail: state.bookingDetail);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFA7ACB6),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _firstRow(booking),
                    const SizedBox(height: 29),
                    _secondRow(booking),
                    const SizedBox(height: 13),
                    _thirdRow(booking),
                    const SizedBox(height: 13),
                    CustomTextField(
                      label: "Phone number",
                      body: booking.detail!.phoneNumber,
                      bodyTextStyle:
                          AppTheme.body.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 37),
                    Text("Hosting Details",
                        style: AppTheme.h3.copyWith(color: AppColor.ink01)),
                    const SizedBox(height: 34),
                    CustomTextField(
                      label: "Host",
                      body: booking.detail!.host,
                    ),
                    const SizedBox(height: 18),
                    CustomTextField(
                      label: "Profile name",
                      body: booking.detail!.profileName,
                    ),
                    const SizedBox(height: 18),
                    CustomTextField(
                      label: "Property Unit",
                      body: booking.detail!.propertyUnit,
                    ),
                    const SizedBox(height: 18),
                    CustomTextField(
                      label: "Listing name",
                      body: booking.detail!.listingName,
                      bodyTextStyle: AppTheme.body.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.mainOrange),
                    ),
                    const SizedBox(height: 18),
                  ],
                );
              } else {
                if (state is BookingDetailLoadingFailed) {
                  debugPrint(state.toString());
                }
                return const SizedBox();
              }
            },
          ),
        );
      },
    );
  }

  Row _thirdRow(Booking booking) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextField(
          label: "Number of guest",
          body: booking.detail!.numOfGuest.toString(),
        ),
        CustomTextField(
          label: "Booking value",
          body: "\$ ${booking.detail!.value}",
          alignment: CrossAxisAlignment.end,
        ),
      ],
    );
  }

  Row _secondRow(Booking booking) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextField(
          label: "Booking ID",
          body: booking.detail!.id,
        ),
        CustomTextField(
          label: "Booking status",
          body: booking.detail!.status,
          alignment: CrossAxisAlignment.end,
        ),
      ],
    );
  }

  Row _firstRow(Booking booking) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Check in", style: AppTheme.subtitle),
            const SizedBox(height: 4),
            Text(DateFormat('HH:mm').format(booking.detail!.checkIn),
                style: AppTheme.h3.copyWith(color: AppColor.ink01)),
            const SizedBox(height: 4),
            Text(DateFormat('MMM d, y').format(booking.detail!.checkIn),
                style: AppTheme.body),
          ],
        ),
        Column(
          children: [
            const ImageIcon(
              AssetImage("assets/icons/icon_weather_night.png"),
              color: AppColor.ink02,
            ),
            const SizedBox(height: 3),
            Text(
              "${booking.detail!.numOfNight} Nights",
              style: AppTheme.body.copyWith(color: AppColor.mainBlue),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("Check in", style: AppTheme.subtitle),
            const SizedBox(height: 4),
            Text(DateFormat('HH:mm').format(booking.detail!.checkOut),
                style: AppTheme.h3.copyWith(color: AppColor.ink01)),
            const SizedBox(height: 4),
            Text(DateFormat('MMM d, y').format(booking.detail!.checkOut),
                style: AppTheme.body),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final guest = ModalRoute.of(context)!.settings.arguments as Guest;

    final Map<String, String> fieldContents = {
      "Email": guest.email,
      "Phone Number": guest.phoneNumber,
      "Guest Origin": guest.location,
    };

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(title: "Guest Details"),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: CustomItemCard(
                    title: guest.name,
                    subtitle:
                        "Guest since ${DateFormat('MMM yy').format(guest.guestSince)}",
                    imagePath: guest.avatarUrl),
              ),
              const SizedBox(height: 10),
              const TabBar(
                labelColor: AppColor.primary,
                unselectedLabelColor: AppColor.ink04,
                labelStyle: AppTheme.h3,
                tabs: [
                  Tab(text: "Overview"),
                  Tab(text: "Bookings"),
                  Tab(text: "Personas"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _tabOverview(fieldContents),
                    _tabBookings(guest: guest),
                    _tabPersonas()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
