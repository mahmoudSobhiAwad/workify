import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:workify/core/constants/admin_home_nav_bar_list.dart';
import 'package:workify/core/constants/admin_home_pages.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/constants/app_strings.dart';
import 'package:workify/core/utils/constants/enums.dart';
import 'package:workify/features/admin/auth/presentation/pages/admin_login_view.dart';
import 'package:workify/features/admin/auth/presentation/pages/admin_sign_up_view.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/features/admin/company/presentation/pages/company_setup_view.dart';
import 'package:workify/features/admin/company/presentation/pages/goolge_map_view.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';
import 'package:workify/features/admin/users/presentation/cubit/employee_cubit.dart';
import 'package:workify/features/admin/users/presentation/pages/update_user_view.dart';
import 'package:workify/features/employee/company_select/presentation/company_select_page.dart';
import 'package:workify/shared/features/basic_preview/presentation/pages/basic_preview.dart';
import 'package:workify/shared/features/on_boarding/presentation/pages/get_started_page.dart';
import 'package:workify/shared/features/on_boarding/presentation/pages/role_select_page.dart';

import '../../features/employee/login/presentation/pages/employee_login_page.dart';

final GoRouter router = GoRouter(
  initialLocation: getInitalRoute(),
  // initialLocation: Routes.getStartedPage,
  // Routes.login,
  routes: [
    GoRoute(
      path: Routes.getStartedPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const GetStartedPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: Routes.roleSelectPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const RoleSelectPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
        path: Routes.basicPreviewAdmin,
        pageBuilder: (context, state) {
          final args = state.extra as Map?;
          return CustomTransitionPage(
            key: state.pageKey,
            child: BasicPreview(
              initialIndex: args?[AppStrings.initalIndex] ?? 0,
              pages: adminHomePages,
              bottomNavBarIconsList: adminHomeNavBarList,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: Routes.basicPreviewEmployee,
        pageBuilder: (context, state) {
          final args = state.extra as Map?;
          return CustomTransitionPage(
            key: state.pageKey,
            child: BasicPreview(
              initialIndex: args?[AppStrings.initalIndex] ?? 0,
              pages: employeeHomePages,
              bottomNavBarIconsList: employeeHomeNavBarList,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: Routes.updateUser,
        pageBuilder: (context, state) {
          final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: UpdateUserView(
              cubit: args['cubit'] as EmployeeCubit,
              model: args['model'] as EmployeeModel?,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: Routes.companySetupPage,
        pageBuilder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return CustomTransitionPage(
            key: state.pageKey,
            child: CompanySetupView(
              companyId: args['id'],
              companyModel: args['model'],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: Routes.mapView,
        pageBuilder: (context, state) {
          // final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: GoogleMapScreen(
              initialLocation: state.extra as LatLng?,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: Routes.adminLogin,
        pageBuilder: (context, state) {
          // final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: AdminLoginPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: Routes.adminSignUp,
        pageBuilder: (context, state) {
          // final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: AdminSignupPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: Routes.employeeLogin,
        pageBuilder: (context, state) {
          // final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: EmployeeLoginPage(
              companyModel: state.extra as CompanyModel,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: Routes.companySelectPage,
        pageBuilder: (context, state) {
          // final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: CompanySelectPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }),
  ],
);

String getInitalRoute() {
  bool isKeyExist = AppSharedPreferences.sharedPreferences
      .containsKey(AppStrings.userModelKey);
  if (isKeyExist) {
    String? role = jsonDecode(AppSharedPreferences.sharedPreferences
            .getString(AppStrings.userModelKey) ??
        "")['role'];
    UserRoleEnum roleEnum =
        UserRoleEnum.values.firstWhere((model) => model.name == role);
    switch (roleEnum) {
      case UserRoleEnum.admin:
        return Routes.basicPreviewAdmin;

      case UserRoleEnum.employee:
        return Routes.basicPreviewEmployee;
    }
  }
  return Routes.getStartedPage;
}
