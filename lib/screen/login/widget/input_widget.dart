import 'package:afto_school_task/screen/login/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InputWidgets extends StatelessWidget {
  InputWidgets(
      {super.key,
      this.onIconTap,
      this.suffixIcon,
      required this.inputText,
      required this.labelText,
      required this.iconUrl});

  final String labelText;
  final VoidCallback? onIconTap;
  final Widget? suffixIcon;
  TextEditingController inputText;
  String iconUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextFormField(
                  style: TextStyle(
                      color: state.stateStatus == StateStatus.error
                          ? Colors.red
                          : const Color(0xFF2C4364)),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  controller: inputText,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: SvgPicture.asset(
                          iconUrl,
                          color: state.stateStatus == StateStatus.error
                              ? Colors.red
                              : null,
                        ),
                      ),
                      suffixIcon: suffixIcon ?? const SizedBox(),
                      contentPadding: EdgeInsets.all(5.w),
                      label: Text(labelText),
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: state.stateStatus == StateStatus.error
                            ? Colors.red
                            : const Color(
                                0xFFADB4C0,
                              ),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
