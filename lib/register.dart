import 'package:flutter/material.dart';
import 'package:flutter_master/api/api_constants.dart';
import 'package:flutter_master/home.dart';
import 'package:flutter_master/register.dart'; // Import the RegisterPage
import 'package:flutter_master/utils/functions.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 138, 120, 1),
                Color.fromRGBO(255, 114, 117, 1),
                Color.fromRGBO(255, 63, 111, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 26),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    ),
                    child: Image.asset(
                      'images/app_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  'Login to continue',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'MuseoModerno',
                  ),
                ),
                const SizedBox(height: 26),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () async {
                    // Perform login action here
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    print('Email: $email');
                    print('Password: $password');

                    if (_validate(email, password)) {
                      var loginResult = await loginUser(email, password);
                      if (loginResult['data']['success']) {
                        Functions.showSuccessToast(
                            loginResult['data']['message']);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      } else {
                        Functions.showErrorToast(
                            loginResult['data']['message']);
                      }
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(
                        double.infinity,
                        50)), // Set the minimum size of the button
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize:
                            18), // Optionally, you can adjust the font size of the button text
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validate(String email, String password) {
    // Perform validation here
    if (email.isNotEmpty && password.isNotEmpty) {
      return true;
    } else {
      Fluttertoast.showToast(
        msg: 'Please enter email and password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    Functions.showLoader(context, 'Please wait...'); // Show loader

    final Uri apiUrl =
        Uri.parse(ApiConstants.loginUrl); // Convert string to Uri
    final response = await http.post(apiUrl, body: {
      'email': email,
      'password': password,
    });

    Functions.hideLoader(context); // Hide loader when task is done

    if (response.statusCode == 200) {
      print(response.body);
      // Successful login
      Map<String, dynamic> responseData = json.decode(response.body);
      return {'success': true, 'data': responseData};
    } else {
      // Failed login
      String errorMessage = 'Login failed';
      if (response.body.isNotEmpty) {
        // If the server returns a specific error message, use it
        errorMessage = json.decode(response.body)['error'];
      }
      return {'success': false, 'error': errorMessage};
    }
  }
}
