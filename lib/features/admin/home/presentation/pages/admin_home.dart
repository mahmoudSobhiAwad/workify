import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/features/admin/home/presentation/cubit/home_cubit.dart';
import 'package:workify/features/admin/home/presentation/widgets/movement_item.dart';
import 'package:workify/features/admin/home/presentation/widgets/quick_over_view.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();

          // Fetch movements only once when the page is first loaded
          if (state is HomeInitial) {
            cubit.getMovements('14 Mar 2025');
          }

          return CustomScrollView(
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
              if (state is LoadMovements)
                SliverList.builder(
                  itemCount: cubit.movements.length,
                  itemBuilder: (context, index) {
                    return MovementItem(
                      name: cubit.movements[index].fullName.toString(),
                      inTime: DateFormat('hh:mm a').format(cubit.movements[index].checkIn!),
                      outTime: DateFormat('hh:mm a').format(cubit.movements[index].checkOut!),
                    );
                  },
                ),
              SliverToBoxAdapter(child: SizedBox(height: 12)),
            ],
          );
        },
      ),
    );
  }
}
