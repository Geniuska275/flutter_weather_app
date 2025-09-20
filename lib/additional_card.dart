import 'package:flutter/material.dart';

class AdditionalItem extends StatelessWidget {
  final IconData Icons;
  final String Texts;
  final String value;
  final Color color;
  const AdditionalItem({super.key,required this.Icons, 
  required this.Texts,required this.value,required this.color });

  @override
  Widget build(BuildContext context) {
    return Column(
                      children: [
                        Icon(Icons, color:color,),
                        SizedBox(height: 8,),
                        Text(Texts,style: TextStyle(
                          fontFamily: "Aclonica",
                        ),),
                        SizedBox(height: 4,),
                        Text(value,style: TextStyle(
                          fontFamily: "Aclonica",
                        ),),
                      ],
          );
  }
}