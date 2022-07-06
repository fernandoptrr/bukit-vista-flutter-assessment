import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/components/app_bar.dart';
import 'package:flutter_bukit_vista_assessment/components/item_card.dart';
import 'package:flutter_bukit_vista_assessment/components/text_field.dart';
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
          style: AppTheme.tabBar,
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
                onTapped: () {},
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
                style: AppTheme.tabBar,
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
          lable: key,
          body: fieldContents[key]!,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 18);
      },
    );
  }

  Row _thirdRow(Booking booking) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextField(
          lable: "Number of guest",
          body: booking.detail!.numOfGuest.toString(),
        ),
        CustomTextField(
          lable: "Booking value",
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
          lable: "Booking ID",
          body: booking.detail!.id,
        ),
        CustomTextField(
          lable: "Booking status",
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
                style: AppTheme.tabBar),
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
            Text("${booking.detail!.numOfNight} Nights")
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("Check in", style: AppTheme.subtitle),
            const SizedBox(height: 4),
            Text(DateFormat('HH:mm').format(booking.detail!.checkOut),
                style: AppTheme.tabBar),
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
                labelStyle: AppTheme.tabBar,
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
