import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toastification/toastification.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';
import 'package:workify/features/employee/finger_print/presentation/cubit/finger_print_cubit.dart';
import 'package:workify/features/employee/finger_print/presentation/widgets/check_in_container.dart';
import 'package:workify/features/employee/finger_print/presentation/widgets/check_out_container.dart';
import 'package:workify/shared/functions/custom_toaster.dart';
import 'package:workify/shared/widgets/error_widget.dart';
import 'package:workify/shared/widgets/shimmer_loading.dart';

class FingerPrintBody extends StatefulWidget {
  const FingerPrintBody({
    super.key,
  });

  @override
  State<FingerPrintBody> createState() => _FingerPrintBodyState();
}

class _FingerPrintBodyState extends State<FingerPrintBody> {
  MovementModel? movementModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40),
        Center(
          child: Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteWithOpacity10,
            ),
            child: SvgPicture.asset(
              AppImages.assetsImagesEmployeeLog,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 16),
        BlocConsumer<FingerPrintCubit, FingerPrintState>(
          buildWhen: (prev, curr) {
            return (curr is AddMovementState || curr is GetMovementOfDay);
          },
          listenWhen: (prev, curr) {
            return (curr is AddMovementState || curr is GetMovementOfDay);
          },
          listener: (context, state) {
            if (state is SuccessGetMovementOfDay) {
              movementModel = state.model;
            } else if (state is SuccessAddMovementState) {
              movementModel = state.movementModel;
              movementModel = state.movementModel;
              String message = state.movementModel?.checkOut == null
                  ? 'fingerprint.check_in_success'.tr()
                  : 'fingerprint.check_out_success'.tr();
              CustomToast(
                      context: context,
                      header: message,
                      type: ToastificationType.success)
                  .showBottomToast();
            } else if (state is FailureAddMovementState) {
              CustomToast(
                context: context,
                header: 'fingerprint.check_in_failed'.tr(),
                description: state.errMessage,
              ).showBottomToast();
            }
          },
          builder: (context, state) {
            if (state is LoadingGetMovementOfDay ||
                state is LoadingAddMovementState) {
              return SizedBox(
                height: 180,
                child: CustomShimmerList(
                  length: 2,
                  itemHeight: 80,
                ),
              );
            } else if (state is FailureGetMovementOfDay) {
              return Flexible(
                  child: ErrorWidgetState(errMessage: state.errMessage));
            }

            return Expanded(
              child: Column(
                children: [
                  Text(
                    '${movementModel?.fullName}',
                    style: AppFontStyle.bold19,
                  ),
                  SizedBox(height: 45),
                  CheckInContainer(movementModel: movementModel),
                  SizedBox(height: 20),
                  CheckOutContainer(movementModel: movementModel),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

