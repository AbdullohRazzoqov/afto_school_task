import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// Login Newtwork Widgets
class LoginNetworkWidgets extends StatelessWidget {
  const LoginNetworkWidgets({super.key, required this.imaUrl});
  final String imaUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 106.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFFD0D5DD),
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(child: SvgPicture.asset(imaUrl)),
    );
  }
}

// Mian button

class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
      required this.ontap,
      required this.text,
      required this.color});
  GestureTapCallback ontap;
  Text text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        height: 50.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Center(child: text),
      ),
    );
  }
}
