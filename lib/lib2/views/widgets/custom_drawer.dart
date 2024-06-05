

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog extends StatelessWidget {
  final Color initialColor;

  ColorPickerDialog({required this.initialColor});

  @override
  Widget build(BuildContext context) {
    Color selectedColor = initialColor;
    return AlertDialog(
      title: Text('Rang tanlash'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: initialColor,
          onColorChanged: (Color color) {
            selectedColor = color;
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Bekor qilish'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Tanlash'),
          onPressed: () {
            Navigator.of(context).pop(selectedColor);
          },
        ),
      ],
    );
  }
}
