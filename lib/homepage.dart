import 'package:flutter/material.dart';
import 'package:unit_conversion/length.dart';
import 'package:unit_conversion/my_header_drawer.dart';
import 'package:unit_conversion/volume.dart';
import 'package:unit_conversion/weight.dart';
import 'package:unit_conversion/temperature.dart';
import 'package:unit_conversion/speed.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var currentPage = DrawerSections.Temperature;
 
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.Temperature) {
      container = TemperaturePage();
    } else if (currentPage == DrawerSections.Length) {
      container = LengthPage();
    } else if (currentPage == DrawerSections.Weight) {
      container = WeightPage();
    } else if (currentPage == DrawerSections.Volume) {
      container = VolumePage();
    } else if (currentPage == DrawerSections.Speed) {
      container = SpeedPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Unit Conversion"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        )),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItems(1, "Temperature",
              currentPage == DrawerSections.Temperature ? true : false),
          menuItems(
              2, "Length", currentPage == DrawerSections.Length ? true : false),
          menuItems(
              3, "Weight", currentPage == DrawerSections.Weight ? true : false),
          menuItems(
              4, "Volume", currentPage == DrawerSections.Volume ? true : false),
          menuItems(
              5, "Speed", currentPage == DrawerSections.Speed ? true : false),
        ],
      ),
    );
  }

  Widget menuItems(int id, String title, bool selected) {
    return Material(
      color: selected ? Colors.blue : Colors.transparent,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                currentPage = DrawerSections.Temperature;
              } else if (id == 2) {
                currentPage = DrawerSections.Length;
              } else if (id == 3) {
                currentPage = DrawerSections.Weight;
              } else if (id == 4) {
                currentPage = DrawerSections.Volume;
              } else if (id == 5) {
                currentPage = DrawerSections.Speed;
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

enum DrawerSections {
  Temperature,
  Length,
  Weight,
  Volume,
  Speed,
}
