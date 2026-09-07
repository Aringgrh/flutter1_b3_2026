import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_request.dart';
import '../services/api_services.dart';
import '../services/dio_client.dart';
import 'botnav.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isObscure = true;

  late ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = ApiService(buatDioClient());
    _checkExistingToken();
  }

  Future<void> _checkExistingToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token != null && token.isNotEmpty && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BotNavPage(token: token)),
      );
    }
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final inputEmail = _emailController.text.trim();
      final inputPassword = _passwordController.text;
      final prefs = await SharedPreferences.getInstance();

      final aliasKey = 'email_alias_${inputEmail.toLowerCase()}';
      final targetEmail = prefs.getString(aliasKey) ?? inputEmail;

      final keysToCheck = {
        inputEmail.toLowerCase(),
        targetEmail.toLowerCase(),
        prefs.getString('user_custom_email')?.toLowerCase() ?? '',
        prefs.getString('user_registered_email')?.toLowerCase() ?? '',
      }..removeWhere((e) => e.isEmpty);

      String? customPass;
      String? origPass;

      for (final k in keysToCheck) {
        if (prefs.containsKey('user_custom_password_$k')) {
          customPass = prefs.getString('user_custom_password_$k');
        }
        if (prefs.containsKey('user_original_password_$k')) {
          origPass = prefs.getString('user_original_password_$k');
        }
      }

      String targetPassword = inputPassword;
      if (customPass != null &&
          customPass == inputPassword &&
          origPass != null &&
          origPass.isNotEmpty) {
        targetPassword = origPass;
      }

      LoginRequest request = LoginRequest(
        email: targetEmail,
        password: targetPassword,
      );

      dynamic response;
      try {
        response = await _apiService.login(request);
      } catch (e) {
        if (targetPassword != inputPassword) {
          try {
            request = LoginRequest(email: targetEmail, password: inputPassword);
            response = await _apiService.login(request);
          } catch (_) {
            final registeredEmail = prefs.getString('user_registered_email');
            if (targetEmail == inputEmail &&
                registeredEmail != null &&
                registeredEmail.isNotEmpty &&
                registeredEmail.toLowerCase() != inputEmail.toLowerCase()) {
              request = LoginRequest(
                email: registeredEmail,
                password: targetPassword,
              );
              response = await _apiService.login(request);
              await prefs.setString(aliasKey, registeredEmail);
            } else {
              rethrow;
            }
          }
        } else {
          final registeredEmail = prefs.getString('user_registered_email');
          if (targetEmail == inputEmail &&
              registeredEmail != null &&
              registeredEmail.isNotEmpty &&
              registeredEmail.toLowerCase() != inputEmail.toLowerCase()) {
            request = LoginRequest(
              email: registeredEmail,
              password: inputPassword,
            );
            response = await _apiService.login(request);
            await prefs.setString(aliasKey, registeredEmail);
          } else {
            rethrow;
          }
        }
      }

      final token = response.data?.token;
      final user = response.data?.user;

      if (token != null && token.isNotEmpty) {
        await prefs.setString('auth_token', token);
        await prefs.setBool('isLogin', true);

        final loginInputEmail = inputEmail;
        final loggedInName = user?.name ?? '';

        await prefs.setString('user_login_email', loginInputEmail);
        await prefs.setString('userEmail', loginInputEmail);
        await prefs.setString('user_email', loginInputEmail);
        if (loggedInName.isNotEmpty) {
          await prefs.setString('user_name', loggedInName);
        }
        await prefs.remove('user_custom_email');

        final origKey = 'user_original_password_${targetEmail.toLowerCase()}';
        if (!prefs.containsKey(origKey)) {
          await prefs.setString(origKey, targetPassword);
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                response.message ?? 'Login berhasil! Selamat datang.',
              ),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BotNavPage(token: token)),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Token tidak ditemukan pada respon.'),
              backgroundColor: Colors.orangeAccent,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        String errorMessage = 'Login gagal';
        if (e is DioException) {
          if (e.response?.data != null) {
            final data = e.response!.data;
            if (data is Map<String, dynamic>) {
              if (data.containsKey('errors') && data['errors'] != null) {
                final errors = data['errors'];
                if (errors is Map<String, dynamic> && errors.isNotEmpty) {
                  errorMessage = errors.values
                      .map((v) => v is List ? v.join(', ') : v.toString())
                      .join('\n');
                } else if (data.containsKey('message') &&
                    data['message'] != null) {
                  errorMessage = data['message'].toString();
                }
              } else if (data.containsKey('message') &&
                  data['message'] != null) {
                errorMessage = data['message'].toString();
              }
            } else if (data is String && data.isNotEmpty) {
              errorMessage = data;
            }
          } else if (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout) {
            errorMessage = 'Koneksi ke server timeout';
          } else if (e.type == DioExceptionType.connectionError) {
            errorMessage =
                'Gagal terhubung ke server. Periksa koneksi internet.';
          } else if (e.message != null && e.message!.isNotEmpty) {
            errorMessage = e.message!;
          }
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo / Header Icon
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.lock_person_outlined,
                      size: 50,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Selamat Datang Kembali!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Silakan login menggunakan email & password akun Anda',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 32),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(val.trim())) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () =>
                            setState(() => _isObscure = !_isObscure),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 28),

                  // Login Button
                  ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),

                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Daftar Sekarang',
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
