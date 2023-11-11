import 'package:afto_school_task/core/helpers/app_text.dart';
import 'package:afto_school_task/core/utils/text_style.dart';
import 'package:afto_school_task/screen/login/bloc/bloc/login_bloc.dart';
import 'package:afto_school_task/screen/login/widget/login_widget.dart';
import 'package:afto_school_task/screen/login/widget/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    final List<Widget> pages = [
      RegisterScreen(),
      LoginScreen(),
    ];
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.topCenter,
                colors: <Color>[
                  Color.fromARGB(255, 247, 242, 228),
                  Color(0xFFC3E2A7),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.isRegister
                            ? AppText.registerWelcome
                            : AppText.loginWelcome,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF27364E),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.w),
                        child: Text(
                          state.isRegister
                              ? AppText.welcomeTitleR
                              : AppText.welcomeTitleL,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF27364E)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 24.h),
                            height: 56.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAECF0),
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.animateToPage(0,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.linear);
                                    context
                                        .read<LoginBloc>()
                                        .add(ChangePageEvent(pageIndex: 0));
                                  },
                                  child: Container(
                                      width: 154.w,
                                      margin: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: state.isRegister
                                            ? const Color(0xFF94D073)
                                            : const Color(0xFFEAECF0),
                                        borderRadius:
                                            BorderRadius.circular(32.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Sign Up',
                                          style: state.isRegister
                                              ? AppStyle.pageControllOn
                                              : AppStyle.pageControllOff,
                                        ),
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.animateToPage(1,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.linear);
                                    context
                                        .read<LoginBloc>()
                                        .add(ChangePageEvent(pageIndex: 1));
                                  },
                                  child: Container(
                                    width: 154.w,
                                    margin: EdgeInsets.all(6.r),
                                    decoration: BoxDecoration(
                                      color: state.isRegister
                                          ? const Color(0xFFEAECF0)
                                          : const Color(0xFF94D073),
                                      borderRadius: BorderRadius.circular(32.r),
                                    ),
                                    child: Center(
                                      child: Text('Log In',
                                          style: state.isRegister
                                              ? AppStyle.pageControllOff
                                              : AppStyle.pageControllOn),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: PageView(
                          onPageChanged: (value) {
                            controller.animateToPage(value,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.linear);
                            context
                                .read<LoginBloc>()
                                .add(ChangePageEvent(pageIndex: value));
                          },
                          controller: controller,
                          children: pages,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
