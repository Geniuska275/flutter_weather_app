import 'package:flutter/material.dart';
import 'package:weatherapp/additional_info.dart';
import 'package:weatherapp/hourly_item_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              print("refresh");
            },
          ),
        ],
      ),
       body:Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // location
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on, color: Colors.red,),
                const SizedBox(width: 8,),
                Text("San Francisco, CA", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 10,),
          //  main card
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                   Text("300 °K", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16,),
                  Icon(Icons.wb_sunny, size: 64, color: Colors.orange,),
                  const SizedBox(height: 16,),
                
                   Text("Sunny", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                
                 
                  ],
                ),
              ),
            
            ),
          ),
            const SizedBox(height: 20,),
           
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("Mon", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                      Icon(Icons.wb_sunny, size: 32, color: Colors.orange,),
                      const SizedBox(height: 8,),
                      Text("28°C", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Tue", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                      Icon(Icons.cloud, size: 32, color: Colors.grey,),
                      const SizedBox(height: 8,),
                      Text("22°C", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Wed", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                      Icon(Icons.beach_access, size: 32, color: Colors.blue,),
                      const SizedBox(height: 8,),
                      Text("24°C", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Thu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                      Icon(Icons.wb_sunny, size: 32, color: Colors.orange,),
                      const SizedBox(height: 8,),
                      Text("30°C", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Fri", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                      Icon(Icons.cloud, size: 32, color: Colors.grey,),
                      const SizedBox(height: 8,),
                      Text("21°C", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
                 Expanded(
                  child: Column(
                    children: [
                      Text("Sat", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                      Icon(Icons.cloud, size: 32, color: Colors.grey,),
                      const SizedBox(height: 8,),
                      Text("21°C", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
                 Expanded(
                  child: Column(
                    children: [
                      Text("Sun", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                      Icon(Icons.cloud, size: 32, color: Colors.grey,),
                      const SizedBox(height: 8,),
                      Text("21°C", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
              ],
            ),
             
            const SizedBox(height: 20),
             const Text("Weather Forecast", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                 HourlyItemCard( time: "12:22",Icons: Icons.wb_sunny,temp: "403",color: Colors.grey),
                 HourlyItemCard( time: "16:22",Icons: Icons.wb_sunny,temp: "203",color: Colors.grey),
                 HourlyItemCard( time: "14:32",Icons: Icons.cloud_done_sharp,temp: "403", color: Colors.grey),
                 HourlyItemCard( time: "10:00",Icons: Icons.wb_sunny,temp: "203",color: Colors.grey),
                 HourlyItemCard( time: "02:40",Icons: Icons.wb_sunny,temp: "223",color: Colors.grey),
                 HourlyItemCard( time: "04:22",Icons: Icons.wb_sunny,temp: "212",color: Colors.grey),

                  
                ],
              ),
            ),

            const SizedBox(height: 20,),
             const Text("Additional Information", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
               AdditionalInfo()
          ],
         ),
       ),
    );
  }
}



