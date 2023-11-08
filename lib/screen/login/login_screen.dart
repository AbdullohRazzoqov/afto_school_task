import 'package:afto_school_task/core/utils/app_icons.dart';
import 'package:afto_school_task/core/utils/text_style.dart';
import 'package:afto_school_task/screen/login/bloc/bloc/login_bloc.dart';
import 'package:afto_school_task/screen/login/widget/input_widget.dart';
import 'package:afto_school_task/screen/login/widget/page_controll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController inputEmail = TextEditingController();
    TextEditingController inputName = TextEditingController();
    TextEditingController inputPassord = TextEditingController();
    TextEditingController inputConfirmPassord = TextEditingController();
    final PageController controller = PageController();
    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    void toPage() {
      controller.jumpToPage(0);
    }

    final List<Widget> pages = [
      BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
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
                            duration: const Duration(milliseconds: 400),
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
                            borderRadius: BorderRadius.circular(32.r),
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
                            duration: const Duration(milliseconds: 400),
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
              ),
              SizedBox(
                height: 24.h,
              ),
              InputWidgets(
                iconUrl: AppIcons.personIcon,
                inputText: inputEmail,
                labelText: 'Name',
              ),
              SizedBox(
                height: 16.h,
              ),
              InputWidgets(
                iconUrl: AppIcons.emailIcon,
                inputText: inputPassord,
                labelText: 'Email Address',
                suffixIcon: const Icon(Icons.password),
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
                    Expanded(
                      child: TextFormField(
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        controller: inputPassord,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: SvgPicture.asset(
                                AppIcons.lockIcon,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(5.w),
                            label: const Text('Password'),
                            labelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFADB4C0),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      width: 0.5,
                      height: 32.h,
                      color: const Color(0xFFADB4C0),
                    ),
                    Expanded(
                      child: TextFormField(
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        controller: inputConfirmPassord,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.w),
                            label: const Text('Re-Password'),
                            labelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFADB4C0),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
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
                  Text(
                    'At least 8 characters',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF94D073)),
                  ),
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
              MainButton(ontap: () {}, text: 'Register Me')
            ],
          );
        },
      ),
      BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          print(state.isRegister);
          return Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
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
                            duration: const Duration(milliseconds: 400),
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
                            borderRadius: BorderRadius.circular(32.r),
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
                            duration: const Duration(milliseconds: 400),
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
              ),
              SizedBox(
                height: 24.h,
              ),
              InputWidgets(
                inputText: inputEmail,
                labelText: 'Email Address',
                iconUrl: AppIcons.emailIcon,
              ),
              SizedBox(
                height: 16.h,
              ),
              InputWidgets(
                inputText: inputPassord,
                labelText: 'Password',
                suffixIcon: SvgPicture.asset(
                  AppIcons.seeOnIcon,
                  width: 10,
                  height: 10,
                ),
                iconUrl: AppIcons.lockIcon,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF94D073),
                    ),
                  ),
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
                        Text(
                          'Or sign in with',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF101828),
                          ),
                        ),
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
                    Row(
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
              MainButton(
                ontap: () {
                  context.read<LoginBloc>().add(IsLoginEvent(
                      email: inputEmail.text, password: inputPassord.text));
                },
                text: 'Log In',
              )
            ],
          );
        },
      ),
    ];
    return Scaffold(
      body: Container(
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
                    'Hello There✋,',
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF27364E)),
                  ),
                  Text(
                    'Create your account',
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF27364E)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Text(
                      'Enter your email and password to log in to your account.',
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
              child: PageView(
                onPageChanged: (value) {},
                controller: controller,
                children: pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
