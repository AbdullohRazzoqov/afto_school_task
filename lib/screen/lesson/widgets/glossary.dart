import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Glossary extends StatelessWidget {
  const Glossary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) => Container(
              margin:
                  EdgeInsets.symmetric(vertical: 4, horizontal: 24.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 40.h,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(
                        0,
                        0,
                      ),
                      spreadRadius: 2,
                      blurRadius: 2,
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grocery Shopping App',
                    style: TextStyle(
                        color: const Color(0xFF24252C),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
               const    Icon(Icons.keyboard_arrow_down_sharp)
                ],
              ),
            ));
  }
}
