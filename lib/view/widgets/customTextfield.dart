import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String hintText, labelText;
  TextEditingController cntr;
  CustomTextfield(this.hintText, this.labelText, this.cntr);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: TextFormField(
                controller: cntr,
                validator: (value) {
                  if (value!.isEmpty) return "Name can't be empty";
                  return null;
                },
                autofocus: false,
               

                decoration: InputDecoration(
                    fillColor: Colors.blue,
                    hintText: hintText,
                    border: InputBorder.none,

                    //  OutlineInputBorder(
                    //     borderRadius: BorderRadius.all(Radius.circular(30))),
                    labelText: labelText,
                    // helperText: _helperText,
                    contentPadding:
                        EdgeInsets.only(right: 0, left: 15, top: 5, bottom: 10),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[300],
                        child: IconButton(
                            icon: Icon(
                              Icons.clear,
                              size: 15,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {
                              cntr.clear();
                            }),
                      ),
                    )))));
  }
}
