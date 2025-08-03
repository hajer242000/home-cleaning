import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Screens/ProfileFolder/help_center.dart';
import 'package:homecleaning/Screens/ProfileFolder/invite_friends.dart';
import 'package:homecleaning/Screens/ProfileFolder/manage_address.dart';
import 'package:homecleaning/Screens/ProfileFolder/my_bookings.dart';
import 'package:homecleaning/Screens/ProfileFolder/password_manager.dart';
import 'package:homecleaning/Screens/ProfileFolder/payment_methods_profile.dart';
import 'package:homecleaning/Screens/ProfileFolder/privacy_policy.dart';
import 'package:homecleaning/Screens/ProfileFolder/your_profile.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void showLogoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: tertiaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const Text(
              'Logout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Divider(color: Colors.grey.shade300),

            const SizedBox(height: 16),
            const Text(
              'Are you sure you want to log out?',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      foregroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      side: BorderSide.none,
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Yes, Logout',
                      style: TextStyle(
                        fontSize: 16,
                        color: tertiaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> profileService = [
      {
        'leadingIcon': Icons.person_2_outlined,
        'title': 'Your profile',
        'onTap': () => Get.to(() => YourProfile()),
      },
      {
        'leadingIcon': Icons.location_pin,
        'title': 'Manage Address',
        'onTap': () => Get.to(() => ManageAddress()),
      },
      {
        'leadingIcon': Icons.credit_card,
        'title': 'Payment Methods',
        'onTap': () => Get.to(() => PaymentMethodProfile()),
      },
      {
        'leadingIcon': Icons.calendar_month,
        'title': 'My Bookings',
        'onTap': ()=>Get.to(()=>MyBookings()),
      },
      {'leadingIcon': Icons.wallet, 'title': 'My Wallet', 'onTap': null},
      {
        'leadingIcon': Icons.settings,
        'title': 'Settings',
        'onTap':()=> Get.to(() => PasswordManager()),
      },
      {
        'leadingIcon': Icons.help,
        'title': 'Help Center',
        'onTap': () => Get.to(() => HelpCenters()),
      },
      {
        'leadingIcon': Icons.lock,
        'title': 'Privacy Policy',
        'onTap': () => Get.to(() => PrivacyPolicy()),
      },
      {
        'leadingIcon': Icons.person_add_alt,
        'title': 'Invites Friends',
        'onTap': () => Get.to(() => InviteFriends()),
      },
      {
        'leadingIcon': Icons.logout,
        'title': 'Log out',
        'onTap': () => showLogoutSheet(context),
      },
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryColor,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: Icon(Icons.edit, color: tertiaryColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: profileService[index]['onTap'] as VoidCallback?,
                      leading: Icon(
                        profileService[index]['leadingIcon'],
                        color: primaryColor,
                      ),
                      title: Text(
                        profileService[index]['title'],
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: primaryColor,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: profileService.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
