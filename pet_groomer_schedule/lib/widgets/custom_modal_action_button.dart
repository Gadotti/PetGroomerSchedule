import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/widgets/custom_button_flat.dart';
import 'package:pet_groomer_schedule/widgets/custom_button_raised.dart';

class CustomModalActionButton extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onSave;

  CustomModalActionButton({@required this.onClose, @required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButtonFlat(
          onPressed: onClose,
          buttonText: 'Fechar',
        ),
        CustomButtonRaised(
          onPressed: onSave,
          buttonText: 'Salvar',          
        )
      ],
    );
  }
}
