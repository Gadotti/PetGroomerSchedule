import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pet_groomer_schedule/controllers/labeled_switch_controller.dart';

class CustomLabeledSwitch extends StatelessWidget {
  const CustomLabeledSwitch({
    this.labelText,
    this.padding,
    this.value,
    this.controller,
  });

  final String labelText;
  final EdgeInsets padding;
  final bool value;
  final LabeledSwitchController controller;

  @override
  Widget build(BuildContext context) {

    controller.value = value;

    return InkWell(
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      onTap: () {
        print('>> tap ${!controller.value}');
        controller.changeValue(!controller.value);
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                labelText,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.grey[600]
                ),
              )
            ),
            Observer(
              builder: (_) {
                return Switch(
                  value: controller.value,
                  onChanged: (bool newValue) {
                    print('>> changed $newValue');
                    controller.value = newValue;
                  },              
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}