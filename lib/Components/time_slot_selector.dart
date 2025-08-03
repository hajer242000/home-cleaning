import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSlotSelector extends StatefulWidget {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Duration interval;
  final ValueChanged<TimeOfDay>? onTimeSelected;

  const TimeSlotSelector({
    super.key,
    required this.startTime,
    required this.endTime,
    this.interval = const Duration(minutes: 30),
    this.onTimeSelected,
  });

  @override
  State<TimeSlotSelector> createState() => _TimeSlotSelectorState();
}

class _TimeSlotSelectorState extends State<TimeSlotSelector> {
  late List<TimeOfDay> _timeSlots;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _generateTimeSlots();
  }

  void _generateTimeSlots() {
    _timeSlots = [];
    var current = widget.startTime;
    while (_compareTime(current, widget.endTime) <= 0) {
      _timeSlots.add(current);
      final nextMinutes = current.minute + widget.interval.inMinutes;
      current = TimeOfDay(
        hour: current.hour + nextMinutes ~/ 60,
        minute: nextMinutes % 60,
      );
    }
  }

  int _compareTime(TimeOfDay a, TimeOfDay b) {
    return a.hour * 60 + a.minute - (b.hour * 60 + b.minute);
  }

  String _formatTime(TimeOfDay time) {
    final dt = DateTime(2023, 1, 1, time.hour, time.minute);
    return DateFormat.jm().format(dt); // يعطيك مثل "7:00 AM"
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: _timeSlots.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final time = _timeSlots[index];
          final isSelected = _selectedTime == time;

          return GestureDetector(
            onTap: () {
              setState(() => _selectedTime = time);
              widget.onTimeSelected?.call(time);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF4F8C78) : Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : const Color(0xFFE0E0E0),
                ),
              ),
              child: Center(
                child: Text(
                  _formatTime(time),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
