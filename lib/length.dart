import 'package:flutter/material.dart';

class LengthPage extends StatefulWidget {
  const LengthPage({super.key});

  @override
  State<LengthPage> createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  final _inputController = TextEditingController();
  String _fromUnit = "Kilometers";
  String _toUnit = "Meters";
  double _result = 0.0;

  void _convertLength() {
    double input = double.parse(_inputController.text);
    switch (_fromUnit) {
      case "Kilometers":
        switch (_toUnit) {
          case "Meters":
            _result = input * 1000;
            break;
          case "Millimeters":
            _result = input * 1000000;
            break;
        }
        break;
      case "Meters":
        switch (_toUnit) {
          case "Kilometers":
            _result = input / 1000;
            break;
          case "Millimeters":
            _result = input * 1000;
            break;
        }
        break;
      case "Millimeters":
        switch (_toUnit) {
          case "Meters":
            _result = input/1000;
            break;
          case "Kilometers":
            _result = input / 1000000;
            break;
        }
        break;
    }
    setState(() {
      _result = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var listOptions = [
      const DropdownMenuItem(value: "Kilometers", child: Text("Kilometers")),
      const DropdownMenuItem(value: "Meters", child: Text("Meters")),
      const DropdownMenuItem(value: "Millimeters", child: Text("Millimeters")),
    ];

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Container(
          decoration: const BoxDecoration( 
            image: DecorationImage(image: 
            AssetImage('assests/back1.jpg',),
            fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _inputController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Value:',
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: DropdownButton(
                                      value: _fromUnit,
                                      onChanged: (value) {
                                        setState(() {
                                          _fromUnit = value!;
                                        });
                                      },
                                      items: listOptions,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.all(20)),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: _result.toString(),
                                    ),
                                    enabled: false,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: DropdownButton(
                                      value: _toUnit,
                                      onChanged: (value) {
                                        setState(() {
                                          _toUnit = value!;
                                        });
                                      },
                                      items: listOptions,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: _convertLength,
                                child: const Text("Convert"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration( 
              image: DecorationImage(image: 
              AssetImage('assests/back.jpg',),
              fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _inputController,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Value:',
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: DropdownButton(
                                        value: _fromUnit,
                                        onChanged: (value) {
                                          setState(() {
                                            _fromUnit = value!;
                                          });
                                        },
                                        items: listOptions,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.all(20)),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: _result.toString(),
                                      ),
                                      enabled: false,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: DropdownButton(
                                        value: _toUnit,
                                        onChanged: (value) {
                                          setState(() {
                                            _toUnit = value!;
                                          });
                                        },
                                        items: listOptions,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Container(
                                child: ElevatedButton(
                                  onPressed: _convertLength,
                                  child: const Text("Convert"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}