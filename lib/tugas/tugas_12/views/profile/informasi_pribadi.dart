import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/app_textstyle.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/profile/widget_informasi_pribadi.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/database/db_helper.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/model/login_user_model.dart';

import 'package:flutter1_b3_2026/tugas/tugas_12/constants/app_textstyle.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/database/db_helper.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/model/login_user_model.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/profile/widget_profile.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/service/preferencehandler.dart';

class InformasiPribadi extends StatefulWidget {
  const InformasiPribadi({super.key});

  @override
  State<InformasiPribadi> createState() => _InformasiPribadiState();
}

class _InformasiPribadiState extends State<InformasiPribadi> {
  final TextEditingController namaC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController nomorC = TextEditingController();
  final TextEditingController domisiliC = TextEditingController();

<<<<<<< HEAD
=======
  // File? _imageFile;
  // String? _imagePath;
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
  UserModelLoginSQL? currentUser;
  bool isLoading = true;
  bool isSaving = false;

<<<<<<< HEAD
=======
  // final ImagePicker _picker = ImagePicker();

>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    namaC.dispose();
    emailC.dispose();
    nomorC.dispose();
    domisiliC.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
<<<<<<< HEAD
    setState(() {
      isLoading = true;
    });
    try {
      final email = await PreferenceHandler.getUserEmail();
      if (email != null && email.isNotEmpty) {
        final user = await DBHelper().getUserByEmail(email);
        if (user != null) {
          currentUser = user;
          namaC.text = user.nama;
          emailC.text = user.email;
          nomorC.text = user.nomorhp;
          domisiliC.text = user.alamat;
        }
      }
    } catch (e) {
      debugPrint("Error loading user data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
=======
    // Read saved profile image path if available
    // final savedImagePath = PreferenceHandler.getUserProfileImage();
    // if (savedImagePath != null && savedImagePath.isNotEmpty) {
    //   final file = File(savedImagePath);
    //   if (file.existsSync()) {
    //     _imageFile = file;
    //     _imagePath = savedImagePath;
    //   }
    // }

    // Get logged in email
    final email = PreferenceHandler.getUserEmail();
    if (email != null && email.isNotEmpty) {
      final user = await DBHelper().getUserByEmail(email);
      if (user != null) {
        currentUser = user;
        namaC.text = user.nama;
        emailC.text = user.email;
        nomorC.text = user.nomorhp;
        domisiliC.text = user.alamat;
      }
    }

    // Fallback: If no logged in user data found, load first user from DB or default info
    //   if (currentUser == null) {
    //     final allUsers = await DBHelper().getAllUsers();
    //     if (allUsers.isNotEmpty) {
    //       final user = allUsers.last;
    //       currentUser = user;
    //       namaC.text = user.nama;
    //       emailC.text = user.email;
    //       nomorC.text = user.nomorhp;
    //       domisiliC.text = user.alamat;
    //     } else {
    //       namaC.text = "Dina";
    //       emailC.text = "dina@example.com";
    //       nomorC.text = "+62 812-3456-7890";
    //       domisiliC.text = "Jakarta, Indonesia";
    //     }
    //   }

    //   if (mounted) {
    //     setState(() {
    //       isLoading = false;
    //     });
    //   }
    // }

    // Future<void> _pickImage(ImageSource source) async {
    //   try {
    //     final XFile? pickedFile = await _picker.pickImage(
    //       source: source,
    //       maxWidth: 800,
    //       maxHeight: 800,
    //       imageQuality: 85,
    //     );

    //     if (pickedFile != null) {
    //       setState(() {
    //         _imageFile = File(pickedFile.path);
    //         _imagePath = pickedFile.path;
    //       });
    //       await PreferenceHandler.setUserProfileImage(pickedFile.path);
    //     }
    //   } catch (e) {
    //     if (mounted) {
    //       ScaffoldMessenger.of(
    //         context,
    //       ).showSnackBar(SnackBar(content: Text('Gagal memilih gambar: $e')));
    //     }
    //   }
    // }

    // void _showImageSourceDialog() {
    //   showModalBottomSheet(
    //     context: context,
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //     ),
    //     builder: (context) {
    //       return SafeArea(
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 16),
    //           child: Wrap(
    //             children: [
    //               ListTile(
    //                 leading: const Icon(
    //                   Icons.photo_camera,
    //                   color: Color(0xFF006D40),
    //                 ),
    //                 title: const Text('Ambil Foto Kamera'),
    //                 onTap: () {
    //                   Navigator.pop(context);
    //                   _pickImage(ImageSource.camera);
    //                 },
    //               ),
    //               ListTile(
    //                 leading: const Icon(
    //                   Icons.photo_library,
    //                   color: Color(0xFF006D40),
    //                 ),
    //                 title: const Text('Pilih dari Galeri'),
    //                 onTap: () {
    //                   Navigator.pop(context);
    //                   _pickImage(ImageSource.gallery);
    //                 },
    //               ),
    //               if (_imageFile != null)
    //                 ListTile(
    //                   leading: const Icon(
    //                     Icons.delete_outline,
    //                     color: Colors.red,
    //                   ),
    //                   title: const Text(
    //                     'Hapus Foto Profil',
    //                     style: TextStyle(color: Colors.red),
    //                   ),
    //                   onTap: () async {
    //                     Navigator.pop(context);
    //                     setState(() {
    //                       _imageFile = null;
    //                       _imagePath = null;
    //                     });
    //                     await PreferenceHandler.setUserProfileImage('');
    //                   },
    //                 ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   );
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
  }

