import 'package:flutter/material.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class SpecialForYouComponent extends StatelessWidget {
  const SpecialForYouComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,

      margin: EdgeInsets.all(3),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.black, Colors.grey],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: tertiaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                easy.tr('limitedTime'),
                style: TextStyle(fontSize: 10),
              ),
            ),
            Text(
              easy.tr('getSpecialOffer'),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: tertiaryColor,
              ),
            ),
            Row(
              children: [
                Text(
                  easy.tr('upTo'),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: tertiaryColor,
                  ),
                ),
                Text(
                  ' 40',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 34,
                    color: tertiaryColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  easy.tr('allServicesTnC'),
                  style: TextStyle(
                    color: tertiaryColor,
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffFFD542),
                  ),
                  child: Text(
                    easy.tr('claim'),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
