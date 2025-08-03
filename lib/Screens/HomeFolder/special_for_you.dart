import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/HomeFolder/special_for_you_component.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class SpecialForYou extends StatefulWidget {
  const SpecialForYou({super.key});

  @override
  State<SpecialForYou> createState() => _SpecialForYouState();
}

class _SpecialForYouState extends State<SpecialForYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr("special_for_you")),
        leading: LeadingAppBar(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return SpecialForYouComponent();
            },
            separatorBuilder: (context , index)=>SizedBox(),
            itemCount: 6,
          ),
        ),
      ),
    );
  }
}
