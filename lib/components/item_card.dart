import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/theme/colors.dart';
import 'package:flutter_bukit_vista_assessment/theme/theme.dart';

enum ItemType { guest, book }

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.imagePath = "",
    this.onTapped,
    this.type = ItemType.guest,
    this.dateRange = "",
    this.status = "",
  }) : super(key: key);

  final String? dateRange;
  final String imagePath;
  final VoidCallback? onTapped;
  final String? status;
  final String subtitle;
  final String title;
  final ItemType? type;

  Container statusChip({required String status}) {
    late Color primaryColor, secondaryColor;
    switch (status) {
      case "Confirmed":
        primaryColor = AppColor.mainGreen;
        secondaryColor = primaryColor.withOpacity(0.3);
        break;
      case "Canceled":
        primaryColor = AppColor.mainRed;
        secondaryColor = primaryColor.withOpacity(0.2);
        break;
      default:
        primaryColor = AppColor.primary;
        secondaryColor = primaryColor.withOpacity(0.2);
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Text(
        status,
        style: AppTheme.caption.copyWith(color: primaryColor),
      ),
    );
  }

  Container _itemCard() {
    return Container(
        padding: type == ItemType.guest
            ? const EdgeInsets.all(12)
            : const EdgeInsets.only(left: 12, right: 0, top: 12, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.ink05.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Color.fromRGBO(0, 0, 0, 0.08),
            ),
          ],
        ),
        child: type == ItemType.guest ? _guestTemplate() : _bookTemplate());
  }

  Row _guestTemplate() {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: imagePath,
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: 30,
            foregroundImage: imageProvider,
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const CircleAvatar(
            radius: 30,
          ),
        ),
        const SizedBox(width: 18),
        SizedBox(
          width: 186,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTheme.h2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: AppTheme.subtitle,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Spacer(),
        if (onTapped != null)
          const Icon(
            Icons.arrow_forward_ios_sharp,
            color: AppColor.primary,
            size: 12,
          ),
      ],
    );
  }

  Column _bookTemplate() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.warning.withOpacity(0.3),
              radius: 16,
              child: const ImageIcon(
                AssetImage("assets/icons/icon_home_outlined.png"),
                color: AppColor.lightOrange,
                size: 16,
              ),
            ),
            const SizedBox(width: 9),
            Text(title, style: AppTheme.h2),
            const Spacer(),
            statusChip(status: status!),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 32 + 9),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitle,
                    style: AppTheme.subtitle.copyWith(color: AppColor.dark)),
                const SizedBox(height: 8),
                Text(dateRange!,
                    style: AppTheme.subtitle.copyWith(color: AppColor.ink03)),
              ],
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return onTapped != null
        ? InkWell(
            onTap: onTapped,
            child: _itemCard(),
          )
        : _itemCard();
  }
}
