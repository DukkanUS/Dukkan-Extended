import 'package:intl/intl.dart'; // For formatting date
import 'package:flutter/material.dart';

class DeliveryTimeWidget extends StatefulWidget {
  @override
  _DeliveryTimeWidgetState createState() => _DeliveryTimeWidgetState();
}

class _DeliveryTimeWidgetState extends State<DeliveryTimeWidget>
    with SingleTickerProviderStateMixin {
  bool _isDatePickerExpanded = false;
  TabController? _tabController;

  // Track selected time slots for each day
  String? _selectedTodayTime;
  String? _selectedTomorrowTime;
  String? _selectedAfterTomorrowTime;

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

    // Available time slots: adjust according to the current time
    if (currentHour < 9) {
      return ['9am - 12pm', '12pm - 3pm', '3pm - 6pm'];
    } else if (currentHour < 12) {
      return ['12pm - 3pm', '3pm - 6pm'];
    } else if (currentHour < 17) {
      return ['3pm - 6pm'];
    } else {
      return []; // No time slots available
    }
  }

  // Time slots for tomorrow and after tomorrow
  List<String> _getTimeSlots() {
    return ['9am - 12pm', '12pm - 3pm', '3pm - 6pm'];
  }

  // Method to format the date and day name
  String _getFormattedDay(int daysFromNow) {
    final date = DateTime.now().add(Duration(days: daysFromNow));
    return DateFormat('EEE, MMM d').format(date); // Example: Mon, Oct 2
  }

  // Method to handle time selection per tab
  void _handleTimeSelection(String timeSlot, int tabIndex) {
    setState(() {
      if (tabIndex == 0) {
        _selectedTodayTime = timeSlot;
      } else if (tabIndex == 1) {
        _selectedTomorrowTime = timeSlot;
      } else if (tabIndex == 2) {
        _selectedAfterTomorrowTime = timeSlot;
      }
      _isDatePickerExpanded = false;
    });
  }

  // Method to show the selected time slot in the header
  String _getSelectedTimeText() {
    final now = DateTime.now();
    if (_selectedTodayTime != null) {
      return '$_selectedTodayTime on Today, ${_getFormattedDay(0)}';
    } else if (_selectedTomorrowTime != null) {
      return '$_selectedTomorrowTime on Tomorrow, ${_getFormattedDay(1)}';
    } else if (_selectedAfterTomorrowTime != null) {
      return '$_selectedAfterTomorrowTime on ${_getFormattedDay(2)}';
    }
    return 'Delivery Time'; // Default text when nothing is selected
  }

  Widget _buildTimeOption(String timeSlot, int tabIndex) {
    bool isSelected = false;
    if (tabIndex == 0 && timeSlot == _selectedTodayTime) {
      isSelected = true;
    } else if (tabIndex == 1 && timeSlot == _selectedTomorrowTime) {
      isSelected = true;
    } else if (tabIndex == 2 && timeSlot == _selectedAfterTomorrowTime) {
      isSelected = true;
    }

    return GestureDetector(
      onTap: () => _handleTimeSelection(timeSlot, tabIndex),
      child: ListTile(
        title: Text(timeSlot),
        trailing: isSelected
            ? Icon(Icons.check, color: Colors.green)
            : null,
      ),
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
                      _getSelectedTimeText(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
            body: Column(
              children: [
                // TabBar for Today, Tomorrow, and After Tomorrow
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Today\n${_getFormattedDay(0)}'),
                    Tab(text: 'Tomorrow\n${_getFormattedDay(1)}'),
                    Tab(text: 'After Tomorrow\n${_getFormattedDay(2)}'),
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
            isExpanded: _isDatePickerExpanded,
          ),
        ],
      ),
    );
  }
}
