import 'package:flutter/material.dart'; 
import 'package:flutter/widgets.dart'; 


class LoginPages extends StatefulWidget { // Widget StatefulWidget untuk halaman login
  const LoginPages({super.key}); // Konstruktor dengan key opsional

  @override
  State<LoginPages> createState() => _LoginPagesState(); // Menghubungkan widget ke state-nya
}

class _LoginPagesState extends State<LoginPages> { // Kelas state yang mengatur keadaan dan tampilan halaman login
  final TextEditingController emailTextController = TextEditingController(); // Controller untuk input email/username
  final TextEditingController passwordTextController = TextEditingController(); // Controller untuk input password
  final passwordVisible = false; // Variabel kontrol visibilitas password (belum digunakan dalam kode)
  final _formkey = GlobalKey<FormState>(); // Key untuk validasi form login

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold sebagai struktur utama halaman
      body: Column(
        children: [ 
          // Judul utama aplikasi
          const Center(
            heightFactor: 1.0,
            widthFactor: 5.0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 90, 40, 30),
              child: Text(
                "BukuKu", // Nama aplikasi
                style: TextStyle(
                    color: Color.fromARGB(201, 8, 160, 112), 
                    fontSize: 38, 
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Subjudul halaman login
          const Center(
            heightFactor: 1.2,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(9),
                child: Text(
                  "Login", 
                  style: TextStyle(
                      fontWeight: FontWeight.w500, 
                      fontSize: 18,  
                      color: Color.fromARGB(246, 75, 75, 75)),
                ),
              )
            ]),
          ),
          // Form login dengan opacity rendah (transparan)
          Opacity(
              opacity: 0.3, // Tingkat transparansi form, bisa disesuaikan agar lebih terbaca
              child: Form(
                  key: _formkey,
                  child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(0, 223, 24, 24), // Warna transparan (ARGB 0 = 100% transparan)
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Column(
                          children: [
                            // Kolom input email / username
                            TextFormField(
                              controller: emailTextController, 
                              validator: (value) { 
                                if (value == null || value.isEmpty) {
                                  return 'Email Tidak Boleh Kosong';
                                }
                                return null;
                              },
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  hintText: "Email/ Username", 
                                  prefixIcon: const Icon(
                                    Icons.email, 
                                    color: Colors.black,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                            // Spasi antar input
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: TextFormField(
                                controller: passwordTextController,
                                obscureText: true, // Menyembunyikan inputan password
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password Tidak Boleh Kosong';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    prefixIcon: const Icon(
                                      Icons.key,
                                      color: Colors.black,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                              ),
                            )
                          ],
                        ),
                      )))),
          const SizedBox(height: 30), // Jarak antara form dan tombol login
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            height: 50,
            child: FilledButton(
              onPressed: () {
                if (_formkey.currentState?.validate() ?? false) {
                  print("Login berhasil"); // Validasi berhasil, login dilakukan
                  // Navigator bisa digunakan untuk berpindah halaman setelah login berhasil
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const Color.fromARGB(201, 6, 130, 90); // Warna saat tombol ditekan
                    }
                    return const Color.fromARGB(201, 8, 160, 112); // Warna normal
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna teks putih
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Bentuk tombol membulat
                  ),
                ),
                elevation: MaterialStateProperty.resolveWith<double>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return 1.0; // Elevasi lebih rendah saat ditekan
                    }
                    return 3.0; // Elevasi normal
                  },
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              child: const Text(
                "Login", // Teks pada tombol
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
