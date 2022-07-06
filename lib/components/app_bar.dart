import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/components/back_button.dart';
import 'package:flutter_bukit_vista_assessment/theme/colors.dart';
import 'package:flutter_bukit_vista_assessment/theme/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool showSearchBar;
  final bool showBackButton;

  CustomAppBar({
    Key? key,
    required this.title,
    this.showSearchBar = false,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
          style: AppTheme.appBar,
        ),
        centerTitle: true,
        backgroundColor: AppColor.primary,
        toolbarHeight: 56,
        leading: showBackButton ? const CustomBackButton() : null,
        bottom: showSearchBar
            ? PreferredSize(
                preferredSize: const Size.fromHeight(146),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 33.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 273,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(7),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const ImageIcon(
                                AssetImage("assets/icons/icon_search.png"),
                                color: AppColor.ink02,
                              ),
                              hintText: "Search your guest name",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintStyle: AppTheme.subtitle
                                  .copyWith(fontWeight: FontWeight.w700)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => debugPrint("Filter button pressed"),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.warning,
                              borderRadius: BorderRadius.circular(8)),
                          width: 40,
                          height: 40,
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.filter_list_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : null);
  }

  double _setAppBarHeight() => showSearchBar ? 146 : 56;

  @override
  Size get preferredSize => Size.fromHeight(_setAppBarHeight());
}
