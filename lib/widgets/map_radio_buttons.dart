import 'package:flutter/material.dart';
import 'package:tlydp/shared/map.dart';

class MapRadioLabel extends StatelessWidget {
  const MapRadioLabel({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (value != groupValue) {
            onChanged(value);
          }
        },
        child: Padding(
            padding: padding,
            child: Row(children: <Widget>[
              Radio<String>(
                groupValue: groupValue,
                value: value,
                onChanged: (String? newValue) {
                  onChanged(newValue!);
                },
              ),
              Text(label),
            ])));
  }
}

class MapRadioButton extends StatefulWidget {
  const MapRadioButton({Key? key}) : super(key: key);

  @override
  _MapRadioButtonState createState() => _MapRadioButtonState();
}

class _MapRadioButtonState extends State<MapRadioButton> {
  String _isRadioSelected = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <MapRadioLabel>[
          MapRadioLabel(
              label: 'All ducks',
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: 'All',
              groupValue: _isRadioSelected,
              onChanged: (String newValue) {
                setState(() {
                  _isRadioSelected = newValue;
                  globalKey.currentState?.getDucks(newValue);
                });
              }),
          MapRadioLabel(
              label: 'Found ducks',
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              groupValue: _isRadioSelected,
              value: 'found',
              onChanged: (String newValue) {
                setState(() {
                  _isRadioSelected = newValue;
                  globalKey.currentState?.getDucks(newValue);
                });
              }),
          MapRadioLabel(
              label: 'Unfound ducks',
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              groupValue: _isRadioSelected,
              value: 'unfound',
              onChanged: (String newValue) {
                setState(() {
                  _isRadioSelected = newValue;
                  globalKey.currentState?.getDucks(newValue);
                });
              })
        ]));
  }
}
