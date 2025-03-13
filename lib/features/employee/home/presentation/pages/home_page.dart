import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workify/features/employee/home/presentation/cubit/home_employee_cubit.dart';
import 'package:workify/features/employee/home/presentation/widgets/home_body.dart';

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
