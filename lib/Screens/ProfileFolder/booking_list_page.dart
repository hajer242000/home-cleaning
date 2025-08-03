import 'package:flutter/material.dart';
import 'package:homecleaning/Screens/ProfileFolder/booking.dart';
import 'package:homecleaning/Screens/ProfileFolder/booking_card.dart'
    show BookingCard;
import 'package:easy_localization/easy_localization.dart' as easy;
class BookingListPage extends StatelessWidget {
  BookingListPage({super.key});

  // a couple of fake rows just so you see something
  final List<Booking> sample = [
    Booking(
      category: easy.tr( "carRepairing"),
      title: easy.tr("suvCarRepairing"),
      provider: easy.tr("bessieCooper"),
      price: '\$180.00',
      dateTime: easy.tr( "bookingDateSample"),
      addressLabel: easy.tr( "home"),
      address: '1901 Thornridge Cir…',
      image: const AssetImage('images/rectangle .png'),
    ),
    Booking(
      category: easy.tr(  "homeCleaning"),
      title: easy.tr("deepHouseCleaning"),
      provider: easy.tr("jennyWilson"),
      price: '\$180.00',
      dateTime: easy.tr(  "bookingDateTime"),
      addressLabel: easy.tr(  "home"),
      address: easy.tr("thornridgeAddress"),
      image: const AssetImage('images/rectangle .png'),
    ),
  ];

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.all(16),
    itemCount: sample.length,
    separatorBuilder: (_, __) => const SizedBox(height: 16),
    itemBuilder: (_, i) => BookingCard(booking: sample[i]),
  );
}
