import 'package:flutter/material.dart';
import 'package:workify/features/admin/company/presentation/pages/company_page_view.dart';
import 'package:workify/features/admin/home/presentation/pages/admin_home.dart';
import 'package:workify/features/admin/users/presentation/pages/user_page_view.dart';
import 'package:workify/shared/features/settings/presentation/pages/settings_view.dart';

import '../../features/employee/finger_print/presentation/pages/finger_print_page.dart';
import '../../features/employee/home/presentation/pages/home_page.dart';

List<Widget> adminHomePages = const [
  AdminHomePage(),
  UserPageView(),
  CompanyPageView(),
  SettingView(),
];

List<Widget> employeeHomePages = const [
  HomePage(),
  FingerPrint(),
  SettingView(),
];
