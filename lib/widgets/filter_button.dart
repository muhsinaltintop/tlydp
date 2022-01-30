// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tlydp/widgets/map_radio_buttons.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  List<ExpansionItem> item = <ExpansionItem>[
    ExpansionItem(isExpanded: false, header: 'Filter map')
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) =>
              setState(() => item[index].isExpanded = !item[index].isExpanded),
          animationDuration: Duration(milliseconds: 1000),
          dividerColor: Colors.red,
          elevation: 1,
          children: item.map((ExpansionItem item) {
            return ExpansionPanel(
              backgroundColor: Colors.amber,
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(item.header,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                );
              },
              isExpanded: item.isExpanded,
              body: Container(height: 100, child: MapRadioButton()),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ExpansionItem {
  bool isExpanded;
  final String header;

  ExpansionItem({required this.isExpanded, required this.header});
}
