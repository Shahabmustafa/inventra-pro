import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventra_pro/provider/WidgetsViewModel1.dart';
import 'package:inventra_pro/screens/home/admin/admin_screen.dart';
import 'package:inventra_pro/screens/login/login_screen.dart';
import 'package:inventra_pro/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => WidgetsViewModel1(),
            ),
            ChangeNotifierProvider(
              create: (context) => WidgetsViewModel1(),
            ),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Gym Workout',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                filled: true,
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                suffixStyle: TextStyle(
                  color: Colors.black
                )
              ),
            ),
            home: child,
          ),
        );
      },
      child: SplashScreen(),
    );
  }
}
