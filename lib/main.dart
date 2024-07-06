import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:plants_information/features/plants/presentation/bloc/plants_cubit.dart';
import 'package:plants_information/utile/constants/route_keys.dart';
import 'package:plants_information/utile/constants/themes/light_theme.dart';

import 'core/network/remote/dio_helper.dart';
import 'features/zone/presentation/bloc/zones_cubit.dart';
import 'utile/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await DioHelper.init();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PlantsCubit>()),
        BlocProvider(create: (_) => di.sl<ZonesCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (context, child) => GetMaterialApp.router(
            theme: lightTheme,
            //darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            title: "Plants Information's",
            debugShowCheckedModeBanner: false,
            routerDelegate: appRoute.routerDelegate,
            routeInformationParser: appRoute.routeInformationParser,
            routeInformationProvider: appRoute.routeInformationProvider,
            //locale: Locale(lag),
            //fallbackLocale: const Locale('en'),
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
