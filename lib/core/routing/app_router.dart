import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/features/employee/basic_screen.dart';
import 'package:workify/features/employee/finger_print/presentation/pages/finger_print_page.dart';
import 'package:workify/features/employee/home/presentation/pages/home_page.dart';
import 'package:workify/shared/features/on_boarding/presentation/pages/get_started_page.dart';
import 'package:workify/shared/features/on_boarding/presentation/pages/role_select_page.dart';
import 'package:workify/shared/features/settings/presentation/pages/settings_page.dart';
import 'package:workify/shared/models/bottom_nav_model.dart';

final GoRouter router = GoRouter(
  // initialLocation: AppSharedPreferences.sharedPreferences
  //         .containsKey(AppStrings.refreshToken)
  initialLocation: Routes.getStartedPage,
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
      path: Routes.fingerPrintPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const FingerPrint(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: Routes.homePage,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: Routes.settingsPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SettingPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
        path: Routes.basicPage,
        pageBuilder: (context, state) {
          final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: BasicScreen(
              pages: args['pages'] as List<Widget>,
              bottomNavBarIconsList:
                  args['bottomNavList'] as List<BottomNavBarModel>,
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
  ],
);
