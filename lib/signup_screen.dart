import 'package:flutter/material.dart';
import 'package:shopping_app/lang/app_loalizations.dart';
import 'package:shopping_app/shopping_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 550),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.create_account,
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.join,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ],
                        ),

                        const SizedBox(height: 50),

                        CustomFormField(
                          label: AppLocalizations.of(context)!.full_name,
                          hint: AppLocalizations.of(context)!.full_name_hint,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.required;
                            }
                            if (value[0] != value[0].toUpperCase()) {
                              return 'First letter must be uppercase';
                            }
                            return null;
                          },
                        ),
                        CustomFormField(
                          label: AppLocalizations.of(context)!.email,
                          hint: AppLocalizations.of(context)!.email_hint,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.required;
                            }
                            if (!value.contains('@'))
                              return 'Email is not valid';
                            return null;
                          },
                        ),
                        CustomFormField(
                          label: AppLocalizations.of(context)!.password,
                          hint: AppLocalizations.of(context)!.password_hint,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.required;
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 letters';
                            }
                            return null;
                          },
                          controller: passwordController,
                        ),
                        CustomFormField(
                          label: AppLocalizations.of(context)!.confirm_password,
                          hint: AppLocalizations.of(
                            context,
                          )!.confirm_password_hint,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.required;
                            }
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 8,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Column(
                                          mainAxisSize: MainAxisSize
                                              .min, 
                                          children: [
                                            const Text(
                                              'Welcome!',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              "Account created successfully",
                                            ),
                                            const SizedBox(height: 20),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(
                                                  context,
                                                ); 
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ShoppingScreen(),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                'Continue',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                              ),
                              child: const Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hint,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(),
            ),
            validator: validator,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
