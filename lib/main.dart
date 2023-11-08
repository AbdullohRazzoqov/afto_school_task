import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:afto_school_task/screen/login/bloc/bloc/login_bloc.dart';
import 'package:afto_school_task/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => LoginBloc())],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo task',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.white,
              ),
              useMaterial3: true,
            ),
            home: const LoginScreen(),
          ),
        ));
  }
}
