import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/admin/users/data/models/notification_model.dart';
import 'package:workify/features/admin/users/presentation/cubit/employee_cubit.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/functions/custom_pop_menu.dart';
import 'package:workify/shared/functions/custom_toaster.dart';
import 'package:workify/shared/widgets/custom_app_bar.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({super.key, required this.cubit});
  final EmployeeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Create User",
        ),
        body: SafeArea(child: UpdateUserBody()),
      ),
    );
  }
}

class UpdateUserBody extends StatefulWidget {
  const UpdateUserBody({
    super.key,
  });

  @override
  State<UpdateUserBody> createState() => _UpdateUserBodyState();
}

class _UpdateUserBodyState extends State<UpdateUserBody> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController jobTitleController;
  late TextEditingController jobLevelController;
  late TextEditingController numOfHolidayController;
  late TextEditingController salaryController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    jobLevelController = TextEditingController();
    jobTitleController = TextEditingController();
    numOfHolidayController = TextEditingController();
    salaryController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    jobLevelController.dispose();
    jobTitleController.dispose();
    numOfHolidayController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Text(
                    "Account",
                    style: AppFontStyle.bold22,
                  ),
                  CustomTextFormField(
                    controller: userNameController,
                    hintText: "User Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "User Name Can't be Empty";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password Can't be Empty";
                      }
                      return null;
                    },
                    controller: passwordController,
                    // suffixWidget: IconButton(
                    //     onPressed: null,
                    //     icon: SvgPicture.asset(AppIcons.assetsIconsEyeClosed)),
                  ),
                  Text(
                    "Personal Info",
                    style: AppFontStyle.bold22,
                  ),
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: firstNameController,
                          hintText: "First Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "First Name Can't be Empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: lastNameController,
                          hintText: "Last Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Last Name Can't be Empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    hintText: "Address",
                    controller: addressController,
                  ),
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Email",
                          controller: emailController,
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Phone",
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Phone Can't be Empty";
                            }
                            return null;
                          },
                          controller: phoneController,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Job Info",
                    style: AppFontStyle.bold22,
                  ),
                  CustomTextFormField(
                    hintText: "Job Title",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Job Title Can't be Empty";
                      }
                      return null;
                    },
                    controller: jobTitleController,
                  ),
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Salary",
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Salary Can't be Empty";
                            }
                            return null;
                          },
                          controller: salaryController,
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          isReadOnly: true,
                          onTap: () {
                            showPopupMenu(context, items: [
                              'Fresh',
                              "Junior",
                              "Mid Level",
                              "Senior",
                              "Team Lead",
                            ]).then((value) {
                              if (value != null) {
                                jobLevelController.text = value;
                              }
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "job level Can't be Empty";
                            }
                            return null;
                          },
                          controller: jobLevelController,
                          hintText: "Level",
                          suffixWidget: IconButton(
                              onPressed: null,
                              icon: SvgPicture.asset(
                                  AppIcons.assetsIconsArrowDownIcon)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<EmployeeCubit, EmployeeState>(
            buildWhen: (prev, curr) {
              return curr is UpdateEmployeeStates;
            },
            builder: (context, state) {
              return CustomPushButton(
                isLoading: state is LoadingUpdateEmployeeStates,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<EmployeeCubit>().createNewUser(EmployeeModel(
                        userName: userNameController.text,
                        password: passwordController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        jobTitle: jobTitleController.text,
                        phone: phoneController.text,
                        address: addressController.text,
                        email: emailController.text,
                        jobLevel: jobLevelController.text,
                        numOfHolidays:
                            int.tryParse(numOfHolidayController.text),
                        salary: double.parse(salaryController.text)));
                  }
                },
                margin: EdgeInsets.all(16),
                backgroundColor: AppColors.green53,
                child: Center(
                  child: Text(
                    "Save",
                    style: AppFontStyle.semiBold16,
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state is SuccessUpdateEmployeeStates) {
                CustomToast(
                        context: context,
                        header: "Employee created Successfully",
                        type: ToastificationType.success)
                    .showBottomToast();
                Future.delayed(Duration(seconds: 1), () {
                  if (context.mounted) {
                    context.pop(true);
                  }
                });
              } else if (state is FailureUpdateEmployeeStates) {
                CustomToast(
                  context: context,
                  header: state.errMessage,
                ).showBottomToast();
              }
            },
          ),
        ],
      ),
    );
  }
}
