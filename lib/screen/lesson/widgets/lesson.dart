import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Lessons extends StatelessWidget {
  const Lessons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 24.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 68.h,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(
                        0,
                        0,
                      ),
                      spreadRadius: 4,
                      blurRadius: 8,
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    index < 9 ? '0${index + 1}' : '${index + 1}',
                    style: TextStyle(
                        color: const Color(0xFF969696),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How to be rich?',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF777777)),
                      ),
                      const Text(
                        '01 Minutes',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF969696)),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(
                              0,
                              0,
                            ),
                            spreadRadius: 1,
                            blurRadius: 2,
                            color: Color.fromRGBO(0, 0, 0, 0.04),
                          )
                        ]),
                    child: SvgPicture.asset(
                      'assets/svg/Vector (2).svg',
                      height: 10,
                      width: 10,
                    ),
                  )
                ],
              ),
            ));
  }
}
