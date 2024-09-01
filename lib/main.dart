import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:password_manager/core/routes/router.dart';
import 'package:password_manager/services/database_service.dart';
import 'package:sizer/sizer.dart';

final DatabaseService databaseService = DatabaseService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await databaseService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Material App',
          getPages: getRouter,
          initialRoute: "/auth",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Poppins"),
        );
      },
    );
  }
}
