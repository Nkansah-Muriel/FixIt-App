import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OptScreen extends StatefulWidget {
  const OptScreen({super.key, required this.phoneNumber});

  @override
  State<OptScreen> createState() => _OptScreenState();
  final String phoneNumber;
}

class _OptScreenState extends State<OptScreen> {
  bool _isVerified = false;
  Future<void> _handleVerification() async {
    setState(() {
      _isVerified = true;
    });
    //firebase auth goes hee
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() {
      _isVerified = false;

      Navigator.pushReplacementNamed(context, "/signin_screen");
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.horizontalPadding,
                vertical: context.verticalPadding,
              ),
              child: Column(
                children: [
                  context.h(0.10).vSpace,
                  Center(
                    child: Text(
                      "Verify your number",
                      style: textTheme.headlineLarge,
                    ),
                  ),
                  Center(
                    child: Text(
                      "We sent a 4 -dit code to ${widget.phoneNumber}",
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.lightTextSub,
                      ),
                    ),
                  ),
                  50.vSpace,
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),

                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    // onSubmit: (String verificationCode) {
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: Text("Verification Code"),
                    //         content: Text('Code entered is $verificationCode'),
                    //       );
                    //     },
                    //   );
                    // }, // end onSubmit
                  ),
                  25.vSpace,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Resend code in ",
                          style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.lightTextSub,
                          ),
                        ),
                        TextSpan(
                          text: "00:42",
                          style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  25.vSpace,
                  ElevatedButton(
                    onPressed: () {
                      _isVerified ? null : _handleVerification();
                    },
                    child: Text("Verify"),
                  ),
                ],
              ),
            ),
            if (_isVerified)
              Container(
                color: Colors.black.withValues(alpha: 102),
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
