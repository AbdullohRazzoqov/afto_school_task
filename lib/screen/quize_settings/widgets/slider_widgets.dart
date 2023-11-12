import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

// quize screen slider
class SliderWidget extends StatefulWidget {
  @override
  SiderWidgetState createState() => new SiderWidgetState();
}

class SiderWidgetState extends State {
  int valueHolder = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Slider(
          value: valueHolder.toDouble(),
          min: 5,
          max: 65,
          divisions: 13,
          activeColor: const Color(0xFF7ED321),
          inactiveColor: const Color(0xFFD1E2EA),
          label: '${valueHolder.round()}',
          onChanged: (double newValue) {
            setState(() {
              valueHolder = newValue.round();
            });
          },
          semanticFormatterCallback: (double newValue) {
            return '${newValue.round()}';
          }),
    );
  }
}

// quize screen grid item

class SelectItem extends StatelessWidget {
  const SelectItem({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF94D073) : null,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          width: 1.w,
          color: isActive ? const Color(0xFF94D073) : const Color(0xFFB8B6B6),
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          'Item',
          style: TextStyle(
            color: isActive ? AppColors.white : const Color(0xFF838FA0),
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// quize switch icon

class SwitchWidgets extends StatefulWidget {
  const SwitchWidgets({super.key});

  @override
  State<SwitchWidgets> createState() => _SwitchWidgetsState();
}

class _SwitchWidgetsState extends State<SwitchWidgets> {
  bool isToggled = false;
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      inactiveColor: Color(0xFFD6D9DF),
      height: 20.0,
      width: 40.0,
      padding: 4.0,
      toggleSize: 15.0,
      borderRadius: 10.0,
      activeColor: const Color(0xFF94D073),
      value: isToggled,
      onToggle: (value) {
        setState(() {
          isToggled = value;
        });
      },
    );
  }
}

// Quize select catigory


class QuizeSelectCatigory extends StatefulWidget {
 const QuizeSelectCatigory({
    super.key,
  });

  @override
  State<QuizeSelectCatigory> createState() => _QuizeSelectCatigoryState();
}

class _QuizeSelectCatigoryState extends State<QuizeSelectCatigory> {
  List<bool> item = [true, false, true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: List.generate(6, (index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                List a = [];
                for (var i = 0; i < item.length; i++) {
                  if (item[i]) {
                    a.add(item[i]);
                  }
                }
                if (a.length <= 2 && item[index]) {
                } else {
                  item[index] = !item[index];
                  setState(() {});
                }
              },
              child: SelectItem(
                isActive: item[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}
