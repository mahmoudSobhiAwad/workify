import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/features/admin/home/presentation/cubit/home_cubit.dart';
import 'package:workify/features/admin/home/presentation/widgets/movement_item.dart';
import 'package:workify/features/admin/home/presentation/widgets/quick_over_view.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';
import 'package:workify/shared/widgets/empty_widget.dart';
import 'package:workify/shared/widgets/error_widget.dart';
import 'package:workify/shared/widgets/shimmer_loading.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getMovements(DateTime.now()),
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<HomeCubit>().getMovements(DateTime.now());
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: QuickOverView(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'admin_home.day_movements'.tr(),
                      style: AppFontStyle.bold19,
                    ),
                    Text(
                      'admin_home.see_all'.tr(),
                      style: AppFontStyle.regular14Purple,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 18)),
            HomeMovementsList(),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
          ],
        ),
      ),
    );
  }
}

class HomeMovementsList extends StatefulWidget {
  const HomeMovementsList({
    super.key,
  });

  @override
  State<HomeMovementsList> createState() => _HomeMovementsListState();
}

class _HomeMovementsListState extends State<HomeMovementsList> {
  List<MovementModel> movements = [];
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (prev, curr) {
          return curr is LoadMovements;
        },
        builder: (context, state) {
          if (state is LoadingLoadMovements) {
            return CustomShimmerList(
              itemHeight: 50,
              length: 5,
            );
          } else if (state is FailureLoadMovements) {
            return ErrorWidgetState(errMessage: state.errMessage);
          } else if (state is SuccessLoadMovements) {
            movements = state.movements;
          }
          return movements.isEmpty
              ? EmptyWidgetState()
              : ListView.builder(
                  itemCount: movements.length,
                  itemBuilder: (context, index) {
                    return MovementItem(
                      name: movements[index].fullName.toString(),
                      inTime: movements[index].checkIn != null
                          ? DateFormat('hh:mm a')
                              .format(movements[index].checkIn!)
                          : "---",
                      outTime: movements[index].checkOut != null
                          ? DateFormat('hh:mm a')
                              .format(movements[index].checkOut!)
                          : "---",
                    );
                  },
                );
        },
      ),
    );
  }
}
