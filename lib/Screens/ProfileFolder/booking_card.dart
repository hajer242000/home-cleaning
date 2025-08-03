import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:homecleaning/Screens/ProfileFolder/booking.dart';
import 'package:homecleaning/Screens/ProfileFolder/cancel_booking.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class BookingCard extends StatefulWidget {
  const BookingCard({super.key, required this.booking});

  final Booking booking;

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final green = primaryColor;
    final border = BorderRadius.circular(20);

    return Material(
      elevation: 2,
      borderRadius: border,
      child: InkWell(
        borderRadius: border,
        onTap: () => setState(() => _expanded = !_expanded),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: border,
              gradient: const LinearGradient(
                colors: [Colors.white, Color(0xFFF7FDFC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// ---------- header row ----------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // thumbnail
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: widget.booking.image,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // category chip
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: quaternaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              widget.booking.category,
                              style: TextStyle(fontSize: 12, color: green),
                            ),
                          ),
                          const SizedBox(height: 4),
                          // title
                          Text(
                            widget.booking.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // provider name
                          Row(
                            children: [
                              Icon(Icons.person, size: 16, color: green),
                              const SizedBox(width: 4),
                              Text(
                                widget.booking.provider,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // price
                          Text(
                            widget.booking.price,
                            style: TextStyle(
                              color: green,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Divider(height: 1),

                /// ---------- collapsed / expanded ----------
                if (_expanded) ...[
                  const SizedBox(height: 16),
                  // date + time row
                  _infoRow(easy.tr("bookingFor"), widget.booking.dateTime),
                  const SizedBox(height: 12),
                  // address row
                  _infoRow(widget.booking.addressLabel, widget.booking.address),
                  const SizedBox(height: 20),
                  // action buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(CancelBooking());
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: quaternaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: BorderSide.none,
                          ),
                          child: Text(easy.tr("cancel"), style: TextStyle(color: green)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // handle e-receipt
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: green,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            easy.tr( "eReceipt"),
                            style: TextStyle(color: tertiaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],

                /// ---------- toggle footer ----------
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => setState(() => _expanded = !_expanded),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _expanded ? easy.tr( "viewLess") : easy.tr( "viewMore"),
                        style: TextStyle(
                          color: green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        _expanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// helper for “Booking for / Address” rows
  Widget _infoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
        Expanded(
          child: Text(value, style: const TextStyle(fontSize: 14, height: 1.5)),
        ),
      ],
    );
  }
}
