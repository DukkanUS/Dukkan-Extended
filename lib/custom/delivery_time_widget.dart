import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date

class DeliveryTimeWidget extends StatefulWidget {
  final Function(String selectedTime) onTimeSelected; // Callback to pass selected time

  const DeliveryTimeWidget({required this.onTimeSelected});

  @override
  _DeliveryTimeWidgetState createState() => _DeliveryTimeWidgetState();
}

class _DeliveryTimeWidgetState extends State<DeliveryTimeWidget>
    with SingleTickerProviderStateMixin {
  bool _isDatePickerExpanded = false;
  TabController? _tabController;

  String? _selectedTodayTime; // Selected time for Today
  String? _selectedTomorrowTime; // Selected time for Tomorrow
  String? _selectedAfterTomorrowTime; // Selected time for After Tomorrow

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  // Method to get available time slots for today
  List<String> _getAvailableTimeSlotsForToday() {
    final now = DateTime.now();
    final currentHour = now.hour;

    // Updated time slots
    if (currentHour < 9) {
      return ['9am - 12pm', '10am - 1pm', '11am - 2pm', '12pm - 3pm', '1pm - 4pm', '2pm - 5pm', '3pm - 6pm'];
    } else if (currentHour < 10) {
      return ['10am - 1pm', '11am - 2pm', '12pm - 3pm', '1pm - 4pm', '2pm - 5pm', '3pm - 6pm'];
    } else if (currentHour < 11) {
      return ['11am - 2pm', '12pm - 3pm', '1pm - 4pm', '2pm - 5pm', '3pm - 6pm'];
    } else if (currentHour < 12) {
      return ['12pm - 3pm', '1pm - 4pm', '2pm - 5pm', '3pm - 6pm'];
    } else if (currentHour < 13) {
      return ['1pm - 4pm', '2pm - 5pm', '3pm - 6pm'];
    } else if (currentHour < 14) {
      return ['2pm - 5pm', '3pm - 6pm'];
    } else if (currentHour < 15) {
      return ['3pm - 6pm'];
    } else {
      return []; // No time slots available
    }
  }

  // Updated time slots for tomorrow and after tomorrow
  List<String> _getTimeSlots() {
    return ['9am - 12pm', '10am - 1pm', '11am - 2pm', '12pm - 3pm', '1pm - 4pm', '2pm - 5pm', '3pm - 6pm'];
  }

  // Method to format the date and day name
  String _getFormattedDay(int daysFromNow) {
    final date = DateTime.now().add(Duration(days: daysFromNow));
    return DateFormat('EEE, MMM d').format(date);
  }

  // Method to handle time selection per tab
  void _handleTimeSelection(String timeSlot, int tabIndex) {
    setState(() {
      if (tabIndex == 0) {
        _selectedTodayTime = timeSlot;
        widget.onTimeSelected('$timeSlot, ${_getFormattedDay(0)}');
        _selectedTomorrowTime = null;
        _selectedAfterTomorrowTime = null;
      } else if (tabIndex == 1) {
        _selectedTomorrowTime = timeSlot;
        widget.onTimeSelected('$timeSlot, ${_getFormattedDay(1)}');
        _selectedTodayTime = null;
        _selectedAfterTomorrowTime = null;
      } else if (tabIndex == 2) {
        _selectedAfterTomorrowTime = timeSlot;
        widget.onTimeSelected('$timeSlot, ${_getFormattedDay(2)}');
        _selectedTodayTime = null;
        _selectedTomorrowTime = null;
      }
    });
  }

  // Method to check if a time slot is selected
  bool _isTimeSelected(String timeSlot, int tabIndex) {
    if (tabIndex == 0) {
      return _selectedTodayTime == timeSlot;
    } else if (tabIndex == 1) {
      return _selectedTomorrowTime == timeSlot;
    } else {
      return _selectedAfterTomorrowTime == timeSlot;
    }
  }

  Widget _buildTimeOption(String timeSlot, int tabIndex) {
    return RadioListTile<String>(
      value: timeSlot,
      groupValue: _isTimeSelected(timeSlot, tabIndex) ? timeSlot : null,
      title: Text(timeSlot),
      onChanged: (value) => _handleTimeSelection(timeSlot, tabIndex),
      activeColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isDatePickerExpanded = !_isDatePickerExpanded;
        });
      },
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isDatePickerExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Row(
                  children: [
                    Image.asset('assets/checkout_icons/Time.png'),
                    const SizedBox(width: 10),
                    Text(
                      _selectedTodayTime != null
                          ? '${_getFormattedDay(0)}: $_selectedTodayTime'
                          : _selectedTomorrowTime != null
                          ? '${_getFormattedDay(1)}: $_selectedTomorrowTime'
                          : _selectedAfterTomorrowTime != null
                          ? '${_getFormattedDay(2)}: $_selectedAfterTomorrowTime'
                          : 'Delivery Time',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  // TabBar for Today, Tomorrow, and After Tomorrow
                  TabBar(
                    controller: _tabController,
                    labelColor: Theme.of(context).primaryColor,
                    indicatorColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: _getFormattedDay(0)),
                      Tab(text: _getFormattedDay(1)),
                      Tab(text: _getFormattedDay(2)),
                    ],
                  ),
                  SizedBox(
                    height: 200, // Set a fixed height for TabBarView
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Today tab with filtered time slots
                        ListView(
                          children: _getAvailableTimeSlotsForToday()
                              .map((timeSlot) => _buildTimeOption(timeSlot, 0))
                              .toList(),
                        ),
                        // Tomorrow tab
                        ListView(
                          children: _getTimeSlots()
                              .map((timeSlot) => _buildTimeOption(timeSlot, 1))
                              .toList(),
                        ),
                        // After tomorrow tab
                        ListView(
                          children: _getTimeSlots()
                              .map((timeSlot) => _buildTimeOption(timeSlot, 2))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            isExpanded: _isDatePickerExpanded,
          ),
        ],
      ),
    );
  }
}
