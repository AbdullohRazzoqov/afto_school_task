import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:afto_school_task/core/utils/app_icons.dart';
import 'package:afto_school_task/data/fake_data.dart';
import 'package:afto_school_task/screen/test_screen/widgets/video_play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/bloc/test_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int? selectIndex;
  int testLing = 380 ~/ questions.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E6),
      body: BlocListener<TestBloc, TestState>(
        listener: (context, state) {
          if (state.stateStatus == TestStateStatus.testEnd) {
            _openCustomDialog();
          }
        },
        child: BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            if (state is TestInitial) {
              return const SizedBox();
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 42.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppIcons.backIcon),
                        Text(
                          'Practice Test',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SvgPicture.asset(AppIcons.saveIcon),
                      ],
                    ),
                    Container(
                        width: 380,
                        margin: EdgeInsets.only(top: 28.h, bottom: 32.h),
                        height: 6.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color(0xFFEAF0CF)),
                        child: Stack(
                          children: [
                            Container(
                                width: testLing *
                                        context
                                            .read<TestBloc>()
                                            .answers
                                            .length
                                            .toDouble() +
                                    1,
                                height: 6.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xFF94D073))),
                          ],
                        )),
                    state.question!.mediaUrl == null
                        ? const SizedBox()
                        : SizedBox(
                            height: 174,
                            child:
                                PlayVideo(videoUrl: state.question!.mediaUrl!),
                      // PlayVideo(videoUrl: 'assets/vedio/no-po.mp4'),

                          ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      state.question!.question,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ...answetsListWidgets(state, context),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        selectIndex = null;

                        context.read<TestBloc>().add(NextQuistionEvent());
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: state.questionEvent == null
                              ? const Color(0xFFEAECF0)
                              : const Color(0xFF94D073),
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        child: Center(
                            child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: state.questionEvent == null
                                  ? const Color(0xFF838FA0)
                                  : AppColors.white),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget> answetsListWidgets(TestState state, BuildContext context) {
    return List.generate(
        state.question!.answers.length,
        (index) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (selectIndex == null) {
                  selectIndex = index;
                  context.read<TestBloc>().add(
                        SelectAnswersEvent(index: index),
                      );
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.w),
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white),
                child: Row(
                  children: [
                    selectIndex == null || selectIndex != index
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            height: 24.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xFFD4D4D4),
                                ),
                                shape: BoxShape.circle),
                          )
                        : selectIndex == index && state.questionEvent!
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                height: 24.h,
                                width: 24.w,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF94D073),
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.done,
                                    color: AppColors.white,
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                height: 24.h,
                                width: 24.w,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFF6967),
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                    Text(
                      state.question!.answers[index],
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  void _openCustomDialog() {
    List<Answer> answers = context.read<TestBloc>().answers;
    int trueAnswers = 0;
    int falseAnswers = 0;
    for (var answer in answers) {
      if (answer.answerEvent) {
        trueAnswers++;
      } else {
        falseAnswers++;
      }
    }
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                title: Text('Natija'),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: SizedBox(
                  height: 120..h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'togri: $trueAnswers',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'no togri: $falseAnswers',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                actions: [
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('Bosh sahifa',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blue)),
                  ),
                ],
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const Text('data');
        });
  }
}