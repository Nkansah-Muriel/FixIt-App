// import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:fitit_app/features/auth/opt_screen.dart';
import 'package:fitit_app/shared/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _isChecked = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneContactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneContactController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  Future<void> _handleSignUp() async {
    if (!_formkey.currentState!.validate()) return;
    if (!_isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please accept the Terms of Service and Privacy Policy",
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    setState(() {
      _isLoading = true;
    });
    //firebase auth goes hee
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() {
      _isLoading = false;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OptScreen(phoneNumber: _phoneContactController.text),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.horizontalPadding,
                vertical: context.verticalPadding,
              ),
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      context
                          .h(0.06)
                          .vSpace, //6% of the screen height from the top
                      Center(
                        child: Text(
                          "Create your account",
                          style: textTheme.headlineLarge,
                        ),
                      ),
                      8.vSpace,
                      Center(
                        child: Text(
                          "Join us and start your journey!",
                          style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.lightTextSub,
                          ),
                        ),
                      ),
                      24.vSpace,
                      Text("FULL NAME", style: textTheme.labelMedium),
                      8.vSpace,
                      CustomTextFormField(
                        controller: _fullNameController,
                        hint: "Enter your full name",
                        prefixIcon: Icons.person,
                        validator: AppValidators.fullName,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      24.vSpace,
                      Text("EMAIL", style: textTheme.labelMedium),
                      8.vSpace,
                      CustomTextFormField(
                        hint: "Enter your email",
                        prefixIcon: Icons.email,
                        controller: _emailController,
                        validator: AppValidators.email,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      24.vSpace,
                      Text("PHONE NUMBER", style: textTheme.labelMedium),
                      8.vSpace,
                      CustomTextFormField(
                        hint: "Enter your phone number",
                        controller: _phoneContactController,
                        prefixIcon: Icons.phone,
                        validator: AppValidators.phone,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                      ),
                      24.vSpace,
                      Text("PASSWORD", style: textTheme.labelMedium),
                      8.vSpace,
                      CustomTextFormField(
                        hint: "Enter your password",
                        controller: _passwordController,
                        prefixIcon: Icons.lock,
                        isPassword: true,
                        validator: AppValidators.password,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                      ),
                      8.vSpace,
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),

                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppColors.lightTextSub,
                                ),
                                children: const [
                                  TextSpan(text: "I agree to the "),
                                  TextSpan(
                                    text: "Terms of Service",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  TextSpan(text: " and "),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      50.vSpace,
                      ElevatedButton(
                        onPressed: () {
                          _isLoading ? null : _handleSignUp();
                        },
                        child: Text("Sign Up"),
                      ),
                      16.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                              context,
                              "/signin_screen",
                            ),
                            child: Text(
                              "Login",
                              style: textTheme.bodyMedium!.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      //loading overlay
                    ],
                  ),
                ),
              ),
            ),
            if (_isLoading)
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
