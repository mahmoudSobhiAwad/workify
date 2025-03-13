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

class CheckOutContainer extends StatelessWidget {
  const CheckOutContainer({
    super.key,
    required this.movementModel,
  });

  final MovementModel? movementModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (movementModel?.checkOut == null && movementModel?.checkIn != null)
          ? () {
              context.read<FingerPrintCubit>().makeMovement(MovementModel(
                    checkOut: DateTime.now(),
                    fullName: movementModel?.fullName,
                    checkIn: movementModel?.checkIn,
                  ));
            }
          : () {
              CustomToast(
                context: context,
                type: ToastificationType.warning,
                header: "Check-Out Failed",
                description: "You already have checked Out before",
              ).showBottomToast();
            },
      child: Opacity(
        opacity:
            (movementModel?.checkIn == null || movementModel?.checkOut != null)
                ? 0.7
                : 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: AppColors.black30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.assetsIconsCheckOutFingerprint,
                width: 64,
                height: 64,
              ),
              SizedBox(height: 16),
              Text(
                'Check Out',
                style: AppFontStyle.bold23.copyWith(color: Colors.white),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
