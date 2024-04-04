import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app_c10_sun/core/config/page_routes_name.dart';
import 'package:e_commerce_app_c10_sun/core/extenions/padding_ext.dart';
import 'package:e_commerce_app_c10_sun/core/widgets/border_rounded_button.dart';
import 'package:e_commerce_app_c10_sun/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app_c10_sun/main.dart';
import 'package:e_commerce_app_c10_sun/presentation/login/viewModel/cubit.dart';
import 'package:e_commerce_app_c10_sun/presentation/login/viewModel/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocBuilder<LoginViewModel, LoginStates>(
      bloc: loginViewModel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.primaryColor,
          body: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInDown(
                      delay: const Duration(milliseconds: 50),
                      child: Image.asset(
                        "assets/images/route_icn.png",
                      ),
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 50),
                      child: Text(
                        "Welcome Back To Route",
                        style: theme.textTheme.bodyLarge,
                      ).setOnlyPadding(context, 0.05, 0.0, 0.0, 0.0),
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 150),
                      child: Text(
                        "Please sign in with your mail",
                        style: theme.textTheme.bodySmall,
                      ).setOnlyPadding(context, 0.0, 0.05, 0.0, 0.0),
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 250),
                      child: Text(
                        "E-mail",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInRight(
                      delay: const Duration(milliseconds: 350),
                      child: CustomTextField(
                        controller: emailController,
                        hint: "enter your e-mail address",
                        keyboardType: TextInputType.emailAddress,
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "you must enter your e-mail address";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeInRight(
                      delay: const Duration(milliseconds: 450),
                      child: Text(
                        "Password",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInRight(
                      delay: const Duration(milliseconds: 550),
                      child: CustomTextField(
                        hint: "enter your password",
                        maxLines: 1,
                        isPassword: true,
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "you must enter your password";
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInRight(
                      delay: const Duration(milliseconds: 650),
                      child: Text(
                        "Forget password?",
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 750),
                      child: BorderRoundedButton(
                        title: "Login",
                        color: theme.primaryColor,
                        fontSize: 20,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // calling api login
                            loginViewModel
                                .login(emailController.text,
                                    passwordController.text)
                                .then(
                              (value) {
                                if (value) {
                                  navigatorKey.currentState!
                                      .pushNamedAndRemoveUntil(
                                          PageRoutesNames.layout,
                                          (route) => false);
                                }
                              },
                            );
                          }
                        },
                      ).setVerticalPadding(context, 0.1),
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 850),
                      child: GestureDetector(
                        onTap: () => navigatorKey.currentState!.pushNamed(
                          PageRoutesNames.registration,
                        ),
                        child: Text(
                          "Don’t have an account? Create Account?",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ).setHorizontalPadding(context, 0.05),
              ),
            ),
          ),
        );
        /* switch (state) {
          case LoadingLoginState():
            {
              return Center(
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              );
            }

          case ErrorLoginState():
            {
              return Center(
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              );
            }

          case SuccessLoginState():
            {
              return Scaffold(
                backgroundColor: theme.primaryColor,
                body: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInDown(
                        delay: const Duration(milliseconds: 50),
                        child: Image.asset(
                          "assets/images/route_icn.png",
                        ),
                      ),
                      FadeInRight(
                        delay: const Duration(milliseconds: 50),
                        child: Text(
                          "Welcome Back To Route",
                          style: theme.textTheme.bodyLarge,
                        ).setOnlyPadding(context, 0.05, 0.0, 0.0, 0.0),
                      ),
                      FadeInRight(
                        delay: const Duration(milliseconds: 150),
                        child: Text(
                          "Please sign in with your mail",
                          style: theme.textTheme.bodySmall,
                        ).setOnlyPadding(context, 0.0, 0.05, 0.0, 0.0),
                      ),
                      FadeInRight(
                        delay: const Duration(milliseconds: 250),
                        child: Text(
                          "E-mail",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInRight(
                        delay: const Duration(milliseconds: 350),
                        child: CustomTextField(
                          controller: emailController,
                          hint: "enter your e-mail address",
                          keyboardType: TextInputType.emailAddress,
                          onValidate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "you must enter your e-mail address";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInRight(
                        delay: const Duration(milliseconds: 450),
                        child: Text(
                          "Password",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInRight(
                        delay: const Duration(milliseconds: 550),
                        child: CustomTextField(
                          hint: "enter your password",
                          maxLines: 1,
                          isPassword: true,
                          onValidate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "you must enter your password";
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInRight(
                        delay: const Duration(milliseconds: 650),
                        child: Text(
                          "Forget password?",
                          textAlign: TextAlign.end,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      FadeInRight(
                        delay: const Duration(milliseconds: 750),
                        child: BorderRoundedButton(
                          title: "Login",
                          color: theme.primaryColor,
                          fontSize: 20,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // calling api login
                              loginViewModel
                                  .login(emailController.text,
                                      passwordController.text)
                                  .then(
                                (value) {
                                  if (value) {
                                    navigatorKey.currentState!
                                        .pushNamedAndRemoveUntil(
                                            PageRoutesNames.layout,
                                            (route) => false);
                                  }
                                },
                              );
                            }
                          },
                        ).setVerticalPadding(context, 0.1),
                      ),
                      FadeInRight(
                        delay: const Duration(milliseconds: 850),
                        child: GestureDetector(
                          onTap: () => navigatorKey.currentState!.pushNamed(
                            PageRoutesNames.registration,
                          ),
                          child: Text(
                            "Don’t have an account? Create Account?",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ).setHorizontalPadding(context, 0.05),
                ),
              );
            }
        }*/
      },
    );
  }
}
