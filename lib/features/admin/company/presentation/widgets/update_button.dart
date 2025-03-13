import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/features/admin/company/presentation/cubit/company_setup_cubit/company_setup_cubit.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/functions/custom_toaster.dart';
import 'package:workify/shared/models/image_model.dart';


class CustomUpdateButton extends StatelessWidget {
  const CustomUpdateButton({
    super.key,
    required this.isCompanyOnSite,
    required this.formKey,
    required this.location,
    required this.imageTypeModel,
    required this.companyName,
    required this.startTime,
    required this.endTime,
    required this.holidayList,
    required this.isEdit,
  });

  final bool isCompanyOnSite;
  final GlobalKey<FormState> formKey;
  final LatLng? location;
  final ImageTypeModel? imageTypeModel;
  final TextEditingController companyName;
  final TextEditingController startTime;
  final TextEditingController endTime;
  final List<DateTime> holidayList;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanySetupCubit, CompanySetupState>(
     
      listener: (context, state) {
        if (state is SuccessUpdateCompanyStates) {
          CustomToast(
                  context: context,
                  header: "Company is Setup Successfully !",
                  type: ToastificationType.success)
              .showBottomToast();
          Future.delayed(Duration(seconds: 1), () {
            if (context.mounted) {
              context.pop(true);
            }
          });
        } else if (state is FailureUpdateCompanyStates) {
          CustomToast(context: context, header: state.errMessage)
              .showBottomToast();
        }
      },
      builder: (context, state) {
        return CustomPushButton(
          isLoading: state is LoadingUpdateCompanyStates,
          onTap: () {
            if (isCompanyOnSite) {
              if (formKey.currentState!.validate()) {
                if (location != null) {
                  CompanyModel model = CompanyModel(
                      latLng: location,
                      companyLogo: imageTypeModel?.imagePath,
                      companyName: companyName.text,
                      companyId: context.read<CompanySetupCubit>().companyId,
                      startTime: startTime.text,
                      endTime: endTime.text,
                      holidayList: holidayList);
                  if (isEdit) {
                    context.read<CompanySetupCubit>().updateCompnay(
                        model: model,
                        imageTypeEnum: imageTypeModel?.imageTypeEnum);
                  } else {
                    context.read<CompanySetupCubit>().createCompany(model);
                  }
                } else {
                  CustomToast(context: context, header: "Location is Missing")
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
    );
  }
}

