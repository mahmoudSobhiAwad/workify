import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/shared/features/basic_preview/data/models/bottom_nav_bar_model.dart';

class BasicPreview extends StatefulWidget {
  const BasicPreview(
      {super.key,
      required this.pages,
      required this.bottomNavBarIconsList,
      this.initialIndex = 0});
  final List<Widget> pages;
  final List<BottomNavBarModel> bottomNavBarIconsList;
  final int initialIndex;

  @override
  State<BasicPreview> createState() => _BasicPreviewState();
}

class _BasicPreviewState extends State<BasicPreview> {
  late int _selectedIndex;
  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.87,
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return widget.pages[_selectedIndex];
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      blurRadius: 24,
                      color: AppColors.purblePrimary.withValues(alpha: 0.24),
                    ),
                    BoxShadow(
                      blurStyle: BlurStyle.outer,
                      offset: Offset(0, 4),
                      blurRadius: 12,
                      color: AppColors.blackWithOpacity5,
                    ),
                  ],
                  color: AppColors.black50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(widget.bottomNavBarIconsList.length,
                      (index) {
                    return InkWell(
                      onTap: () {
                        _selectedIndex = index;
                        setState(() {});
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(_selectedIndex == index
                              ? widget
                                  .bottomNavBarIconsList[index].activeItemPath
                              : widget.bottomNavBarIconsList[index]
                                  .nonActiveItemPath),
                          if (_selectedIndex == index)
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              height: 6,
                              width: 35,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(stops: [
                                0,
                                1
                              ], colors: const [
                                Color(0xffC564FD),
                                Color(0xff5315B2),
                              ])),
                            ),
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
