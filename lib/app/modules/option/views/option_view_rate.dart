import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/option_controller.dart';

class OptionViewRate extends GetView<OptionController> {
  const OptionViewRate({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.id,
    required this.code,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final int id;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller.rateController,
            validator: (value) {
              if (value != null) {
                if (double.parse(value) <= 0.0 || double.parse(value) >= 10.0) {
                  return "Rate 0 - 10";
                }
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(label: Text('Rate')),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.submitRate(id, code);
              }
            },
            child: Text('Submit'))
      ],
    );
  }
}