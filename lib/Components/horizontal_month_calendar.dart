import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalMonthCalendar extends StatefulWidget {
  /// ارسل التاريخ اللي تحب يبدأ منه التقاويم
  /// إذا تركته فاضي بياخذ تاريخ اليوم.
  final DateTime? initialDate;

  /// كول-باك يرجع التاريخ المختار
  final ValueChanged<DateTime>? onDateSelected;

  const HorizontalMonthCalendar({
    super.key,
    this.initialDate,
    this.onDateSelected,
  });

  @override
  State<HorizontalMonthCalendar> createState() =>
      _HorizontalMonthCalendarState();
}

class _HorizontalMonthCalendarState extends State<HorizontalMonthCalendar> {
  late DateTime _baseDate; // أول يوم في الشهر
  late DateTime _selectedDate; // اليوم (أو المختار)
  late List<DateTime> _days; // قائمة أيام الشهر

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
    _baseDate = DateTime(_selectedDate.year, _selectedDate.month, 1);
    _days = List.generate(
      DateUtils.getDaysInMonth(_baseDate.year, _baseDate.month) -
          _selectedDate.day +
          1,
      (index) => DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day + index,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, index) {
          final date = _days[index];
          final isToday = _isSameDay(date, DateTime.now());
          final isSelected = _isSameDay(date, _selectedDate);

          final bgColor = isSelected
              ? const Color(0xFF4F8C78) 
              : Colors.white;
          final borderColor = isSelected
              ? Colors.transparent
              : const Color(0xFFE0E0E0);

          return GestureDetector(
            onTap: () {
              setState(() => _selectedDate = date);
              widget.onDateSelected?.call(date);
            },
            child: Container(
              width: 100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: bgColor,
                border: Border.all(color: borderColor, width: 1.2),
                borderRadius: BorderRadius.circular(40), 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isToday
                        ? 'Today'
                        : DateFormat.E().format(date), // Mon, Tue …
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${DateFormat.d().format(date)} ${DateFormat.MMM().format(date)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
