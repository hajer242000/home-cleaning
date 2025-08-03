import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  int expandedIndex = -1;

  final List<Map<String, dynamic>> contactOptions = [
    {
      easy.tr("title"): easy.tr("customerService"),
      easy.tr("icon"): Icons.headset_mic_outlined,
      easy.tr("content"): easy.tr("chatWithCustomerService"),
    },
    {
      easy.tr("title"): easy.tr("whatsapp"),
      easy.tr("icon"): FontAwesomeIcons.whatsapp,
      easy.tr("content"): '(480) 555-0103',
    },
    {
      easy.tr("title"): easy.tr("website"),
      easy.tr("icon"): Icons.language,
      easy.tr("content"): 'https://example.com',
    },
    {
      easy.tr("title"): easy.tr("facebook"),
      easy.tr("icon"): FontAwesomeIcons.facebookF,
      easy.tr("content"): '@examplepage',
    },
    {
      easy.tr("title"): easy.tr("twitter"),
      easy.tr("icon"): FontAwesomeIcons.twitter,
      easy.tr("content"): '@examplehandle',
    },
    {
      easy.tr("title"): easy.tr("instagram"),
      easy.tr("icon"): FontAwesomeIcons.instagram,
      easy.tr("content"): '@example.ig',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactOptions.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        final item = contactOptions[index];
        final isExpanded = index == expandedIndex;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ExpansionTile(
              leading: Icon(item[easy.tr("icon")], color: primaryColor),
              title: Text(
                item[easy.tr("title")],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              iconColor: primaryColor,
              collapsedIconColor: primaryColor,
              onExpansionChanged: (expanded) {
                setState(() {
                  expandedIndex = expanded ? index : -1;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 56,
                    right: 16,
                    bottom: 12,
                    top: 4,
                  ),
                  child: Text(
                    item[easy.tr("content")],
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
