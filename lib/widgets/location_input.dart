import "package:flutter/material.dart";
import 'package:flutter_typeahead/flutter_typeahead.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  LocationInputState createState() => LocationInputState();
}

class LocationInputState extends State<LocationInput> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  late String selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _typeAheadController,
                decoration: const InputDecoration(
                  labelText: 'Find ducks near me'
                )
              ),
              // suggestionsCallback: (pattern) {
              //   return CitiesService.getSuggestions(pattern);
              // },
              // itemBuilder: (context, suggestion) {
              //   return ListTile(
              //     title: Text(suggestion),
              //   );
              // },
              // transitionBuilder: (context, suggestionsBox, controller) {
              //   return suggestionsBox;
              // },
              // onSuggestionSelected: (suggestion) {
              //   _typeAheadController.text = suggestion;
              // },
              // validator: (value) {
              //   if (value.isEmpty) {
              //     return 'Please select a city';
              //   }
              // },
              // onSaved: (value) => selectedLocation = value,
            ),
            const SizedBox(height: 10.0,),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print(selectedLocation);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}