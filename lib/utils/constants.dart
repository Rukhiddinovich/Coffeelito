import 'dart:io';

import 'package:coffeelito/presentation/on_boarding/on_boarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLogoutDialog(context);
  }

  Future<void> _clearUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('hasRegistered');
    prefs.remove('isAdmin');
    prefs.remove('userName');
    prefs.remove('phoneNumber');
  }

  Widget _buildLogoutDialog(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: () async {
              await _clearUserData();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await _clearUserData();
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    }
  }
}






class TimeOutConstants {
  static int connectTimeout = 30;
  static int receiveTimeout = 25;
  static int sendTimeout = 60;
}

const String token = "";

class StatusTextConstants {
  static String addProduct = "add_product";
  static String getProduct = "get_product";
  static String updateProduct = "update_product";
  static String deleteProduct = "delete_product";

  static String addOrder="add_order";
  static String getOrder="get_order";
  static String updateOrder="update_order";
  static String deleteOrder="delete_order";
}