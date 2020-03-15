import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pet_groomer_schedule/controllers/labeled_switch_controller.dart';
import 'package:pet_groomer_schedule/widgets/custom_labeled_switch.dart';
import 'package:pet_groomer_schedule/widgets/custom_modal_action_button.dart';

class DeleteAllDialog extends StatelessWidget {
  final _switchFinishController = LabeledSwitchController();

  DeleteAllDialog() {
    _switchFinishController.value = false;
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(      
        mainAxisSize: MainAxisSize.min,        
        children: <Widget>[
          Center(
            child: Text(
              'Confirmação de exclusão',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ),
          SizedBox(
            height: 24,
          ),
          Text('Atenção! Esta operação irá excluir todos os agendamentos já realizados por você para todos os dias. Esta ação não poderá ser revertida.'),
          SizedBox(height: 12),
          CustomLabeledSwitch(
            value: _switchFinishController.value,
            labelText: 'Li e entendo os riscos',
            controller: _switchFinishController,
          ),
          Observer(
            builder: (_) {
              return CustomModalActionButton(
                onClose: () {
                  Navigator.of(context).pop(false);
                },
                onSave: _switchFinishController.value ? () { Navigator.of(context).pop(true); } : null,
              );
            },
          )
          
        ],
      ),
    );
  }
}