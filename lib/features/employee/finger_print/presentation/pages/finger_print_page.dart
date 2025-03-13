import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workify/features/employee/finger_print/presentation/cubit/finger_print_cubit.dart';
import 'package:workify/features/employee/finger_print/presentation/widgets/finger_print_body.dart';
import 'package:workify/shared/widgets/error_widget.dart';
import 'package:workify/shared/widgets/shimmer_loading.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FingerPrintCubit()
        ..getUserLocation()
        ..loadDayMovements(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<FingerPrintCubit, FingerPrintState>(
              buildWhen: (prev, curr) {
                return curr is GetUserLocationState;
              },
              builder: (context, state) {
                if (state is LoadingGetUserLocationState) {
                  return SizedBox(
                    height: 300,
                    child: CustomShimmerList(
                      length: 2,
                      itemHeight: 120,
                    ),
                  );
                } else if (state is FailureGetUserLocationState) {
                  return ErrorWidgetState(errMessage: state.errMessage);
                }
                return const FingerPrintBody();
              },
            ),
          ),
        ),
      ),
    );
  }
}
