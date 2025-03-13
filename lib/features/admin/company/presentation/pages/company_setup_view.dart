import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/features/admin/company/presentation/cubit/company_setup_cubit/company_setup_cubit.dart';
import 'package:workify/features/admin/company/presentation/widgets/company_setup_body.dart';
import 'package:workify/shared/widgets/custom_app_bar.dart';

class CompanySetupView extends StatelessWidget {
  const CompanySetupView(
      {super.key, required this.companyId, this.companyModel});
  final String companyId;
  final CompanyModel? companyModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanySetupCubit(companyId: companyId),
      child: Scaffold(
        appBar: CustomAppBar(title: "Company Setup"),
        body: CompanySetupBody(
          companyModel: companyModel,
        ),
      ),
    );
  }
}
