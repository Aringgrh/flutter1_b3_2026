import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import '../models/user_model.dart';
import '../services/api_services.dart';
import '../services/dio_client.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  final String? token;
  const ProfilePage({super.key, this.token});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ApiService _apiService;
  UserModel? _userProfile;
  bool _isLoading = true;
  bool _isUploadingPhoto = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _apiService = ApiService(buatDioClient());
    _fetchProfile();
  }

  Future<String?> _getTokenHeader() async {
    if (widget.token != null && widget.token!.trim().isNotEmpty) {
      final t = widget.token!.trim();
      return t.startsWith('Bearer ') ? t : 'Bearer $t';
    }
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('auth_token');
    if (savedToken != null && savedToken.trim().isNotEmpty) {
      final t = savedToken.trim();
      return t.startsWith('Bearer ') ? t : 'Bearer $t';
    }
    return null;
  }

  String _parseDioError(dynamic e, String defaultMsg) {
    if (e is DioException) {
      if (e.response?.data != null && e.response?.data is Map) {
        final map = e.response?.data as Map;
        String msg = map['message']?.toString() ?? defaultMsg;
        if (map['errors'] != null && map['errors'] is Map) {
          final errs = (map['errors'] as Map).values
              .expand((v) => v is List ? v : [v])
              .join('\n');
          if (errs.isNotEmpty && !msg.contains(errs)) {
            msg = '$msg\n$errs';
          }
        }
        return msg;
      }
      if (e.message != null && e.message!.isNotEmpty) {
        return e.message!;
      }
    }
    return e.toString();
  }

  Future<void> _fetchProfile({bool showLoading = true}) async {
    if (showLoading) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
    }

    try {
      final tokenHeader = await _getTokenHeader();
      final response = await _apiService.getProfile(token: tokenHeader);
      final prefs = await SharedPreferences.getInstance();
      final customEmail = prefs.getString('user_custom_email');

      if (mounted) {
        setState(() {
          if (response.data != null) {
            final serverUser = response.data!;
            _userProfile = UserModel(
              id: serverUser.id ?? _userProfile?.id,
              name: (serverUser.name != null && serverUser.name!.isNotEmpty)
                  ? serverUser.name
                  : _userProfile?.name,
              email:
                  customEmail ??
                  _userProfile?.email ??
                  ((serverUser.email != null && serverUser.email!.isNotEmpty)
                      ? serverUser.email
                      : null),
              emailVerifiedAt:
                  serverUser.emailVerifiedAt ?? _userProfile?.emailVerifiedAt,
              profilePhoto:
                  serverUser.profilePhoto ?? _userProfile?.profilePhoto,
              createdAt: serverUser.createdAt ?? _userProfile?.createdAt,
              updatedAt: serverUser.updatedAt ?? _userProfile?.updatedAt,
            );
          }
        });
      }
    } catch (e) {
      if (mounted && showLoading) {
        setState(() {
          _errorMessage = _parseDioError(e, "Gagal memuat profil");
        });
      }
    } finally {
      if (mounted && showLoading) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _handleEditProfile() async {
    if (_userProfile == null) {
      await _fetchProfile();
      if (_userProfile == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gagal memuat profil. Silakan coba lagi.'),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
        return;
      }
    }

    final nameController = TextEditingController(
      text: _userProfile!.name ?? '',
    );
    final emailController = TextEditingController(
      text: _userProfile!.email ?? '',
    );

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (ctx) {
        bool isUpdating = false;
        String? dialogError;

        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Edit Profil'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (dialogError != null) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          dialogError!,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isUpdating ? null : () => Navigator.pop(ctx),
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: isUpdating
                      ? null
                      : () async {
                          final nameText = nameController.text.trim();
                          final emailText = emailController.text.trim();

                          if (nameText.isEmpty) {
                            setDialogState(() {
                              dialogError = 'Nama Lengkap wajib diisi.';
                            });
                            return;
                          }

                          if (emailText.isEmpty) {
                            setDialogState(() {
                              dialogError = 'Email wajib diisi.';
                            });
                            return;
                          }

                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(emailText)) {
                            setDialogState(() {
                              dialogError = 'Format email tidak valid.';
                            });
                            return;
                          }

                          setDialogState(() {
                            isUpdating = true;
                            dialogError = null;
                          });

                          final navigator = Navigator.of(ctx);
                          final messenger = ScaffoldMessenger.of(context);
                          try {
                            final tokenHeader = await _getTokenHeader();
                            final body = <String, dynamic>{
                              'name': nameText,
                              'email': emailText,
                            };

                            final res = await _apiService.editProfile(
                              body,
                              token: tokenHeader,
                            );

                            if (mounted) {
                              final originalEmail = _userProfile?.email;
                              final prefs =
                                  await SharedPreferences.getInstance();
                              if (originalEmail != null &&
                                  originalEmail.isNotEmpty &&
                                  originalEmail.toLowerCase() !=
                                      emailText.toLowerCase()) {
                                await prefs.setString(
                                  'email_alias_${emailText.toLowerCase()}',
                                  originalEmail,
                                );
                              }
                              await prefs.setString(
                                'user_custom_email',
                                emailText,
                              );

                              final updatedUser = UserModel(
                                id: res.data?.id ?? _userProfile?.id,
                                name:
                                    (res.data?.name != null &&
                                        res.data!.name!.isNotEmpty)
                                    ? res.data!.name
                                    : nameText,
                                email: emailText,
                                emailVerifiedAt:
                                    res.data?.emailVerifiedAt ??
                                    _userProfile?.emailVerifiedAt,
                                profilePhoto:
                                    res.data?.profilePhoto ??
                                    _userProfile?.profilePhoto,
                                createdAt:
                                    res.data?.createdAt ??
                                    _userProfile?.createdAt,
                                updatedAt:
                                    res.data?.updatedAt ??
                                    _userProfile?.updatedAt,
                              );

                              setState(() {
                                _userProfile = updatedUser;
                              });

                              navigator.pop();
                              messenger.showSnackBar(
                                SnackBar(
                                  content: Text(
                                    res.message ??
                                        'Profil berhasil diperbarui!',
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              _fetchProfile(showLoading: false);
                            }
                          } catch (e) {
                            if (mounted) {
                              setDialogState(() {
                                dialogError = _parseDioError(
                                  e,
                                  'Gagal memperbarui profil',
                                );
                              });
                            }
                          } finally {
                            setDialogState(() => isUpdating = false);
                          }
                        },
                  child: isUpdating
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Simpan'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _handleUpdatePassword() async {
    if (_userProfile == null) {
      await _fetchProfile();
      if (_userProfile == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gagal memuat profil. Silakan coba lagi.'),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
        return;
      }
    }

    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (ctx) {
        bool isUpdating = false;
        bool hideCurrentPassword = true;
        bool hideNewPassword = true;
        bool hideConfirmPassword = true;
        String? dialogError;

        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Ubah Password'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (dialogError != null) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          dialogError!,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    TextField(
                      controller: currentPasswordController,
                      obscureText: hideCurrentPassword,
                      decoration: InputDecoration(
                        labelText: 'Password Saat Ini',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hideCurrentPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setDialogState(() {
                              hideCurrentPassword = !hideCurrentPassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: newPasswordController,
                      obscureText: hideNewPassword,
                      decoration: InputDecoration(
                        labelText: 'Password Baru',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hideNewPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setDialogState(() {
                              hideNewPassword = !hideNewPassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: hideConfirmPassword,
                      decoration: InputDecoration(
                        labelText: 'Konfirmasi Password Baru',
                        prefixIcon: const Icon(Icons.lock_reset),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hideConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setDialogState(() {
                              hideConfirmPassword = !hideConfirmPassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isUpdating ? null : () => Navigator.pop(ctx),
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: isUpdating
                      ? null
                      : () async {
                          final navigator = Navigator.of(ctx);
                          final messenger = ScaffoldMessenger.of(context);

                          final currentPass = currentPasswordController.text;
                          final newPass = newPasswordController.text;
                          final confirmPass = confirmPasswordController.text;

                          if (currentPass.isEmpty) {
                            setDialogState(() {
                              dialogError = 'Password saat ini wajib diisi.';
                            });
                            return;
                          }

                          final prefs = await SharedPreferences.getInstance();
                          final currentEmail =
                              _userProfile?.email?.toLowerCase() ?? '';
                          final customEmail =
                              prefs
                                  .getString('user_custom_email')
                                  ?.toLowerCase() ??
                              '';
                          final regEmail =
                              prefs
                                  .getString('user_registered_email')
                                  ?.toLowerCase() ??
                              '';

                          final emailsToCheck = {
                            currentEmail,
                            customEmail,
                            regEmail,
                          }..removeWhere((e) => e.isEmpty);

                          String? activePassword;
                          for (final k in emailsToCheck) {
                            if (prefs.containsKey('user_custom_password_$k')) {
                              activePassword = prefs.getString(
                                'user_custom_password_$k',
                              );
                              break;
                            }
                            if (activePassword == null &&
                                prefs.containsKey(
                                  'user_original_password_$k',
                                )) {
                              activePassword = prefs.getString(
                                'user_original_password_$k',
                              );
                            }
                          }

                          if (activePassword != null &&
                              activePassword.isNotEmpty) {
                            if (currentPass != activePassword) {
                              setDialogState(() {
                                dialogError = 'Password saat ini salah.';
                              });
                              return;
                            }
                          }

                          if (newPass.isEmpty) {
                            setDialogState(() {
                              dialogError = 'Password baru wajib diisi.';
                            });
                            return;
                          }

                          if (newPass.length < 6) {
                            setDialogState(() {
                              dialogError = 'Password minimal 6 karakter.';
                            });
                            return;
                          }

                          if (newPass == currentPass) {
                            setDialogState(() {
                              dialogError =
                                  'Password baru tidak boleh sama dengan password saat ini.';
                            });
                            return;
                          }

                          if (newPass != confirmPass) {
                            setDialogState(() {
                              dialogError = 'Konfirmasi password tidak cocok.';
                            });
                            return;
                          }

                          setDialogState(() {
                            isUpdating = true;
                            dialogError = null;
                          });

                          try {
                            final tokenHeader = await _getTokenHeader();
                            final body = <String, dynamic>{
                              'name': _userProfile?.name ?? '',
                              'email': _userProfile?.email ?? '',
                              'current_password': currentPass,
                              'old_password': currentPass,
                              'password': newPass,
                              'new_password': newPass,
                              'password_confirmation': confirmPass,
                              'new_password_confirmation': confirmPass,
                            };

                            final res = await _apiService.editProfile(
                              body,
                              token: tokenHeader,
                            );

                            if (mounted) {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              final currentEmail =
                                  _userProfile?.email?.toLowerCase() ?? '';
                              final customEmail =
                                  prefs
                                      .getString('user_custom_email')
                                      ?.toLowerCase() ??
                                  '';
                              final regEmail =
                                  prefs
                                      .getString('user_registered_email')
                                      ?.toLowerCase() ??
                                  '';

                              final emailsToUpdate = {
                                currentEmail,
                                customEmail,
                                regEmail,
                              }..removeWhere((e) => e.isEmpty);

                              for (final emailKey in emailsToUpdate) {
                                await prefs.setString(
                                  'user_custom_password_$emailKey',
                                  newPass,
                                );
                                await prefs.setString(
                                  'user_original_password_$emailKey',
                                  currentPass,
                                );
                              }

                              if (res.data != null) {
                                final updatedUser = UserModel(
                                  id: res.data?.id ?? _userProfile?.id,
                                  name:
                                      (res.data?.name != null &&
                                          res.data!.name!.isNotEmpty)
                                      ? res.data!.name
                                      : _userProfile?.name,
                                  email:
                                      (res.data?.email != null &&
                                          res.data!.email!.isNotEmpty)
                                      ? res.data!.email
                                      : _userProfile?.email,
                                  emailVerifiedAt:
                                      res.data?.emailVerifiedAt ??
                                      _userProfile?.emailVerifiedAt,
                                  profilePhoto:
                                      res.data?.profilePhoto ??
                                      _userProfile?.profilePhoto,
                                  createdAt:
                                      res.data?.createdAt ??
                                      _userProfile?.createdAt,
                                  updatedAt:
                                      res.data?.updatedAt ??
                                      _userProfile?.updatedAt,
                                );

                                setState(() {
                                  _userProfile = updatedUser;
                                });
                              }

                              navigator.pop();
                              messenger.showSnackBar(
                                SnackBar(
                                  content: Text(
                                    res.message ??
                                        'Password berhasil diperbarui!',
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              _fetchProfile(showLoading: false);
                            }
                          } catch (e) {
                            if (mounted) {
                              setDialogState(() {
                                dialogError = _parseDioError(
                                  e,
                                  'Gagal mengubah password',
                                );
                              });
                            }
                          } finally {
                            setDialogState(() => isUpdating = false);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                  child: isUpdating
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Simpan'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _handleEditPhoto() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.indigo),
              title: const Text('Pilih dari Galeri'),
              onTap: () => Navigator.pop(ctx, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.indigo),
              title: const Text('Ambil Foto Kamera'),
              onTap: () => Navigator.pop(ctx, ImageSource.camera),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      maxWidth: 600,
      maxHeight: 600,
      imageQuality: 85,
    );

    if (pickedFile == null) return;

    setState(() {
      _isUploadingPhoto = true;
    });

    try {
      final bytes = await pickedFile.readAsBytes();
      final String filename = pickedFile.name.toLowerCase();
      String mimeType = 'image/png';
      if (filename.endsWith('.jpg') || filename.endsWith('.jpeg')) {
        mimeType = 'image/jpeg';
      }
      final base64Str = 'data:$mimeType;base64,${base64Encode(bytes)}';

      final tokenHeader = await _getTokenHeader();
      final body = {'profile_photo': base64Str};

      final res = await _apiService.editProfilePhoto(body, token: tokenHeader);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.message ?? 'Foto profil berhasil diperbarui!'),
            backgroundColor: Colors.green,
          ),
        );
        _fetchProfile();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_parseDioError(e, 'Gagal memperbarui foto profil')),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploadingPhoto = false;
        });
      }
    }
  }

  ImageProvider? _getPhotoProvider(String? photo) {
    if (photo == null || photo.trim().isEmpty) return null;
    final trimmed = photo.trim();
    if (trimmed.startsWith('data:image')) {
      try {
        final commaIndex = trimmed.indexOf(',');
        if (commaIndex != -1) {
          final base64Data = trimmed.substring(commaIndex + 1);
          final bytes = base64Decode(base64Data);
          return MemoryImage(bytes);
        }
      } catch (_) {
        return null;
      }
    }
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return NetworkImage(trimmed);
    }
    return NetworkImage(
      'https://appabsensi.mobileprojp.com${trimmed.startsWith('/') ? '' : '/'}$trimmed',
    );
  }

  Future<void> _handleLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await PreferenceHandler.logOut();

    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _fetchProfile),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 60,
                color: Colors.redAccent,
              ),
              const SizedBox(height: 16),
              Text(
                '$_errorMessage',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.redAccent),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _fetchProfile,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    final user = _userProfile;
    final photoProvider = _getPhotoProvider(user?.profilePhoto);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 12),
          // User Avatar & Camera icon
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.indigo.shade100,
                  backgroundImage: photoProvider,
                  onBackgroundImageError: photoProvider != null
                      ? (exception, stackTrace) {
                          // Silently fallback if image fails to load
                        }
                      : null,
                  child: photoProvider == null
                      ? Text(
                          (user?.name != null && user!.name!.isNotEmpty)
                              ? user.name![0].toUpperCase()
                              : 'U',
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        )
                      : null,
                ),
                if (_isUploadingPhoto)
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: _isUploadingPhoto ? null : _handleEditPhoto,
                    borderRadius: BorderRadius.circular(20),
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
          const SizedBox(height: 16),

          // User Name & Email Header
          Text(
            user?.name ?? 'Pengguna',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            user?.email ?? '-',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          const Divider(),
          const SizedBox(height: 12),

          // Detailed Info Cards
          _buildInfoTile(
            Icons.perm_identity,
            'ID Pengguna',
            '${user?.id ?? '-'}',
          ),
          _buildInfoTile(Icons.person_outline, 'Nama', user?.name ?? '-'),
          _buildInfoTile(Icons.email_outlined, 'Email', user?.email ?? '-'),
          if (user?.createdAt != null)
            _buildInfoTile(
              Icons.calendar_today_outlined,
              'Tanggal Terdaftar',
              user!.createdAt!,
            ),

          const SizedBox(height: 28),

          // Action Buttons: Edit Profile, Ubah Password, & Logout
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _handleEditProfile,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profil'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _handleUpdatePassword,
                  icon: const Icon(Icons.lock),
                  label: const Text('Ubah Password'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.indigo.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _handleLogout,
                  icon: const Icon(Icons.logout, color: Colors.redAccent),
                  label: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: Colors.redAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.indigo, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
