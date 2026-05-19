import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static const Color primaryGreen = Color(0xFF173809);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController estateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool agreeTerms = false;
  bool obscurePassword = true;

  Future<void> _createAccount() async {
    final name = nameController.text.trim();
    final estate = estateController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty || estate.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (!agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please agree to the terms first")),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("registeredName", name);
    await prefs.setString("registeredEstate", estate);
    await prefs.setString("registeredEmail", email);
    await prefs.setString("registeredPassword", password);
    await prefs.setBool("isLoggedIn", true);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    estateController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/images/bg2.png", fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.25)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 55),
                  Image.asset("assets/images/logo.png", height: 95),
                  const SizedBox(height: 12),
                  const Text(
                    "Ceylon Tea Smart",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Cultivating the extraordinary.",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 35),

                  Container(
                    padding: const EdgeInsets.all(26),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.88),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Begin Your Journey",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Join our community of tea producers.",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 24),

                        _label("FULL NAME"),
                        _input(
                          controller: nameController,
                          icon: Icons.person_outline,
                          hint: "Julian Thorne",
                        ),
                        const SizedBox(height: 16),

                        _label("ESTATE NAME"),
                        _input(
                          controller: estateController,
                          icon: Icons.map_outlined,
                          hint: "e.g. Nuwara Eliya Estate",
                        ),
                        const SizedBox(height: 16),

                        _label("EMAIL ADDRESS"),
                        _input(
                          controller: emailController,
                          icon: Icons.email_outlined,
                          hint: "julian@verdant.com",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),

                        _label("PASSWORD"),
                        TextField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                            ),
                            hintText: "Enter password",
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.75),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: agreeTerms,
                              activeColor: primaryGreen,
                              onChanged: (value) {
                                setState(() {
                                  agreeTerms = value ?? false;
                                });
                              },
                            ),
                            const Expanded(
                              child: Text(
                                "I agree to the Terms of Service and Privacy Policy.",
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryGreen,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: _createAccount,
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    "OR CONTINUE WITH",
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 2,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide.none,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Google sign-up is not enabled in this prototype.",
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "G   Sign up with Google",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 26),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: primaryGreen,
        ),
      ),
    );
  }

  Widget _input({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.75),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}