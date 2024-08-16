import 'package:flutter/material.dart';

class VolumePage extends StatefulWidget {
  const VolumePage({super.key});

  @override
  State<VolumePage> createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
  final _inputController = TextEditingController();
  String _fromUnit = "Litres";
  String _toUnit = "Millilitres";
  double _result = 0.0;

  void _convertVolume() {
    double input = double.parse(_inputController.text);
    switch (_fromUnit) {
      case "Litres":
        switch (_toUnit) {
          case "Kilolitres":
            _result = input / 1000;
            break;
          case "Millilitres":
            _result = input * 1000;
            break;
          case "cm3":
            _result = input * 1000;
            break;
          case "m3":
            _result = input / 1000;
            break;
        }
        break;
      case "Millilitres":
        switch (_toUnit) {
          case "Litres":
            _result = input / 1000;
            break;
          case "Kilolitres":
            _result = input / 1000000;
            break;
          case "cm3":
            _result = input / 1;
            break;
          case "m3":
            _result = input / 1000000;
            break;
        }
        break;
      case "Kilolitres":
        switch (_toUnit) {
          case "Litres":
            _result = input * 1000;
            break;
          case "Millilitres":
            _result = input * 1000000;
            break;
          case "cm3":
            _result = input * 1000000;
            break;
          case "m3":
            _result = input * 1;
            break;
        }
        break;
      case "cm3":
        {
          if (_toUnit == "Litres") {
            _result = input / 1000;
          } else if (_toUnit == "Millilitres") {
            _result = input * 1;
          } else if (_toUnit == "Kilolitres") {
            _result = input / 1000000;
          } else if (_toUnit == "m3") {
            _result = input / 1000000;
          }
        }
        break;

      case "m3":
        {
          if (_toUnit == "Litres") {
            _result = input * 1000;
          } else if (_toUnit == "Millilitres") {
            _result = input * 1000000;
          } else if (_toUnit == "Kilolitres") {
            _result = input * 1;
          } else if (_toUnit == "cm3") {
            _result = input * 1000000;
          }
        }
    }
    setState(() {
      _result = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var listOptions = [
      const DropdownMenuItem(value: "Litres", child: Text("Litres")),
      const DropdownMenuItem(value: "Kilolitres", child: Text("Kilolitres")),
      const DropdownMenuItem(value: "Millilitres", child: Text("Millilitres")),
      const DropdownMenuItem(value: "cm3", child: Text("cm3")),
      const DropdownMenuItem(value: "m3", child: Text("m3")),
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
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
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
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
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
                                onPressed: _convertVolume,
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
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 10),
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
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 10),
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
                                  onPressed: _convertVolume,
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
