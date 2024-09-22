import 'dart:math';
import 'package:flutter/material.dart';
import 'package:to_do_list/service/navigation_to_page.dart';
import 'package:to_do_list/srcreens/home_screen.dart';
import '../model/coffee_model.dart';

class SignUpPage extends StatefulWidget {
  final String? initialEmail;

  const SignUpPage({Key? key, this.initialEmail}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with NavigationToPage {
  String randomString = "";
  bool isVerified = false;
  TextEditingController controller = TextEditingController();
  List<Coffee> coffeeList = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  bool _passwordVisible = false;
  bool _agreeToTerms = false;
  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasDigit = false;
  bool _hasSpecialChar = false;
  final Color _validColor = Colors.green;
  final Color _invalidColor = Colors.red;

  @override
  void initState() {
    super.initState();
    Captcha();
    if (widget.initialEmail != null) {
      _emailController.text = widget.initialEmail!;
    }
    Captcha();
  }

  @override
  void didUpdateWidget(SignUpPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialEmail != oldWidget.initialEmail) {
      _emailController.text = widget.initialEmail ?? '';
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void Captcha() {
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    final random = Random();
    randomString = String.fromCharCodes(List.generate(
        length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));
    setState(() {});
    print("the random string is $randomString");
  }

  void _validatePassword(String password) {
    setState(() {
      _hasMinLength = password.length >= 8;
      _hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
      _hasLowercase = RegExp(r'[a-z]').hasMatch(password);
      _hasDigit = RegExp(r'\d').hasMatch(password);
      _hasSpecialChar = RegExp(r'[@$!%*?&]').hasMatch(password);
    });
  }

  bool get _isPasswordValid =>
      _hasMinLength &&
      _hasUppercase &&
      _hasLowercase &&
      _hasDigit &&
      _hasSpecialChar;

  void _validateForm() {
    if (_formKey.currentState!.validate() &&
        _agreeToTerms &&
        _isPasswordValid &&
        controller.text == randomString) {
      // navigateTo(context,  CoffeeListPage(coffeeList:coffeeList, coffee: const [],));
      print('Login successful');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete the form correctly.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/coffee.jpg',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Email Address *"),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text("Password *"),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    _validatePassword(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                if (!_isPasswordValid)
                  const Text(
                    'Password must meet the following criteria:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                _buildValidationText('• At least 8 characters', _hasMinLength),
                _buildValidationText(
                    '• At least one uppercase letter', _hasUppercase),
                // if (!_isPasswordValid) _buildValidationText('• At least one uppercase letter', _hasUppercase),
                _buildValidationText(
                    '• At least one lowercase letter', _hasLowercase),
                _buildValidationText('• At least one digit', _hasDigit),
                _buildValidationText(
                    '• At least one special character )', _hasSpecialChar),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreeToTerms = value ?? false;
                          if (_agreeToTerms) {
                            _emailFocusNode.requestFocus();
                          }
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _agreeToTerms = !_agreeToTerms;
                          if (_agreeToTerms) {
                            _emailFocusNode.requestFocus();
                          }
                        });
                      },
                      child: const Text('I agree to the terms and conditions'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                  ),
                  onPressed: _validateForm,
                  child: const Text('Sign Up',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 9),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 16),
                  ),
                  onPressed: () {},
                  child: const Text('Login',
                      style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      isVerified = false;
                    });
                  },
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    hintText: "Enter Captcha Value",
                  ),
                  controller: controller,
                  validator: (value) {
                    if(value==randomString){
                      const Row(children: [
                        Icon(Icons.verified), Text("Verified")
                      ],);
                    }
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Captcha';
                    }
                    if (value != randomString) {
                      return 'Incorrect Captcha';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          randomString,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )),
                    const SizedBox(
                      width: 10,
                    ),

                    IconButton(
                        onPressed: () {
                          Captcha();
                        },
                        icon: const Icon(Icons.refresh)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildValidationText(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.error,
          color: isValid ? _validColor : _invalidColor,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? _validColor : _invalidColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
