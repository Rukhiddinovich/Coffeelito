import 'package:coffeelito/presentation/widgets/global_button2.dart';
import 'package:coffeelito/utils/colors.dart';
import 'package:coffeelito/utils/constants.dart';
import 'package:coffeelito/utils/icons.dart';
import 'package:coffeelito/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userName;
  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUserName = prefs.getString('userName');
    final savedPhoneNumber = prefs.getString('phoneNumber');

    setState(() {
      userName = savedUserName;
      phoneNumber = savedPhoneNumber;
    });
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    final bool? confirmLogout = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LogoutDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.C_C67C4E,
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.ph,
          CircleAvatar(
              radius: 60.r,
              backgroundImage: const AssetImage(AppIcons.profile)),
          20.ph,
          Text(userName ?? "Jamshid Jo'rayev",
              style: TextStyle(fontSize: 24.sp, color: Colors.black)),
          10.ph,
          Text(phoneNumber ?? "+998912226444",
              style: TextStyle(fontSize: 16.sp, color: Colors.black)),
          20.ph,
          Lottie.asset(AppIcons.loading),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: GlobalButton(
              buttonText: "Log Out",
              iconData: Icons.logout,
              onPressed: () {
                _showLogoutDialog(context);
              },
              buttonColor: AppColors.C_C67C4E,
              textColor: AppColors.white,
              iconColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
