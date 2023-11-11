import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class InputWidgets extends StatefulWidget {
  InputWidgets(
      {super.key,
      this.suffixIcon,
      required this.inputText,
      required this.labelText,
      required this.iconUrl,
      required this.onChanged,
      required this.error});

  final String labelText;
  final bool? suffixIcon;
  TextEditingController inputText;
  String iconUrl;
  Function(String value) onChanged;
  bool error;
  @override
  State<InputWidgets> createState() => _InputWidgetsState();
}

class _InputWidgetsState extends State<InputWidgets> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
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
              obscureText: widget.suffixIcon == null ? false : _passwordVisible,
              onChanged: widget.onChanged,
              style: TextStyle(
                  color: widget.error ? Colors.red : const Color(0xFF2C4364)),
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: widget.inputText,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: SvgPicture.asset(
                      widget.iconUrl,
                      color: widget.error ? Colors.red : null,
                    ),
                  ),
                  suffixIcon: widget.suffixIcon == null
                      ? null
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Icon(
                            _passwordVisible
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                  contentPadding: EdgeInsets.all(5.w),
                  label: Text(widget.labelText),
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: widget.error
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
  }
}

class InputPassword extends StatefulWidget {
  InputPassword({
    super.key,
    required this.inputPassord,
    required this.text,
    this.icon,
    this.suffixIcon,
    required this.onChanged,
    required this.error,
  });

  final TextEditingController inputPassord;
  final String text;
  Widget? icon;
  final bool? suffixIcon;
  Function(String value) onChanged;
  bool error;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  // bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<UserDetailsProvider>(
        builder: (context, provider, child) {
          return TextFormField(
            style: TextStyle(color: widget.error ? Colors.red : null),
            onChanged: widget.onChanged,
            obscureText: provider.passwordVisible,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            controller: widget.inputPassord,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                suffixIcon: widget.suffixIcon == null
                    ? null
                    : GestureDetector(
                        onTap: () {
                          context.read<UserDetailsProvider>().update();
                          // setState(() {
                          //   _passwordVisible = !_passwordVisible;
                          // });
                        },
                        child: Icon(
                          provider.passwordVisible
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          color: const Color(0xFFADB4C0),
                        ),
                      ),
                icon: widget.icon,
                contentPadding: EdgeInsets.all(5.w),
                label: Text(
                  widget.text,
                  style: TextStyle(color: widget.error ? Colors.red : null),
                ),
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFADB4C0),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          );
        },
      ),
    );
  }
}

class UserDetailsProvider extends ChangeNotifier {
  bool passwordVisible = true;
  void update() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
}
