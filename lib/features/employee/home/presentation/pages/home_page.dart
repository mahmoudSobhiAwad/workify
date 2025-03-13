import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';
import 'package:workify/features/employee/home/presentation/cubit/home_employee_cubit.dart';
import 'package:workify/features/employee/home/presentation/widgets/movement_item.dart';
import 'package:workify/shared/widgets/error_widget.dart';
import 'package:workify/shared/widgets/shimmer_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeEmployeeCubit()..getEmployeeData(),
      child: Scaffold(
        body: SafeArea(
          child: HomeEmployeeBody(),
        ),
      ),
    );
  }
}

class HomeEmployeeBody extends StatefulWidget {
  const HomeEmployeeBody({
    super.key,
  });

  @override
  State<HomeEmployeeBody> createState() => _HomeEmployeeBodyState();
}

class _HomeEmployeeBodyState extends State<HomeEmployeeBody> {
  EmployeeModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeEmployeeCubit, HomeEmployeeState>(
      builder: (context, state) {
        if (state is LoadingGetAllEmployeeData) {
          return CustomShimmerList(
            itemHeight: 50,
            length: 10,
          );
        } else if (state is FailureGetAllEmployeeData) {
          return ErrorWidgetState(errMessage: state.errMessage);
        } else if (state is SuccessGetAllEmployeeData) {
          model = state.model;
        }
        return RefreshIndicator(
          onRefresh: () async {
            context.read<HomeEmployeeCubit>().getEmployeeData();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
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
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: SvgPicture.asset(
                              AppIcons.assetsIconsProfileIcon,
                              fit: BoxFit.scaleDown,
                              width: 50,
                              height: 50,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello,',
                                style: AppFontStyle.medium15,
                              ),
                              Text(
                                '${model?.firstName}',
                                style: AppFontStyle.bold13,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(2, (index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 16),
                              decoration: BoxDecoration(
                                color: AppColors.whiteWithOpacity10,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: [
                                Column(
                                  children: [
                                    Text(
                                      "Total Salary",
                                      style: AppFontStyle.semiBold14,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "${model?.salary.toString()} LE",
                                      style: AppFontStyle.semiBold18,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Leave Balance",
                                        style: AppFontStyle.semiBold14),
                                    SizedBox(height: 16),
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.green53,
                                      child: Text(
                                        '${model?.numOfHolidays ?? 0}',
                                        style: AppFontStyle.semiBold18
                                            .copyWith(color: AppColors.whiteff),
                                      ),
                                    ),
                                  ],
                                )
                              ][index],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        'Movements',
                        style: AppFontStyle.bold19,
                      ),
                      Spacer(),
                      SvgPicture.asset(AppIcons.assetsIconsDatePickerIcon)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.builder(
                  itemCount: model?.movements?.movements.entries.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return MovementItem(
                      model: model!.movements!.movements.entries
                          .elementAt(index)
                          .value,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

