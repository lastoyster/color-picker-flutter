import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerApp extends StatefulWidget {
  const ColorPickerApp({super.key});

  @override
  State<ColorPickerApp> createState() => _ColorPickerAppState();
}

class _ColorPickerAppState extends State<ColorPickerApp> {
  Color selectedcolor = Colors.red;
  final colorhistory = [
    Colors.red,
    Colors.amber,
    Colors.teal,
    Colors.blueGrey,
    Colors.indigo
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Color Picker App ',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 15, 140, 202),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                color: selectedcolor,
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: const Text(
                            'Pick Color',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          children: [
                            ColorPicker(
                                pickerColor: selectedcolor,
                                colorHistory: colorhistory,
                                paletteType: PaletteType.rgbWithBlue,
                                onHistoryChanged: (value) {

                                },
                                onColorChanged: (color) {
                                  selectedcolor = color;
                                  setState(() {});
                                }),

                            // BlockPicker(
                            //     pickerColor: selectedcolor,
                            //     availableColors: colorhistory,
                            //     onColorChanged: (color) {
                            //       selectedcolor = color;
                            //       setState(() {});
                            //     }),
                            // HueRingPicker(
                            //     pickerColor: selectedcolor,
                            //     onColorChanged: (color) {
                            //       selectedcolor = color;
                            //       setState(() {});
                            //     }),
                            // MaterialPicker(
                            //     pickerColor: selectedcolor,
                            //     onColorChanged: (color) {
                            //       selectedcolor = color;
                            //       setState(() {});
                            //     }),
                            // SlidePicker(
                            //     pickerColor: selectedcolor,
                            //     onColorChanged: (color) {
                            //       selectedcolor = color;
                            //       setState(() {});
                            //     }),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.deepOrange,
                                child: const Text(
                                  'Select Color',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.teal,
                child: const Text(
                  'Pick Color',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
