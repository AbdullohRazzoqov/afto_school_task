import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:afto_school_task/core/utils/app_icons.dart';
import 'package:afto_school_task/screen/lesson/widgets/glossary.dart';
import 'package:afto_school_task/screen/lesson/widgets/lesson.dart';
import 'package:afto_school_task/screen/lesson/widgets/resource.dart';
import 'package:afto_school_task/screen/lesson/widgets/sliver.dart';
import 'package:afto_school_task/screen/lesson/widgets/vedio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> myTabs = [
    const Tab(text: 'Lessons'),
    const Tab(text: 'Glossary'),
    const Tab(text: 'Resource'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E6),
      body: Column(
        children: [
          SizedBox(
            height: 52.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 24.w,
              ),
              SvgPicture.asset(AppIcons.backIcon),
              SizedBox(
                width: 80.w,
              ),
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
              const Expanded(child: SizedBox()),
              SvgPicture.asset(AppIcons.lessonAppbarIcon),
              SizedBox(
                width: 24.w,
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            height: 260.h,
            child: const VideoPlaying(
              videoUrl: 'assets/vedio/bmw.mp4',
            ),
          ),
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverPersistentHeader(
                    floating: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 140,
                      maxHeight: 140,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16,),
                            Text(
                              'Vägen till körkort för personbil',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF323232)),
                            ),
                            Text(
                              "Join UserTesting's Mr. Braun for an insightful dive into usability — what it means, why it matters, and how you can optimize your product, service, or business. what it means, why it matters, and how you can optimize your product, service, or business ...läs mer",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF969696)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 61.0,
                      maxHeight: 60.0,
                      child: Container(
                        color: const Color(0xFFF9FDFD),
                        child: TabBar(
                          controller: _tabController,
                          tabs: myTabs,
                          isScrollable: false,
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: const [
                  Lessons(),
                  Glossary(),
                  Resource(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
