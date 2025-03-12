import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/functions/image_of_map.dart';
import 'package:workify/shared/widgets/custom_cached_image.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

class ComapnyBody extends StatelessWidget {
  const ComapnyBody(
      {super.key, required this.companyModel, required this.onRefresh});
  final CompanyModel companyModel;
  final void Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              onRefresh();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 12,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.purblePrimary,
                        radius: 50,
                        child: companyModel.companyLogo != null
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                child: CustomCachedImage(
                                    width: 100,
                                    hight: 100,
                                    imagePath: companyModel.companyLogo!),
                              )
                            : null,
                      ),
                    ],
                  ),
                  Text(
                    companyModel.companyName,
                    style: AppFontStyle.semiBold16,
                    textAlign: TextAlign.center,
                  ),
                  companyModel.latLng != null
                      ? Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Work Location",
                              style: AppFontStyle.medium14,
                            ),
                            Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: AppColors.whiteWithOpacity10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: CustomCachedImage(
                                    imagePath:
                                        getImageOfMap(companyModel.latLng!))),
                          ],
                        )
                      : SvgPicture.asset(
                          AppImages.workFromHome,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          headerText: "Start Time",
                          initialValue: companyModel.startTime,
                          maxLine: 1,
                          isReadOnly: true,
                          suffixWidget: SvgPicture.asset(
                            AppIcons.assetsIconsStartTimeIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          isReadOnly: true,
                          headerText: "End Time",
                          initialValue: companyModel.endTime,
                          suffixWidget: SvgPicture.asset(
                            AppIcons.assetsIconsEndTimeIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableCalendar(
                      selectedDayPredicate: (day) {
                        return companyModel.holidayList.any((selectedDay) =>
                            selectedDay.year == day.year &&
                            selectedDay.month == day.month &&
                            selectedDay.day == day.day);
                      },
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month'
                      },
                      calendarFormat: CalendarFormat.month,
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.now(),
                      lastDay: DateTime.now()
                          .copyWith(month: DateTime.now().month + 1, day: 0))
                ],
              ),
            ),
          ),
        ),
        CustomPushButton(
          onTap: () {
            context.push(Routes.companySetupPage, extra: {
              "id": companyModel.companyId,
              "model": companyModel,
            });
          },
          margin: EdgeInsets.all(16),
          backgroundColor: AppColors.green53,
          child: Center(
            child: Text(
              "Edit",
              style: AppFontStyle.semiBold16,
            ),
          ),
        )
      ],
    );
  }
}
