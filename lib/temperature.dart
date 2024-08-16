import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unit_conversion/login.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final _inputController = TextEditingController();
  String _fromUnit = "Celsius";
  String _toUnit = "Fahrenheit";
  double _result = 0.0;

  void _convertTemperature() {
    double input = double.parse(_inputController.text);
    switch (_fromUnit) {
      case "Celsius":
        switch (_toUnit) {
          case "Fahrenheit":
            _result = input * 9 / 5 + 32;
            break;
          case "Kelvin":
            _result = input + 273.15;
            break;
        }
        break;
      case "Fahrenheit":
        switch (_toUnit) {
          case "Celsius":
            _result = (input - 32) * 5 / 9;
            break;
          case "Kelvin":
            _result = (input - 32) * 5 / 9 + 273.15;
            break;
        }
        break;
      case "Kelvin":
        switch (_toUnit) {
          case "Celsius":
            _result = input - 273.15;
            break;
          case "Fahrenheit":
            _result = (input - 273.15) * 9 / 5 + 32;
            break;
        }
        break;
    }
    setState(() {
      _result = _result;
    });
  }

  signOut()async{
    await FirebaseAuth.instance.currentUser;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
 @override
  Widget build(BuildContext context) {
    var listOptions = [
      const DropdownMenuItem(value: "Celsius", child: Text("Celsius")),
      const DropdownMenuItem(value: "Fahrenheit", child: Text("Fahrenheit")),
      const DropdownMenuItem(value: "Kelvin", child: Text("Kelvin")),
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
                                onPressed: _convertTemperature,
                                child: const Text("Convert"),
                              ),
                              padding: EdgeInsets.all(20),
                            ),
                            Padding(padding: EdgeInsets.all(10.0)),
                            Container(
                              child: FloatingActionButton(onPressed: (()=>signOut()), child: Icon(Icons.login_rounded)),
                            )

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
                                  onPressed: _convertTemperature,
                                  child: const Text("Convert"),
                                ),
                              ),
                               Padding(padding: EdgeInsets.all(10.0)),
                              Container(
                                child: FloatingActionButton(onPressed: (()=>signOut()), child: Icon(Icons.login_rounded)),
                              )
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
    }
    );
  }

}
