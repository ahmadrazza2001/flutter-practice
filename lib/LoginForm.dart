import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:practice/Lab7T2.dart';
import 'user_provider.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String? _selectedCategory;
  int? _selectedRole;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final List<String> _categories = [
    "Select your campus",
    "Islamabad",
    "Lahore",
    "Karachi",
  ];

  bool _validateCredentials() {
    return _emailController.text == "ahmad@gmail.com" &&
        _passwordController.text == "123456";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple,
                Colors.purple,
                Colors.blue,
              ],
            ),
          ),
        ),
        title: const Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: "Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password should be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              const Text("Select Your Role"),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: _selectedRole,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                ),
                trailing: const Text('Student'),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 2,
                  groupValue: _selectedRole,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                ),
                trailing: const Text('Teacher'),
              ),
              DropdownButton<String>(
                value: _selectedCategory,
                hint: Text("Choose Your Campus"),
                items: _categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_validateCredentials()) {
                      final userProvider =
                          Provider.of<UserProvider>(context, listen: false);
                      userProvider.login(_emailController.text);

                      // Save username, role, and campus in SharedPreferences
                      _saveUserDataInSharedPreferences(
                        _emailController.text,
                        _selectedRole == 1 ? 'Student' : 'Teacher',
                        _selectedCategory ?? 'Select your campus',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Lab7T2()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid Credentials')),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text("LOGIN"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveUserDataInSharedPreferences(
      String username, String role, String campus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('role', role);
    await prefs.setString('campus', campus);
  }
}
