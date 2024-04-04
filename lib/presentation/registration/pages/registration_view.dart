import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app_c10_sun/core/config/page_routes_name.dart';
import 'package:e_commerce_app_c10_sun/core/extenions/padding_ext.dart';
import 'package:e_commerce_app_c10_sun/data/model/registration_request_data.dart';
import 'package:e_commerce_app_c10_sun/main.dart';
import 'package:e_commerce_app_c10_sun/presentation/registration/viewModel/cubit.dart';
import 'package:e_commerce_app_c10_sun/presentation/registration/viewModel/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/border_rounded_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var viewModel = RegistrationViewModel();

    return BlocBuilder<RegistrationViewModel, RegistrationStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.primaryColor,
          appBar: AppBar(
            toolbarHeight: 50,
          ),
          body: SingleChildScrollView(
            child: Form(
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
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      "Full Name",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInRight(
                    delay: const Duration(milliseconds: 150),
                    child: CustomTextField(
                      controller: nameController,
                      hint: "enter your Full name",
                      keyboardType: TextInputType.text,
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your full name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInRight(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      "Mobile Number",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInRight(
                    delay: const Duration(milliseconds: 250),
                    child: CustomTextField(
                      controller: phoneController,
                      hint: "enter your mobile number",
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your mobile";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInRight(
                    delay: const Duration(milliseconds: 300),
                    child: Text(
                      "E-mail Address",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInRight(
                    delay: const Duration(milliseconds: 350),
                    child: CustomTextField(
                      controller: emailController,
                      hint: "enter your e-mail address",
                      maxLines: 1,
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
                    delay: const Duration(milliseconds: 400),
                    child: Text(
                      "Password",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInRight(
                    delay: const Duration(milliseconds: 450),
                    child: CustomTextField(
                      controller: passwordController,
                      hint: "enter your password",
                      maxLines: 1,
                      isPassword: true,
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your password !";
                        }

                        var regex = RegExp(
                            r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");

                        if (!regex.hasMatch(value)) {
                          return "The password must include at least \n* one lowercase letter, \n* one uppercase letter, \n* one digit, \n* one special character,\n* at least 6 characters long.";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInRight(
                    delay: const Duration(milliseconds: 500),
                    child: BorderRoundedButton(
                      title: "Sign up",
                      color: theme.primaryColor,
                      fontSize: 20,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var data = RegistrationRequestData(
                            name: nameController.text,
                            password: passwordController.text,
                            rePassword: passwordController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );

                          debugPrint(data.toString());

                          viewModel.singUp(data).then((value) {
                            if (value) {
                              navigatorKey.currentState!
                                  .pushNamedAndRemoveUntil(
                                PageRoutesNames.layout,
                                (route) => false,
                              );
                            }
                          });
                        }
                      },
                    ).setVerticalPadding(context, 0.1),
                  ),
                ],
              ).setHorizontalPadding(context, 0.05),
            ),
          ),
        );
      },
    );
  }
}
