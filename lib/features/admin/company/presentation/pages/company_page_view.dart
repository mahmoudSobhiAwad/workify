import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workify/features/admin/company/presentation/cubit/company_cubit/company_cubit.dart';
import 'package:workify/features/admin/company/presentation/widgets/company_body.dart';
import 'package:workify/features/admin/company/presentation/widgets/empty_company.dart';
import 'package:workify/features/admin/company/presentation/widgets/shimmer_company_body.dart';

class CompanyPageView extends StatelessWidget {
  const CompanyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyCubit>(
      create: (context) => CompanyCubit()..loadCompanySetup(),
      child: BlocBuilder<CompanyCubit, CompanyState>(buildWhen: (prev, curr) {
        return curr is LoadCompanyState;
      }, builder: (context, state) {
        if (state is LoadingLoadCompanyState) {
          return ShimmerBody();
        } else if (state is FailureLoadCompanyState) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is SuccessLoadCompanyState) {
          return state.companyModel != null
              ? ComapnyBody(
                  companyModel: state.companyModel!,
                  onRefresh: () {
                    context.read<CompanyCubit>().loadCompanySetup();
                  },
                )
              : ComapnyEmptyStateView(
                  companyId: context.read<CompanyCubit>().id,
                );
        }
        return SizedBox();
      }),
    );
  }
}
