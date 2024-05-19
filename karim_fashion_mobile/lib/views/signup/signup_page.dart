import 'package:flutter/material.dart';
import 'package:karim_fashion/models/kecamatan_model.dart';
import 'package:karim_fashion/models/provinsi_model.dart';
import 'package:karim_fashion/models/user_model.dart';
import 'package:karim_fashion/view_models/daerah_view_model.dart';
import 'package:karim_fashion/view_models/user_view_model.dart';
import 'package:karim_fashion/views/widgets/my_dropdown.dart';
import 'package:karim_fashion/views/widgets/my_button.dart';
import 'package:karim_fashion/views/widgets/form_input.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _kPasswordController = TextEditingController();
  final _alamatController = TextEditingController();
  final _scrollController = ScrollController();

  String _idProvinsi = "";
  String _idKecamatan = "";
  bool _loading = false;
  String _error = "";

  List<ProvinsiModel> _listProvinsi = [];
  List<KecamatanModel> _listKecamatan = [];

  bool validate() {
    if (_usernameController.text.isEmpty) {
      setState(() => _error = "Username tidak boleh kosong");
      return false;
    }
    if (_emailController.text.isEmpty) {
      setState(() => _error = "Email tidak boleh kosong");
      return false;
    }
    if (_noHpController.text.isEmpty) {
      setState(() => _error = "No. HP tidak boleh kosong");
      return false;
    }
    if (_passwordController.text.isEmpty) {
      setState(() => _error = "Password tidak boleh kosong");
      return false;
    }
    if (_alamatController.text.isEmpty) {
      setState(() => _error = "Alamat tidak boleh kosong");
      return false;
    }
    if (_idKecamatan.isEmpty) {
      setState(() => _error = "Kecamatan tidak boleh kosong");
      return false;
    }
    if (_passwordController.text != _kPasswordController.text) {
      setState(() => _error = "Kedua password tidak sama");
      return false;
    }

    return true;
  }

  void submitSignup() {
    if (!validate()) {
      _scrollController.jumpTo(0);
      return;
    }
    setState(() {
      _loading = true;
      _error = "";
    });
    final user = UserModel(
      username: _usernameController.text.trim(),
      email: _emailController.text.trim(),
      hp: _noHpController.text,
      alamat: _alamatController.text.trim(),
      password: _passwordController.text,
      idKecamatan: _idKecamatan,
    );
    context.read<UserViewModel>().register(user).then((error) {
      setState(() {
        _loading = false;
        _error = error;
      });
      if (error.isNotEmpty) {
        _scrollController.jumpTo(0);
        return;
      }
      Navigator.pop(context);
    });
  }

  void getProvinsi() async {
    _listProvinsi = await context.read<DaerahViewModel>().getProvinsi();
    _idProvinsi = _listProvinsi.first.id;
    getKecamatan();
  }

  void getKecamatan() async {
    _listKecamatan =
        await context.read<DaerahViewModel>().getKecamatan(_idProvinsi);
    _idKecamatan = _listKecamatan.first.id;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProvinsi();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _passwordController.dispose();
    _kPasswordController.dispose();
    _alamatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              const Text(
                "Signup",
                style: TextStyle(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset("assets/images/logo.png", height: 80),
              ),
              const SizedBox(height: 16), //----- Jarak
              Text(
                _error,
                style: const TextStyle(color: Colors.red),
              ),
              FormInput(
                label: "Username",
                controller: _usernameController,
              ),
              FormInput(
                label: "Email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              FormInput(
                label: "No HP",
                controller: _noHpController,
                keyboardType: TextInputType.phone,
              ),
              FormInput(
                label: "Password",
                controller: _passwordController,
                obscureText: true,
              ),
              FormInput(
                label: "Konfirmasi Password",
                hintText: "Ketik ulang password",
                controller: _kPasswordController,
                obscureText: true,
              ),
              FormInput(
                label: "Alamat",
                hintText: "Masukkan alamat",
                controller: _alamatController,
                multiline: true,
              ),
              MyDropdown(
                value: _idProvinsi,
                onChange: (value) {
                  setState(() {
                    _idProvinsi = value!;
                    _listKecamatan = [];
                    _idKecamatan = "";
                  });
                  getKecamatan();
                },
                label: "Provinsi",
                item: _listProvinsi.map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.nama),
                  );
                }).toList(),
              ),
              MyDropdown(
                value: _idKecamatan,
                onChange: (value) => setState(() => _idKecamatan = value!),
                label: "Kecamatan",
                item: _listKecamatan.map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.nama),
                  );
                }).toList(),
              ),
              MyButton(
                onPressed: submitSignup,
                margin: const EdgeInsets.only(top: 50),
                text: "Daftar",
                minWidth: double.infinity,
                textColor: Colors.black,
                loading: _loading,
              ),
              const SizedBox(height: 32), //----- Jarak
            ],
          ),
        ),
      ),
    );
  }
}
