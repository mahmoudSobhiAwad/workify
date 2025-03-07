import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/features/admin/home/presentation/pages/admin_home.dart';
import 'package:workify/shared/features/on_boarding/presentation/pages/get_started_page.dart';
import 'package:workify/shared/features/on_boarding/presentation/pages/role_select_page.dart';

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
      path: Routes.adminHome,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AdminHomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    )
  ],
);
