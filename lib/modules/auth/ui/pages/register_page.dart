import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_app/core/constants/constants.dart';
import 'package:stylish_app/modules/auth/auth_cubit/auth_cubit.dart';

import '../Widgets/custom_form_field.dart';
import '../Widgets/custom_icon_page.dart';
import '../Widgets/custom_pass_form_field.dart';
import '../Widgets/select_gender.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Create an account Text
                    const Text(
                      'Create an ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'account',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),
                    // Username/Email field
                    CustomFormField(
                      hintText: 'Name',
                      icon: const Icon(Icons.person),
                      control: cubit.nameControl,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      hintText: 'Email',
                      icon: const Icon(Icons.person),
                      control: cubit.emailControl,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      hintText: 'Phone',
                      icon: const Icon(Icons.phone),
                      control: cubit.phoneControl,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectGender(
                      onGenderSelected: (String value) {
                        setState(() {
                          cubit.selectedGender = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    // Password field
                    CustomPassFormField(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.visibility),
                      passControl: cubit.passControl,
                    ),
                    const SizedBox(height: 16),
                    // Confirm Password field
                    CustomPassFormField(
                      hintText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.visibility),
                      passControl: cubit.confirmpassControl,
                    ),
                    const SizedBox(height: 16),
                    // Terms of agreement
                    const Text(
                      'By clicking the Register button, you agree to the public offer',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12),
                    ),

                    const SizedBox(height: 16),

                    // Create Account Button
                    ElevatedButton(
                      onPressed: () {
                        cubit.registerService(
                          name: cubit.nameControl.text,
                          phone: cubit.phoneControl.text,
                          gender: cubit.selectedGender,
                          email: cubit.emailControl.text,
                          password: cubit.passControl.text,
                          passwordConfirmation: cubit.confirmpassControl.text,
                        );
                        Navigator.pushNamed(context, 'LoginScreen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor, // background color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // OR Continue with
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('- OR Continue with -'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Social Media buttons
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconPage(
                          iconButton: 'assets/images/Google.png',
                        ),
                        SizedBox(width: 10),
                        CustomIconPage(
                          iconButton: 'assets/images/Apple.png',
                        ),
                        SizedBox(width: 10),
                        CustomIconPage(
                          iconButton: 'assets/images/Facebook.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Already have an account? Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('I Already Have an Account'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'LoginScreen');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
