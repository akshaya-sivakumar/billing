import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final Icon? leadingIcon;
  final bool isTitle;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const TextFieldWidget(
      {Key? key,
      this.isTitle = false,
      required this.controller,
      required this.title,
      this.leadingIcon,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isTitle)
            Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextFormField(
                controller: controller,
                validator: validator,
                // autovalidateMode: AutovalidateMode.always,
                style: Theme.of(context).textTheme.subtitle1,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: leadingIcon,
                    hintText: title,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)))),
          ),
        ],
      ),
    );
  }
}
