import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/batch_model.dart';
import '../models/register_request.dart';
import '../models/training_model.dart';
import '../services/api_services.dart';
import '../services/dio_client.dart';
import 'botnav.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _selectedJenisKelamin;
  int? _selectedBatchId;
  int? _selectedTrainingId;

  File? _imageFile;
  String? _base64Image;

  bool _isLoading = false;
  bool _isObscure = true;
  bool _isLoadingDropdowns = true;

  List<BatchModel> _batches = [];
  List<TrainingModel> _trainings = [];

  late ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = ApiService(buatDioClient());
    _loadDropdownData();
  }

  Future<void> _loadDropdownData() async {
    setState(() {
      _isLoadingDropdowns = true;
    });

    List<BatchModel> defaultBatches = [
      BatchModel(id: 1, batchName: 'Batch 1'),
      BatchModel(id: 2, batchName: 'Batch 2'),
      BatchModel(id: 3, batchName: 'Batch 3'),
      BatchModel(id: 4, batchName: 'Batch 4'),
    ];

    List<TrainingModel> defaultTrainings = [
      TrainingModel(id: 1, title: 'Data Management Staff (Operator Komputer)'),
      TrainingModel(id: 2, title: 'Bahasa Inggris'),
      TrainingModel(id: 3, title: 'Desainer Grafis Madya'),
      TrainingModel(id: 4, title: 'Tata Boga'),
      TrainingModel(id: 5, title: 'Tata Busana'),
      TrainingModel(id: 6, title: 'Perhotelan'),
      TrainingModel(id: 7, title: 'Teknisi Komputer'),
      TrainingModel(id: 8, title: 'Teknisi Jaringan'),
      TrainingModel(id: 9, title: 'Barista'),
      TrainingModel(id: 10, title: 'Bahasa Korea'),
      TrainingModel(id: 11, title: 'Make Up Artist'),
      TrainingModel(id: 12, title: 'Desainer Multimedia'),
      TrainingModel(id: 13, title: 'Content Creator'),
      TrainingModel(id: 14, title: 'Web Programming'),
      TrainingModel(id: 15, title: 'Digital Marketing'),
      TrainingModel(id: 16, title: 'Mobile Programming'),
      TrainingModel(id: 17, title: 'Akuntansi Junior'),
      TrainingModel(id: 18, title: 'Konstruksi Bangunan dengan CAD'),
    ];

    try {
      BatchListResponse? batchResponse;
      TrainingListResponse? trainingResponse;

      try {
        batchResponse = await _apiService.getBatches();
      } catch (_) {}

      try {
        trainingResponse = await _apiService.getTrainings();
      } catch (_) {}

      List<BatchModel> fetchedBatches =
          batchResponse?.data?.where((b) => b.id != null).toList() ?? [];
      List<TrainingModel> fetchedTrainings =
          trainingResponse?.data?.where((t) => t.id != null).toList() ?? [];

      if (mounted) {
        setState(() {
          _batches = fetchedBatches.isNotEmpty
              ? fetchedBatches
              : defaultBatches;
          _trainings = fetchedTrainings.isNotEmpty
              ? fetchedTrainings
              : defaultTrainings;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _batches = defaultBatches;
          _trainings = defaultTrainings;
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingDropdowns = false;
        });
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      maxWidth: 600,
      maxHeight: 600,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      final bytes = await File(pickedFile.path).readAsBytes();
      final base64Str = base64Encode(bytes);

      setState(() {
        _imageFile = File(pickedFile.path);
        _base64Image = 'data:image/png;base64,$base64Str';
      });
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.photo_library,
                    color: Colors.indigo,
                  ),
                  title: const Text('Pilih dari Galeri'),
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: Colors.indigo),
                  title: const Text('Ambil Foto Kamera'),
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final request = RegisterRequest(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        jenisKelamin: _selectedJenisKelamin,
        profilePhoto: (_base64Image != null && _base64Image!.isNotEmpty)
            ? _base64Image
            : null,
        batchId: _selectedBatchId,
        trainingId: _selectedTrainingId,
      );

      final response = await _apiService.register(request);

      if (mounted) {
        final token = response.data?.token;

        if (token != null && token.isNotEmpty) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          final regEmail = _emailController.text.trim();
          final regName = _nameController.text.trim();
          final regEmailLower = regEmail.toLowerCase();

          await prefs.setBool('isLogin', true);
          await prefs.setString('user_login_email', regEmail);
          await prefs.setString('userEmail', regEmail);
          await prefs.setString('user_email', regEmail);
          if (regName.isNotEmpty) {
            await prefs.setString('user_name', regName);
          }
          await prefs.remove('user_custom_email');

          await prefs.setString('user_registered_email', regEmailLower);
          await prefs.setString(
            'user_original_password_$regEmailLower',
            _passwordController.text,
          );

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  response.message ?? 'Registrasi berhasil! Selamat datang.',
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                response.message ?? 'Registrasi berhasil! Silakan login.',
              ),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        String errorMessage = 'Registrasi gagal';
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi Akun'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Avatar Picker
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.indigo.shade50,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : null,
                      child: _imageFile == null
                          ? const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.indigo,
                            )
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _showImageSourceDialog,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.indigo,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Foto Profil',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
              const SizedBox(height: 24),

              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (val) => val == null || val.isEmpty
                    ? 'Nama tidak boleh kosong'
                    : null,
              ),
              const SizedBox(height: 16),

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
                    onPressed: () => setState(() => _isObscure = !_isObscure),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (val.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Jenis Kelamin Field
              DropdownButtonFormField<String>(
                initialValue: _selectedJenisKelamin,
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  prefixIcon: const Icon(Icons.people_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'L', child: Text('Laki-laki')),
                  DropdownMenuItem(value: 'P', child: Text('Perempuan')),
                ],
                onChanged: (val) => setState(() => _selectedJenisKelamin = val),
                validator: (val) => val == null ? 'Pilih jenis kelamin' : null,
              ),
              const SizedBox(height: 16),

              // Batch ID Dropdown
              _isLoadingDropdowns
                  ? const Center(child: CircularProgressIndicator())
                  : DropdownButtonFormField<int>(
                      initialValue: _selectedBatchId,
                      isExpanded: true,
                      hint: const Text('Pilih Batch'),
                      decoration: InputDecoration(
                        labelText: 'Batch',
                        prefixIcon: const Icon(Icons.group_work_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: _batches.map((b) {
                        return DropdownMenuItem<int>(
                          value: b.id,
                          child: Text(
                            b.batchName ?? 'Batch ${b.id}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (val) =>
                          setState(() => _selectedBatchId = val),
                      validator: (val) => val == null ? 'Pilih batch' : null,
                    ),
              const SizedBox(height: 16),

              // Training ID Dropdown
              _isLoadingDropdowns
                  ? const SizedBox()
                  : DropdownButtonFormField<int>(
                      initialValue: _selectedTrainingId,
                      isExpanded: true,
                      hint: const Text('Pilih Pelatihan'),
                      decoration: InputDecoration(
                        labelText: 'Pelatihan',
                        prefixIcon: const Icon(Icons.school_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: _trainings.map((t) {
                        return DropdownMenuItem<int>(
                          value: t.id,
                          child: Text(
                            t.title ?? 'Training ${t.id}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (val) =>
                          setState(() => _selectedTrainingId = val),
                      validator: (val) =>
                          val == null ? 'Pilih pelatihan' : null,
                    ),
              const SizedBox(height: 24),

              // Submit Button
              ElevatedButton(
                onPressed: _isLoading ? null : _handleRegister,
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
                        'Daftar Sekarang',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 16),

              // Link to Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sudah punya akun? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Login disini',
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
    );
  }
}
