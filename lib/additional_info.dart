import 'package:flutter/material.dart';
import 'package:weatherapp/additional_card.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AdditionalItem(Icons: (Icons.water_drop),Texts: "Humidity",value: "60%",color: Colors.blue,),
                    AdditionalItem(Icons: (Icons.air),Texts: "Wind",value: "15 km/h", color: Colors.grey,),
                    AdditionalItem(Icons: (Icons.thermostat),Texts: "Pressure",value: "4019 hpa",color: Colors.red,),
       
                  ],
                ),
              )
;
  }
}