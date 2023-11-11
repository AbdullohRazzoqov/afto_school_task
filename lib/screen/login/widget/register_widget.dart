import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:afto_school_task/core/utils/app_icons.dart';
import 'package:afto_school_task/screen/lesson/lesson.dart';
import 'package:afto_school_task/screen/login/bloc/bloc/login_bloc.dart';
import 'package:afto_school_task/screen/login/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:afto_school_task/screen/login/widget/input_widget.dart';
import 'package:afto_school_task/screen/login/widget/page_controll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController inputEmail = TextEditingController();

  TextEditingController inputName = TextEditingController();

  TextEditingController inputPassord = TextEditingController();

  TextEditingController inputConfirmPassord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
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
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Column(
            children: [
              InputWidgets(
                error: state.error == null ? false : state.error!.nameError,
                onChanged: (value) {
                  context.read<RegisterBloc>().add(ChangeInputRegister(
                        name: value,
                      ));
                },
                iconUrl: AppIcons.personIcon,
                inputText: inputName,
                labelText: 'Name',
              ),
              SizedBox(
                height: 16.h,
              ),
              InputWidgets(
                error: state.error == null ? false : state.error!.emailError,
                onChanged: (value) {
                  context.read<RegisterBloc>().add(ChangeInputRegister(
                        email: value,
                      ));
                },
                iconUrl: AppIcons.emailIcon,
                inputText: inputEmail,
                labelText: 'Email Address',
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                height: 58.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        color: const Color(0xFF5D6976).withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InputPassword(
                      error: state.error == null
                          ? false
                          : state.error!.passwordError,
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(ChangeInputRegister(
                              password: value,
                            ));
                      },
                      icon: Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: SvgPicture.asset(
                          AppIcons.lockIcon,
                          color:
                              state.error != null && state.error!.passwordError
                                  ? Colors.red
                                  : null,
                        ),
                      ),
                      inputPassord: inputPassord,
                      text: 'Password',
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      width: 0.5,
                      height: 32.h,
                      color: const Color(0xFFADB4C0),
                    ),
                    InputPassword(
                      error: state.error == null
                          ? false
                          : state.error!.rePassowrdError,
                      // stateStatus: state.stateStatus,
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(ChangeInputRegister(
                              rePassword: value,
                            ));
                      },
                      inputPassord: inputConfirmPassord,
                      text: 'Re-Password',
                      suffixIcon: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
                  state.error == null
                      ? const SizedBox()
                      : state.error!.rePassowrdError ||
                              state.error!.passwordError
                          ? Text(
                              'At least 8 characters',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFFF7253)),
                            )
                          : Text(
                              'At least 8 characters',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF94D073),
                              ),
                            )
                ],
              ),
              SizedBox(
                height: 14.h,
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
                        Text(
                          'Or sign in with',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF101828)),
                        ),
                        Container(
                          height: 1,
                          width: 98,
                          color: const Color(0xFFD0D5DD),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LoginNetworkWidgets(imaUrl: AppIcons.googleIcon),
                        LoginNetworkWidgets(imaUrl: AppIcons.appleIcon),
                        LoginNetworkWidgets(imaUrl: AppIcons.facebookIcon)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              GestureDetector(
                onTap: () {
                  if (inputPassord.text.isNotEmpty &&
                      inputEmail.text.isNotEmpty &&
                      inputConfirmPassord.text.isNotEmpty &&
                      inputName.text.isNotEmpty) {
                    context.read<RegisterBloc>().add(IsRegisterEvent());
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
              ),
            ],
          );
        },
      ),
    );
  }
}
