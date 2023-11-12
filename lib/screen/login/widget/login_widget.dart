import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:afto_school_task/core/utils/app_icons.dart';
import 'package:afto_school_task/core/utils/text_style.dart';
import 'package:afto_school_task/screen/lesson/lesson.dart';
import 'package:afto_school_task/screen/login/bloc/bloc/login_bloc.dart';
import 'package:afto_school_task/screen/login/widget/input_widget.dart';
import 'package:afto_school_task/screen/login/widget/page_controll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });

  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPassord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.stateStatus == StateStatus.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => const LessonScreen(),
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            children: [
              InputWidgets(
                error: state.emailError,
                onChanged: (value) {
                  context.read<LoginBloc>().add(ChangeInput(
                        email: value,
                      ));
                },
                inputText: inputEmail,
                labelText: 'Email Address',
                iconUrl: AppIcons.emailIcon,
              ),
              SizedBox(
                height: 16.h,
              ),
              InputWidgets(
                error: state.passwordError,
                onChanged: (value) {
                  context.read<LoginBloc>().add(ChangeInput(
                        password: value,
                      ));
                },
                inputText: inputPassord,
                labelText: 'Password',
                suffixIcon: true,
                iconUrl: AppIcons.lockIcon,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?',
                      style: AppStyle.pageControllOff
                          .copyWith(color: const Color(0xFF94D073))),
                  SizedBox(
                    width: 24.w,
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 1,
                          width: 98,
                          color: const Color(0xFFD0D5DD),
                        ),
                        Text('Or sign in with',
                            style: AppStyle.pageControllOff
                                .copyWith(color: const Color(0xFF101828))),
                        Container(
                          height: 1,
                          width: 98,
                          color: const Color(0xFFD0D5DD),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
               const      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LoginNetworkWidgets(imaUrl: AppIcons.googleIcon),
                        LoginNetworkWidgets(imaUrl: AppIcons.appleIcon),
                        LoginNetworkWidgets(imaUrl: AppIcons.facebookIcon),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 62.h,
              ),
              GestureDetector(
                onTap: () {
                  if (inputPassord.text.isNotEmpty &&
                      inputEmail.text.isNotEmpty) {
                    context.read<LoginBloc>().add(IsLoginEvent());
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: state.stateStatus == StateStatus.active
                        ? const Color(0xFF94D073)
                        : const Color(0xFFEAECF0),
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: state.stateStatus == StateStatus.active
                            ? AppColors.white
                            : const Color(0xFF838FA0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
