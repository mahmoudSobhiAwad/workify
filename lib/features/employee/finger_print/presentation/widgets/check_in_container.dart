import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toastification/toastification.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';
import 'package:workify/features/employee/finger_print/presentation/cubit/finger_print_cubit.dart';
import 'package:workify/shared/functions/custom_toaster.dart';

class CheckInContainer extends StatelessWidget {
  const CheckInContainer({
    super.key,
    required this.movementModel,
  });

  final MovementModel? movementModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: movementModel?.checkIn == null
          ? () {
              context.read<FingerPrintCubit>().makeMovement(MovementModel(
                    checkIn: DateTime.now(),
                    fullName: movementModel?.fullName,
                    checkOut: movementModel?.checkOut,
                  ));
            }
          : () {
              CustomToast(
                context: context,
                type: ToastificationType.warning,
                header: "Check-In Failed",
                description: "You already have checked in before",
              ).showBottomToast();
            },
      child: Opacity(
        opacity: movementModel?.checkIn != null ? 0.7 : 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: AppColors.purblePrimary,
            gradient: RadialGradient(
              center: Alignment(0, -1),
              radius: 2,
              colors: [
                Color(0xff7B61FF),
                Color(0xff7B61FF).withAlpha(0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.assetsIconsCheckInFingerprint,
                width: 64,
                height: 64,
              ),
              SizedBox(height: 16),
              Text(
                'fingerprint.check_in'.tr(),
                style: AppFontStyle.bold23.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
