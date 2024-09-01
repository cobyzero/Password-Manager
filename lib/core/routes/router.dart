import 'package:get/route_manager.dart';
import 'package:password_manager/features/auth/controllers/auth_binding.dart';
import 'package:password_manager/features/auth/views/auth_view.dart';
import 'package:password_manager/features/home/controllers/home_binding.dart';
import 'package:password_manager/features/home/views/home_view.dart';
import 'package:password_manager/features/password/controllers/password_binding.dart';
import 'package:password_manager/features/password/views/password_add_view.dart';
import 'package:password_manager/features/password/views/password_edit_view.dart';
import 'package:password_manager/features/profile/controllers/profile_binding.dart';
import 'package:password_manager/features/profile/views/profile_view.dart';

final getRouter = <GetPage>[
  GetPage(
    name: "/auth",
    page: () => const AuthView(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/home",
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: "/profile",
    page: () => const ProfileView(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: "/passwordAdd",
    page: () => const PasswordAddView(),
    binding: PasswordBinding(),
  ),
  GetPage(
    name: "/passwordEdit",
    page: () => const PasswordEditView(),
    binding: PasswordBinding(),
  ),
];
