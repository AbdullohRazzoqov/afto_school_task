import 'package:afto_school_task/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';





// Login Newtwork Widgets
class LoginNetworkWidgets extends StatelessWidget {
   LoginNetworkWidgets({
    super.key,required this.imaUrl
  });
  String imaUrl;

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
  MainButton({super.key, required this.ontap, required this.text});
  GestureTapCallback ontap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xFFEAECF0),
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF838FA0)),
        )),
      ),
    );
  }
}
