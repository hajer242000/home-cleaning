import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:homecleaning/Screens/ExploreFolder/service_provider_details.dart' show ServiceProviderDetails;
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:readmore/readmore.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            easy.tr('aboutService') ,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          ReadMoreText(
          easy.tr('loremText'),
            trimLines: 3,
            colorClickableText: primaryColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: easy.tr('readMore'),
            trimExpandedText: easy.tr('showLess'),
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16, color: Colors.grey),
            moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          Text(
           easy.tr('serviceProvider'),
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: quaternaryColor,
              ),
            ),
            title: InkWell(
              onTap: () {
                Get.to(ServiceProviderDetails());
              },
              child: Text(
                easy.tr('jenny_wilson'),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            subtitle: Text(
              easy.tr('serviceProvider'),
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: HeroIcon(
                    HeroIcons.chatBubbleBottomCenterText,
                    style: HeroIconStyle.solid,
                  ),
                  iconSize: 24,
                  splashRadius: 20,
                  color: primaryColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: HeroIcon(HeroIcons.phone, style: HeroIconStyle.solid),
                  iconSize: 24,
                  splashRadius: 20,
                  color: primaryColor,
                ),
              ],
            ),
          ),
          Text(
           easy.tr('workingHours'),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Divider(),
          SizedBox(
            height: 156,
            child: ListView.builder(
              itemCount: 7,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     easy.tr('monday'),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "00:00 - 00:00",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               easy.tr('address'),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                easy.tr('viewOnMap'),
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Divider(),
          Row(
            children: [
              Icon(Icons.location_pin, color: Colors.grey),
              Text(
               easy.tr('addressSample'),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Center(child: Image.asset("images/map_about.png")),
        ],
      ),
    );
  }
}
