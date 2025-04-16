import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:workify/core/constants/enums.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/features/admin/company/presentation/cubit/company_setup_cubit/company_setup_cubit.dart';
import 'package:workify/features/admin/company/presentation/widgets/start_end_time.dart';
import 'package:workify/features/admin/company/presentation/widgets/update_button.dart';
import 'package:workify/shared/functions/image_of_map.dart';
import 'package:workify/shared/models/image_model.dart';
import 'package:workify/shared/widgets/custom_cached_image.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';
import 'package:workify/shared/widgets/edit_image_dialog.dart';
import 'package:workify/shared/widgets/image_picker_dialog.dart';
import 'package:easy_localization/easy_localization.dart';

class CompanySetupBody extends StatefulWidget {
  const CompanySetupBody({
    super.key,
    this.companyModel,
  });
  final CompanyModel? companyModel;

  @override
  State<CompanySetupBody> createState() => _CompanySetupBodyState();
}

class _CompanySetupBodyState extends State<CompanySetupBody> {
  bool isCompanyOnSite = true;
  late TextEditingController companyName;
  late TextEditingController startTime;
  late TextEditingController endTime;
  LatLng? location;
  String? imageMapPath;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<DateTime> holidayList = [];
  ImageTypeModel? imageTypeModel;

  @override
  void initState() {
    companyName = TextEditingController(text: widget.companyModel?.companyName);
    endTime = TextEditingController(text: widget.companyModel?.endTime);
    startTime = TextEditingController(text: widget.companyModel?.startTime);
    location = widget.companyModel?.latLng;
    imageMapPath = location != null ? getImageOfMap(location!) : null;
    isCompanyOnSite = location != null;
    imageTypeModel = widget.companyModel?.companyLogo != null
        ? ImageTypeModel(
            imagePath: widget.companyModel!.companyLogo!,
            imageTypeEnum: ImageTypeEnum.network)
        : null;
    holidayList.addAll(widget.companyModel?.holidayList ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 15,
        children: [
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 18,
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        InkWell(
                          onTap: () {
                            if (imageTypeModel != null) {
                              removeOrEditImagePickerDialog(context)
                                  .then((value) {
                                if (value != null && context.mounted) {
                                  switch (value) {
                                    case ImageActions.remove:
                                      context
                                          .read<CompanySetupCubit>()
                                          .deletePickedImage();
                                    case ImageActions.change:
                                      showImagePickerDialog(context)
                                          .then((value) {
                                        if (value != null && context.mounted) {
                                          context
                                              .read<CompanySetupCubit>()
                                              .pickImage(value);
                                        }
                                      });
                                  }
                                }
                              });
                            } else {
                              showImagePickerDialog(context).then((value) {
                                if (value != null && context.mounted) {
                                  context
                                      .read<CompanySetupCubit>()
                                      .pickImage(value);
                                }
                              });
                            }
                          },
                          child:
                              BlocBuilder<CompanySetupCubit, CompanySetupState>(
                            buildWhen: (prev, curr) {
                              return curr is ChangePickedImageState;
                            },
                            builder: (context, state) {
                              if (state is ChangePickedImageState) {
                                imageTypeModel = state.imageTypeModel;
                              }
                              return Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.purblePrimary,
                                    radius: 50,
                                    child: imageTypeModel != null
                                        ? ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50)),
                                            child: imageTypeModel!
                                                        .imageTypeEnum ==
                                                    ImageTypeEnum.network
                                                ? CustomCachedImage(
                                                    width: 100,
                                                    hight: 100,
                                                    imagePath: imageTypeModel!
                                                        .imagePath)
                                                : Image.file(
                                                    width: 100,
                                                    height: 100,
                                                    File(
                                                      imageTypeModel!.imagePath,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                          )
                                        : null,
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.grayE0,
                                    child: Icon(
                                      imageTypeModel != null
                                          ? Icons.edit
                                          : Icons.add,
                                      color: AppColors.black50,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Text(
                          "company_logo".tr(),
                          style: AppFontStyle.medium14,
                        ),
                      ],
                    ),
                    CustomTextFormField(
                      maxLine: 1,
                      controller: companyName,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "company_name_cant_be_empty".tr();
                        }
                        return null;
                      },
                      hintText: "company_name".tr(),
                    ),
                    BlocBuilder<CompanySetupCubit, CompanySetupState>(
                      buildWhen: (prev, curr) {
                        return curr is ChangeCompanyWorkPositionState;
                      },
                      builder: (context, state) {
                        if (state is ChangeCompanyWorkPositionState) {
                          isCompanyOnSite = state.value;
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "onsite".tr(),
                                  style: AppFontStyle.semiBold14,
                                ),
                                Switch(
                                  trackColor:
                                      WidgetStatePropertyAll(AppColors.grayE0),
                                  activeColor: AppColors.purblePrimary,
                                  inactiveThumbColor: AppColors.black50,
                                  value: isCompanyOnSite,
                                  onChanged: (value) {
                                    context
                                        .read<CompanySetupCubit>()
                                        .changeCompanyPosition(isCompanyOnSite);
                                  },
                                ),
                              ],
                            ),
                            if (isCompanyOnSite)
                              InkWell(
                                onTap: () async {
                                  await context
                                      .push(Routes.mapView, extra: location)
                                      .then((value) {
                                    if (value != null &&
                                        value is LatLng &&
                                        context.mounted) {
                                      context
                                          .read<CompanySetupCubit>()
                                          .changePickedLocation(value);
                                    }
                                  });
                                },
                                child: BlocBuilder<CompanySetupCubit,
                                    CompanySetupState>(
                                  buildWhen: (prev, curr) {
                                    return curr is ChangeCompanyLocationState;
                                  },
                                  builder: (context, state) {
                                    if (state is ChangeCompanyLocationState) {
                                      location = state.latLng;
                                      imageMapPath = state.imageMap;
                                    }
                                    return Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteWithOpacity10,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: imageMapPath != null
                                          ? Image.network(
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child; // Image is loaded
                                                }
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ); // Show loading indicator
                                              },
                                              imageMapPath!,
                                            )
                                          : Center(
                                              child: Column(
                                                spacing: 10,
                                                children: [
                                                  SvgPicture.asset(AppImages
                                                      .assetsImagesMapLogo),
                                                  Text(
                                                    "open_map".tr(),
                                                    style:
                                                        AppFontStyle.semiBold14,
                                                  )
                                                ],
                                              ),
                                            ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "day_time_duration".tr(),
                        style: AppFontStyle.medium14,
                      ),
                    ),
                    StartAndEndTimesPicker(
                        startTime: startTime, endTime: endTime),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "holiday_days".tr(),
                        style: AppFontStyle.medium14,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: ColoredBox(
                        color: AppColors.black50,
                        child:
                            BlocBuilder<CompanySetupCubit, CompanySetupState>(
                          buildWhen: (prev, curr) {
                            return curr is ChangeSelectedDayState;
                          },
                          builder: (context, state) {
                            return TableCalendar(
                              selectedDayPredicate: (day) {
                                final normalizedDay =
                                    DateTime.utc(day.year, day.month, day.day);
                                return holidayList.any((selectedDay) =>
                                    selectedDay.year == normalizedDay.year &&
                                    selectedDay.month == normalizedDay.month &&
                                    selectedDay.day == normalizedDay.day);
                              },
                              onDaySelected: (selectedDay, focusedDay) {
                                addOrRemoveDate(selectedDay);
                              },
                              availableCalendarFormats: {
                                CalendarFormat.month: 'Month'
                              },
                              calendarFormat: CalendarFormat.month,
                              focusedDay: DateTime.now(),
                              firstDay: DateTime.now(),
                              lastDay: DateTime.now().copyWith(
                                  month: DateTime.now().month + 1, day: 0),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomUpdateButton(
            isCompanyOnSite: isCompanyOnSite,
            formKey: formKey,
            location: location,
            imageTypeModel: imageTypeModel,
            companyName: companyName,
            startTime: startTime,
            endTime: endTime,
            holidayList: holidayList,
            isEdit: widget.companyModel != null,
          ),
        ],
      ),
    );
  }

  void addOrRemoveDate(DateTime date) {
    final normalizedDate = DateTime.utc(date.year, date.month, date.day);
    final isSelected = holidayList.any((day) =>
        day.year == normalizedDate.year &&
        day.month == normalizedDate.month &&
        day.day == normalizedDate.day);

    if (isSelected) {
      holidayList.removeWhere((day) =>
          day.year == normalizedDate.year &&
          day.month == normalizedDate.month &&
          day.day == normalizedDate.day);
    } else {
      holidayList.add(normalizedDate);
    }

    context.read<CompanySetupCubit>().changeSelectedDay();
  }
}
