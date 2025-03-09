import 'package:flutter/material.dart';
import 'package:workify/features/admin/company/presentation/pages/company_page_view.dart';
import 'package:workify/features/admin/home/presentation/pages/admin_home.dart';
import 'package:workify/features/admin/users/presentation/pages/user_page_view.dart';
import 'package:workify/shared/features/settings/presentation/pages/settings_view.dart';

List<Widget> adminHomePages = [
  AdminHomePage(),
  UserPageView(),
  CompanyPageView(),
  SettingView(),
];
