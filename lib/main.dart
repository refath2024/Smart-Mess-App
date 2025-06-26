import 'package:flutter/material.dart';

void main() {
  runApp(MessManagerApp());
}

class MessManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mess Manager',
      debugShowCheckedModeBanner: false,
      home: AdminLoginPage(),
    );
  }
}

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedDivision = 'MIST';

  final List<String> divisions = ['MIST', 'Army HQ', 'Navy HQ', 'Air Force HQ'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF004080), Color(0xFF66a6ff)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: screenWidth >= 800 ? 800 : screenWidth * 0.95,
              height: 520,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: screenWidth >= 800
                  ? Row(
                children: [
                  // Login Section
                  Expanded(child: buildLoginCard(context)),
                  // Right Side Writing Section
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF003D99),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Welcome to the Mess Management System',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Efficient and Customized Management Software for \n Officer`s Mess Operations. ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  : buildLoginCard(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo & Title
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/military_logo.png'),
                radius: 24,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Mess Manager", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Admin Login", style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Email
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          // Password
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password *',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),

          // Division Dropdown
          DropdownButtonFormField<String>(
            value: selectedDivision,
            items: divisions.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedDivision = newValue!;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Division *',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),

          // Login Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Add login logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003D99),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Login', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 12),

          // Forgot Password & Redirect
          Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?', style: TextStyle(color: Colors.blue)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Go to Officers Portal →', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
