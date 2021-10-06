// stores ExpansionPanel state information
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Device ${index + 1}',
      expandedValue: 'MAC adrs:  EC:FABC:0D',
    );
  });
}

// ...


