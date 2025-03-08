import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/widgets/custom_app_bar.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

class CompanySetupView extends StatefulWidget {
  const CompanySetupView({super.key});

  @override
  State<CompanySetupView> createState() => _CompanySetupViewState();
}

class _CompanySetupViewState extends State<CompanySetupView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  Set<DateTime> _selectedDates = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Company Setup"),
      body: SafeArea(
          child: Column(
        spacing: 15,
        children: [
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              spacing: 18,
              children: [
                Column(
                  spacing: 10,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.purblePrimary,
                          radius: 50,
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.grayE0,
                          child: Icon(
                            Icons.add,
                            color: AppColors.black50,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Company Logo",
                      style: AppFontStyle.medium14,
                    ),
                  ],
                ),
                CustomTextFormField(
                  hintText: "Company Name",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OnSite",
                      style: AppFontStyle.semiBold14,
                    ),
                    Switch(
                      trackColor: WidgetStatePropertyAll(AppColors.grayE0),
                      activeColor: AppColors.purblePrimary,
                      inactiveThumbColor: AppColors.black50,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.whiteWithOpacity10,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      spacing: 10,
                      children: [
                        SvgPicture.asset(AppImages.assetsImagesMapLogo),
                        Text(
                          "Open Map",
                          style: AppFontStyle.semiBold14,
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  spacing: 24,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "Start Time",
                        suffixWidget: SvgPicture.asset(
                          AppIcons.assetsIconsStartTimeIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "End Time",
                        suffixWidget: SvgPicture.asset(
                          AppIcons.assetsIconsEndTimeIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: ColoredBox(
                    color: AppColors.black50,
                    child: TableCalendar(
                      calendarFormat: _calendarFormat,
                      focusedDay: _focusedDay,
                      firstDay: DateTime.now(),
                      lastDay: DateTime.now().add(Duration(days: 30)),
                      selectedDayPredicate: (day) {
                        return _selectedDates.contains(day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          if (_selectedDates.contains(selectedDay)) {
                            _selectedDates.remove(selectedDay);
                          } else {
                            _selectedDates.add(selectedDay);
                          }
                          _focusedDay = focusedDay;
                        });
                      },
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
          CustomPushButton(
            backgroundColor: AppColors.green53,
            margin: EdgeInsets.all(16),
            child: Center(
              child: Text(
                "Save",
                style: AppFontStyle.semiBold16,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
