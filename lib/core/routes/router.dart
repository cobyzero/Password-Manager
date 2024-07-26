import 'package:get/route_manager.dart';
import 'package:password_manager/features/auth/controllers/auth_binding.dart';
import 'package:password_manager/features/auth/views/auth_view.dart';

final getRouter = <GetPage>[
  GetPage(
    name: "/login",
    page: () => AuthView(),
    binding: AuthBinding(),
  ),
];
