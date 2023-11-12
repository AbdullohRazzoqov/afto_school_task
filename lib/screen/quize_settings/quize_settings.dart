import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:afto_school_task/core/utils/text_style.dart';
import 'package:afto_school_task/screen/quize_settings/widgets/slider_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class QuizeSettings extends StatefulWidget {
  const QuizeSettings({super.key});

  @override
  State<QuizeSettings> createState() => _QuizeSettingsState();
}

class _QuizeSettingsState extends State<QuizeSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 36.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          'Select number of questions',
                          style: AppStyle.quizeMainStyle,
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      SliderWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Choose quize mode',
                              style: AppStyle.quizeMainStyle,
                            ),
                            SwitchWidgets()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SliderWidget(),
                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF403231)),
                        ),
                      ),
                      QuizeSelectCatigory(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 44.h,
                              width: 44.w,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF2F9EF).withOpacity(0.6),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1, color: Color(0xFFCEE9C0))),
                              child: Center(
                                child: SvgPicture.asset('assets/svg/clock.svg'),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text(
                              'Choose time',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF27364E)),
                            ),
                            Expanded(child: SizedBox()),
                            SwitchWidgets()
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF94D073),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Center(
                            child: Text('Log In',
                                style: AppStyle.quizeMainStyle
                                    .copyWith(color: AppColors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      )
                    ],
                  ),
                );
              });
            });
      }),
    );
  }
}
