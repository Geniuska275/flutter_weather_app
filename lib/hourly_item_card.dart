



import 'package:flutter/material.dart';
class HourlyItemCard extends StatelessWidget {
  final String time;
  final IconData Icons;
  final String temp;
  final Color color;
  const HourlyItemCard({super.key,required this.time,required this.Icons, required this.temp,required this.color});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                    width: 100,
                    
                    child: Card(
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(time, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 8,),
                            Icon(Icons, size: 32, color:color),
                            const SizedBox(height: 8,),
                            Text(temp),
                          ],
                          
                        ),
                      ) ,
                    ),
                  );
  }
}