import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/features/admin/auth/presentation/pages/admin_login_view.dart';
import 'package:workify/features/admin/auth/presentation/pages/admin_sign_up_view.dart';
import 'package:workify/features/admin/company/presentation/pages/company_setup_view.dart';
import 'package:workify/features/admin/users/presentation/pages/update_user_view.dart';
import 'package:workify/shared/features/basic_preview/data/models/bottom_nav_bar_model.dart';
import 'package:workify/shared/features/basic_preview/presentation/pages/basic_preview.dart';
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
        path: Routes.basicPreview,
        pageBuilder: (context, state) {
          final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: BasicPreview(
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
    GoRoute(
        path: Routes.updateUser,
        pageBuilder: (context, state) {
          // final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: UpdateUserView(),
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
          // final args = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: CompanySetupView(),
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
  ],
);
