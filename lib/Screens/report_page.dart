// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Report"),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  showDialog<Widget>(
                      context: context,
                      builder: (BuildContext context) {
                        return selectdate();
                      });
                },
                child: const Text("Select Date from")),
          ),
          Center(
            child: Text('Selected range: ' + _range),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 3,
          ),
          const Center(
              child: Text(
            "Here is your Report",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Text(
                  "MAC adrs:  EC:FABC:0D",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Spacer(),
                      Text(
                        "Reading",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Spacer(),
                      Text(
                        "Status",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Spacer(),
                    Text(
                      "Volt =",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "226 VAC",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Spacer()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Spacer(),
                      Text(
                        "Unit =",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "53.63 Kwh",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Spacer(),
                    Text(
                      "Load =",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "140 W",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Spacer()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Spacer(),
                      Text(
                        "updated at:",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "10:00 pm",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_field
  String _selectedDate = '';
  // ignore: unused_field
  String _dateCount = '';
  String _range = '';
  // ignore: unused_field
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value == null) {
        // ignore: unnecessary_null_comparison
        _range == null;
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  selectdate() {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      startRangeSelectionColor: Colors.green,
      rangeSelectionColor: Colors.green[200],
      selectionMode: DateRangePickerSelectionMode.multiple,
      cancelText: 'Cancel',
      confirmText: 'Ok',
      backgroundColor: Colors.white,
      endRangeSelectionColor: Colors.green,
      showActionButtons: true,
      onSubmit: (Object value) {
        Navigator.pop(context);
        // ignore: avoid_print
        print(value);
      },
      onCancel: () {
        Navigator.pop(context);
      },
      initialSelectedRange: PickerDateRange(
          DateTime.now().subtract(const Duration(days: 4)),
          DateTime.now().add(const Duration(days: 3))),
    );
  }
}
