
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
MaritalStatus? maritalValue;
enum MaritalStatus { single, married, widow, divorced }
Map<MaritalStatus, String> maritalMap = {
  MaritalStatus.single: "single",
  MaritalStatus.married: "married",
  MaritalStatus.widow: "widow",
  MaritalStatus.divorced: "divorced"
};
List<DropdownMenuItem<MaritalStatus>> MaritalStatusList = [
  DropdownMenuItem(
    child: Text(maritalMap[MaritalStatus.single]!),
    value: MaritalStatus.single,
  ),
    DropdownMenuItem(
    child: Text(maritalMap[MaritalStatus.married]!),
    value: MaritalStatus.married,
  ),
    DropdownMenuItem(
    child: Text(maritalMap[MaritalStatus.widow]!),
    value: MaritalStatus.widow,
  ),
    DropdownMenuItem(
    child: Text(maritalMap[MaritalStatus.divorced]!),
    value: MaritalStatus.divorced,
  ),
];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController nameCtrl, LastCtrl;
  late double sliderValue;
  late String msgToUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Interact with User'),
        ),
        body: buildMainColumn(),
      ),
    );
  }

  buildMainColumn() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildTopScreen(),
            buildTextArea(),
            BuildDropButtonArea(),
            buildSliderArea(),
            buildElevatedArea(),
            buildResultArea(),

          ],
        ),
      ),
    );
  }

  buildTopScreen() {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController();
    LastCtrl = TextEditingController();
    sliderValue = 5;
    msgToUser = 'Your Results Appear Here!!';
  }

  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
    LastCtrl.dispose();
  }

  buildTextArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          buildMyField(
            'First Name',
            nameCtrl,
          ),
          const SizedBox(height: 20),
          buildMyField(
            'Last Name',
            LastCtrl,
          ),
        ],
      ),
    );
  }

  buildMyField(String label, TextEditingController textCtrl) {
    return TextField(
      controller: textCtrl,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  void updateSlider(double newValue) {
    setState(() {
      sliderValue = newValue.round().toDouble();
    });
  }

  buildSliderArea() {
    return Column(
      children: [
        const Divider(),
        const Text(
          'How much do you like Football?',
          textScaleFactor: 1.3,
        ),
        Slider(
          min: 0,
          max: 10,
          divisions: 10,
          label: sliderValue.round().toString(),
          value: sliderValue,
          onChanged: updateSlider,
        ),
      ],
    );
  }

  buildElevatedArea() => ElevatedButton(
        onPressed: showResults,
        child: const Text('Show'),
        
      );
  void showResults() {
    setState(() {
      msgToUser = nameCtrl.text +
          ' ' +
          LastCtrl.text +
          ' ' +
          ' ' +
          sliderValue.toString();
    });
  }

  buildResultArea() {
    //Expanded( Container())
    return Container(
      child: Text(
        msgToUser,
        textScaleFactor: 1.25,
      ),
    );
  }

  BuildDropButtonArea() {
    return Row(
      children: [
        DropdownButton(value: maritalValue ,items: MaritalStatusList ,onChanged: updatemaritalValue ,)
      ],
    );
  }

  void updatemaritalValue(MaritalStatus? newValue) {
    setState(() {
      maritalValue=newValue!;
    });
  }
}
