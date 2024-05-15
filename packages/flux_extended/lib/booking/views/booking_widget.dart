import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fstore/common/config.dart';
import 'package:fstore/generated/l10n.dart';
import 'package:fstore/models/booking/booking_model.dart';
import 'package:fstore/models/booking/staff_booking_model.dart';
import 'package:fstore/models/index.dart' show Product;

import '../booking_constants.dart';
import '../viewmodel/booking_viewmodel.dart';
import 'widgets/calendar/calendar.dart';
import 'widgets/choose_time/choose_time_widget.dart';

class BookingWidget extends StatefulWidget {
  final Function(BookingModel)? onBooking;
  final Product product;
  final BookingViewmodel? viewModel;
  final bool requiredStaff;

  const BookingWidget({
    Key? key,
    required this.product,
    required this.viewModel,
    this.onBooking,
    this.requiredStaff = false,
  }) : super(key: key);

  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  BookingViewmodel? get _viewModel => widget.viewModel;
  bool get _staffNotEmpty => _viewModel!.staffs?.isNotEmpty ?? false;

  final BookingModel _info = BookingModel();
  final List<StaffBookingModel> _listStaff = [];
  DateTime _currentDate = DateTime.now();
  StaffBookingModel? _staff;
  DateTime? hour;

  @override
  void initState() {
    hour = _currentDate;

    _info
      ..staffs ??= []
      ..setDay(_currentDate)
      ..idProduct = widget.product.id;

    if (_staffNotEmpty) {
      _staff = _viewModel!.staffs![0];
      _listStaff.addAll(_viewModel!.staffs!);
      _info.staffs!
        ..clear()
        ..add(_staff);
    }

    _viewModel!.addListener(_changeUIByController);
    super.initState();
  }

  void _changeUIByController() {
    if (_viewModel!.staffs?.isNotEmpty ?? false) {
      _listStaff.clear();
      _listStaff.addAll(_viewModel!.staffs!);
      _info.staffs!
        ..clear()
        ..add(_staff);
    }

    setState(() {});
  }

  @override
  void dispose() {
    _viewModel!.removeListener(_changeUIByController);
    super.dispose();
  }

  Widget _renderSlotTime() {
    if (_viewModel!.isLoadingSlot) {
      return SizedBox(
          height: 300, child: Center(child: kLoadingWidget(context)));
    }

    final listSlotTimeBooking =
        widget.viewModel!.listSlotSelect!.map(DateTime.parse).toList();

    return ChooseTimeWidget(
      key: ValueKey('${_viewModel!.selectDate}_keyChooseTime'),
      initValue: hour,
      listSlotTime: listSlotTimeBooking,
      selectDate: _currentDate,
      onChooseTime: (hourChoose) {
        hour = hourChoose;
        _info.setHour(hourChoose);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.product.inStock ?? false) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownSearch<StaffBookingModel>(
              popupProps: PopupPropsMultiSelection.bottomSheet(
                onDismissed: () => Navigator.of(context).pop(),
                itemBuilder: (context, item, isSelected) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(item.displayName ?? ''),
                ),
              ),
              items: _listStaff,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: S.of(context).chooseStaff,
                ),
              ),
              clearButtonProps: const ClearButtonProps(isVisible: true),
              onChanged: (value) {
                _staff = value;
                _viewModel!.updateSlot.call(_currentDate, _staff?.id);
              },
              selectedItem: _staff,
              dropdownBuilder: (context, selectedItem) {
                return Text(selectedItem?.displayName ?? '');
              },
            ),
            Container(
              height: 400,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                    style: BorderStyle.solid,
                    width: 0.5,
                  ),
                ),
              ),
              child: CalendarWidget.booking(
                context,
                key: const ValueKey(BookingConstants.keyBookingChangeDate),
                selectedDateTime: _currentDate,
                onDayPressed: (DateTime date, events) {
                  _info.setDay(date);
                  // hour = null;
                  _viewModel!.updateSlot.call(date, _staff?.id);
                  setState(() => _currentDate = date);
                },
                limitDay: kProductDetail.limitDayBooking,
              ),
            ),
            _renderSlotTime(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 0.1,
              ),
              key: const ValueKey(BookingConstants.keyBookingNow),
              onPressed:
                  (_info.isEmpty) || (widget.requiredStaff && _staff == null)
                      ? null
                      : () => widget.onBooking?.call(_info),
              child: Text(S.of(context).bookingNow),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          S.of(context).outOfStock,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: const Color(0xFFe74c3c),
                fontWeight: FontWeight.w600,
              ),
        ),
      );
    }
  }
}
