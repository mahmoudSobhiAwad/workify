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
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/features/admin/company/presentation/cubit/company_setup_cubit/company_setup_cubit.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/functions/custom_toaster.dart';
import 'package:workify/shared/models/image_model.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';
import 'package:workify/shared/widgets/edit_image_dialog.dart';
import 'package:workify/shared/widgets/image_picker_dialog.dart';
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
    companyName = TextEditingController();
    endTime = TextEditingController();
    startTime = TextEditingController();
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          removeOrEditImagePickerDialog(context).then((value) {
                            if (value != null && context.mounted) {
                              switch (value) {
                                case ImageActions.remove:
                                  context
                                      .read<CompanySetupCubit>()
                                      .deletePickedImage();

                                case ImageActions.change:
                                  showImagePickerDialog(context).then((value) {
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
                      child: BlocBuilder<CompanySetupCubit, CompanySetupState>(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        child: Image.file(
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
                      "Company Logo",
                      style: AppFontStyle.medium14,
                    ),
                  ],
                ),
                CustomTextFormField(
                  maxLine: 1,
                  controller: companyName,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Company Name can't be Empty";
                    }
                    return null;
                  },
                  hintText: "Company Name",
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
                              "OnSite",
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
                              await context.push(Routes.mapView).then((value) {
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
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteWithOpacity10,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: imageMapPath != null
                                      ? Image.network(
                                          imageMapPath!,
                                        )
                                      : Center(
                                          child: Column(
                                            spacing: 10,
                                            children: [
                                              SvgPicture.asset(AppImages
                                                  .assetsImagesMapLogo),
                                              Text(
                                                "Open Map",
                                                style: AppFontStyle.semiBold14,
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
                Row(
                  spacing: 24,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: startTime,
                        maxLine: 1,
                        isReadOnly: true,
                        onTap: () async {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 8, minute: 0))
                              .then((value) {
                            if (value != null && context.mounted) {
                              startTime.text = value.format(context);
                            }
                          });
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Specify Start Time";
                          }
                          return null;
                        },
                        hintText: "Start Time",
                        suffixWidget: SvgPicture.asset(
                          AppIcons.assetsIconsStartTimeIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller: endTime,
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 16, minute: 0))
                              .then((value) {
                            if (value != null && context.mounted) {
                              endTime.text = value.format(context);
                            }
                          });
                        },
                        isReadOnly: true,
                        hintText: "End Time",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Specify End Time";
                          }
                          return null;
                        },
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
                    child: BlocBuilder<CompanySetupCubit, CompanySetupState>(
                      buildWhen: (prev, curr) {
                        return curr is ChangeSelectedDayState;
                      },
                      builder: (context, state) {
                        return TableCalendar(
                            onDaySelected: (selectedDay, focusedDay) {
                              if (holidayList.contains(selectedDay)) {
                                holidayList.remove(selectedDay);
                              } else {
                                holidayList.add(selectedDay);
                              }
                              context
                                  .read<CompanySetupCubit>()
                                  .changeSelectedDay();
                            },
                            selectedDayPredicate: (day) =>
                                holidayList.contains(day),
                            availableCalendarFormats: const {
                              CalendarFormat.month: 'Month'
                            },
                            calendarFormat: CalendarFormat.month,
                            focusedDay: DateTime.now(),
                            firstDay: DateTime.now(),
                            lastDay: DateTime.now().copyWith(
                                month: DateTime.now().month + 1, day: 0));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        BlocBuilder<CompanySetupCubit, CompanySetupState>(
          buildWhen: (prev, curr) {
            return curr is UpdateCompanyStates;
          },
          builder: (context, state) {
            return CustomPushButton(
              isLoading: state is LoadingUpdateCompanyStates,
              onTap: () {
                if (isCompanyOnSite) {
                  if (formKey.currentState!.validate()) {
                    if (location != null) {
                      context.read<CompanySetupCubit>().createCompany(
                          CompanyModel(
                              latLng: location,
                              companyLogo: imageTypeModel?.imagePath,
                              companyName: companyName.text,
                              companyId:
                                  context.read<CompanySetupCubit>().companyId,
                              startTime: startTime.text,
                              endTime: endTime.text,
                              holidayList: holidayList));
                    } else {
                      CustomToast(
                              context: context, header: "Location is Missing")
                          .showBottomToast();
                    }
                  }
                } else {
                  if (formKey.currentState!.validate()) {}
                }
              },
              backgroundColor: AppColors.green53,
              margin: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  "Save",
                  style: AppFontStyle.semiBold16,
                ),
              ),
            );
          },
        ),
      ],
    ));
  }
}
