import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/features/admin/home/presentation/widgets/movement_item.dart';
import 'package:workify/features/admin/home/presentation/widgets/quick_over_view.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: QuickOverView()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'admin_home.day_movements'.tr(),
                  style: AppFontStyle.bold19,
                ),
                Text(
                  'admin_home.see_all'.tr(),
                  style: AppFontStyle.regular14Purple,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 18)),
        SliverList.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return MovementItem(
              name: 'ahmed',
              inTime: '8:00 AM',
              outTime: '3:00 PM',
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 12,
            );
          },
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
      ],
    );
  }
}
