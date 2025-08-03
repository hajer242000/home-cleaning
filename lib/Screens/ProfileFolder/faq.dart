import 'package:flutter/material.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<String> faq = [easy.tr( "all"), easy.tr( "services"), easy.tr("general"), easy.tr(  "account")];
  String selected = 'All';

  List<Map<String, String>> faqQ = [
    {
  easy.tr( "question"):easy.tr("whatIfCancelBooking"),
      easy.tr(  "answer"):
         easy.tr("loremText"),
    },
    {
      easy.tr( "question"): easy.tr("isSafeToUseApp"),
      easy.tr( "answer"):
          easy.tr(  "placeholderText")
    },
    {
     easy.tr(  "question"): easy.tr(  "howToReceiveBookingDetails"),
   easy.tr(  "answer"):
         easy.tr("loremDescription"),
    },
    {
         easy.tr( "question"): easy.tr("howToEditProfile"),
     easy.tr( "answer"):
          easy.tr("loremText"),
    },
    {
        easy.tr(  "question"): easy.tr(  "howFilterWorks"),
       easy.tr( "answer"):
          easy.tr( "placeholderDescription"),
    },
    {
      easy.tr(  "question"): easy.tr( "isVoiceOrChatAvailable"),
     easy.tr( "answer"):
         easy.tr(  "loremMessage"),
    },
    {
    easy.tr(  "question"): easy.tr("needToBeHome"),
     easy.tr( "answer"):
         easy.tr("placeholderInfo"),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(15),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...faq.map((toElement) {
                  final isSelected = toElement == selected;
                  return Row(
                    children: [
                      ChoiceChip(
                        label: Text(toElement),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() => toElement = selected);
                        },
                        selectedColor: primaryColor,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        backgroundColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        showCheckmark: false,
                      ),
                      SizedBox(width: 5),
                    ],
                  );
                }),
              ],
            ),
          ),
          // put this inside the widget where you want the FAQs               👇
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                ...faqQ.map((item) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: quaternaryColor,
                      ), 
                      boxShadow: const [
                        BoxShadow(
                      
                          color: Color(0x0F000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                    
                      borderRadius: BorderRadius.circular(12),
                      child: Theme(
                     
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          title: Text(
                            item[ easy.tr( "question")]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          children: [
                            Divider(color: quaternaryColor, height: 1),
                            const SizedBox(height: 8),
                            Text(
                              item[easy.tr( "answer")]!,
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