  Future<void> _saveChanges() async {
    setState(() {
      isSaving = true;
    });

    final newNama = namaC.text.trim();
    final newEmail = emailC.text.trim();
    final newNomor = nomorC.text.trim();
    final newDomisili = domisiliC.text.trim();

    if (currentUser != null && currentUser!.id != null) {
      final updatedUser = UserModelLoginSQL(
        id: currentUser!.id,
        nama: newNama,
        nomorhp: newNomor,
        email: newEmail,
        password: currentUser!.password,
        alamat: newDomisili,
<<<<<<< HEAD
        gambar: currentUser!.gambar,
      );

      final success = await DBHelper().updateUser(updatedUser);
      if (success) {
        await PreferenceHandler.setUserEmail(newEmail);
        currentUser = updatedUser;
      }
    }

=======
      );

      await DBHelper().updateUser(updatedUser);
      currentUser = updatedUser;
    }

    // await PreferenceHandler.setUserEmail(newEmail);
    // if (_imagePath != null) {
    //   await PreferenceHandler.setUserProfileImage(_imagePath!);
    // }

>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
    await Future.delayed(const Duration(milliseconds: 200));

    if (mounted) {
      setState(() {
        isSaving = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informasi pribadi berhasil disimpan!'),
          backgroundColor: Color(0xFF006D40),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Informasi Pribadi",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.secondary),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  // Profile Photo Section
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFEDEEEF),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
<<<<<<< HEAD
                            ),
=======
                              // child: _imageFile != null
                              //     ? ClipRRect(
                              //         borderRadius: BorderRadius.circular(60),
                              //         child: Image.file(
                              //           _imageFile!,
                              //           width: 120,
                              //           height: 120,
                              //           fit: BoxFit.cover,
                              //         ),
                              //       )
                              //     : const Icon(
                              //         Icons.person,
                              //         size: 70,
                              //         color: primaryColor,
                              //       ),
                            ),
                            // Positioned(
                            //   bottom: 2,
                            //   right: 2,
                            //   child: InkWell(
                            //     onTap: _showImageSourceDialog,
                            //     borderRadius: BorderRadius.circular(20),
                            //     child: Container(
                            //       padding: const EdgeInsets.all(8),
                            //       decoration: BoxDecoration(
                            //         color: secondaryColor,
                            //         shape: BoxShape.circle,
                            //         boxShadow: [
                            //           BoxShadow(
                            //             color: Colors.black.withValues(
                            //               alpha: 0.15,
                            //             ),
                            //             blurRadius: 6,
                            //             offset: const Offset(0, 2),
                            //           ),
                            //         ],
                            //       ),
                            //       child: const Icon(
                            //         Icons.photo_camera,
                            //         color: Colors.white,
                            //         size: 18,
                            //       ),
                            //     ),
                            //   ),
                            // ),
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          namaC.text.isEmpty ? "Profil Pengguna" : namaC.text,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF191C1D),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Lengkapi profil untuk pengalaman terbaik",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Form Fields Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama Lengkap
                        buildInputField(
                          label: "NAMA LENGKAP",
                          icon: Icons.person_outline,
                          controller: namaC,
                          hintText: "Masukkan nama lengkap",
                          onChanged: (_) => setState(() {}),
                        ),
                        const SizedBox(height: 18),

                        // Alamat Email
                        buildInputField(
                          label: "ALAMAT EMAIL",
                          icon: Icons.mail_outline,
                          controller: emailC,
                          hintText: "Masukkan email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 18),

                        // Nomor Telepon
                        buildInputField(
                          label: "NOMOR TELEPON",
                          icon: Icons.phone_outlined,
                          controller: nomorC,
                          hintText: "Masukkan nomor telepon",
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 18),

                        // Domisili / Alamat
                        buildInputField(
                          label: "DOMISILI / ALAMAT",
                          icon: Icons.location_on_outlined,
                          controller: domisiliC,
                          hintText: "Masukkan domisili / alamat",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Additional Options Section
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 4,
                          ),
                          leading: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF404941),
                          ),
                          title: const Text(
                            "Ubah Kata Sandi",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF191C1D),
                            ),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Fitur Ubah Kata Sandi dipilih'),
                              ),
                            );
                          },
                        ),
                        const Divider(height: 1, indent: 20, endIndent: 20),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 4,
                          ),
                          leading: const Icon(
                            Icons.verified_user_outlined,
                            color: Color(0xFF404941),
                          ),
                          title: const Text(
                            "Verifikasi Akun",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF191C1D),
                            ),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Fitur Verifikasi Akun dipilih'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),

      // Bottom Action Area
      bottomSheet: isLoading
          ? null
          : Container(
              color: const Color(0xFFF8F9FA),
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 4,
                    ),
                    onPressed: isSaving ? null : _saveChanges,
                    child: isSaving
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Menyimpan...",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : const Text(
                            "Simpan Perubahan",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
    );
  }
}
