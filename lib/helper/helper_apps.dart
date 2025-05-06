import "dart:developer";

import "package:bukuxirplb/config/config_apps.dart";
import "package:bukuxirplb/provider/auth_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:http/http.dart" as http;

class HelperApps {
  final BuildContext context;
  HelperApps(this.context);

  Future<bool> _checkStatusLogin() async {
    final token = context.read<AuthProvider>().token.toString();
    final response =
        await http.get(Uri.parse(ConfigApps.url + ConfigApps.check), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> validasiStatus(String nextPage) async {
    final hasil = await _checkStatusLogin();
    log("status login $hasil");
    if (hasil) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, nextPage);
    }
  }
  Future<void> logout() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.logout();
     // Pindah ke halaman login, clear all history
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    //Navigator.pushReplacementNamed(context, '/login');
  }
}