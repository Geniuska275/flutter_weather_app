import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/additional_info.dart';
import 'package:weatherapp/hourly_item_card.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/secret.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' show placemarkFromCoordinates, Placemark;

class WeatherScreen extends StatefulWidget {
 const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp=0;

  @override
  void initState() {
    super.initState();
    // fetchWeatherData();
    getLocation();
  }

 Position? currentPosition;
  String?  city;
  bool isLoading = false;
  bool isLocation=true;


Future<Position> getCurrentLocation() async {
  // Check if location services are enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  // Check location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied');
    }
  }

  // Get current position
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high
  );
}

Future<String> getCityFromCoordinates(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      return place.locality ?? place.subAdministrativeArea ?? place.administrativeArea ?? 'Unknown';
    }
    return 'Unknown';
  } catch (e) {
    print('Error: $e');
    return 'Unknown';
  }
}
// Usage
void getLocation() async {
  try {
    Position currentPosition = await getCurrentLocation();
    print(currentPosition);
    print('Lat: ${currentPosition.latitude}, Lng: ${currentPosition.longitude}');
    city = await getCityFromCoordinates(currentPosition.latitude, currentPosition.longitude); // San Francisco
    
     setState(() {
      city=city;
      isLocation=false;
     });
  } catch (e) {
    print('Error: $e');
  }
}
    
  String cityName = "San Francisco";
  Future<void> fetchWeatherData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$ApiKey'));
    if (response.statusCode == 200) {
      // Parse the JSON data
      
      final data=jsonDecode(response.body);
      setState(() {
        temp=data["list"][0]["main"]["temp"];
        isLoading=false;
      });
   
      // Update the UI with the fetched data

    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Aclonica",
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
       body:  Padding(
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
                isLocation ? Text("Loading...",
                style: TextStyle(fontFamily: "Aclonica"),):  Text( '$city',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: "Aclonica"),),
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
                     Text( '$temp K', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,fontFamily: "Aclonica"),),
                    const SizedBox(height: 16,),
                    Icon(Icons.wb_sunny, size: 64, color: Colors.orange,),
                    const SizedBox(height: 16,),
                  
                     Text("Sunny", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: "Aclonica"),),
                  
                   
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
                        Text("Mon", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        fontFamily: "Aclonica",
                        ),),
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
                        Text("Tue", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        fontFamily: "Aclonica",
                        ),),
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
                        Text("Wed", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        fontFamily: "Aclonica",
                        ),),
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
                        Text("Thu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        fontFamily: "Aclonica",
                        ),),
                        const SizedBox(height: 8,),
                        Icon(Icons.wb_sunny, size: 32, color: Colors.orange,),
                        const SizedBox(height: 8,),
                        Text("30°C", style: TextStyle(fontSize: 16,
                        fontFamily: "Aclonica",
                        ),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Fri", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        fontFamily: "Aclonica",
                        ),),
                        const SizedBox(height: 8,),
                        Icon(Icons.cloud, size: 32, color: Colors.grey,),
                        const SizedBox(height: 8,),
                        Text("21°C", style: TextStyle(fontSize: 16,
                        fontFamily: "Aclonica",
                        ),),
                      ],
                    ),
                  ),
                   Expanded(
                    child: Column(
                      children: [
                        Text("Sat", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        fontFamily: "Aclonica",
                        ),),
                        const SizedBox(height: 8,),
                        Icon(Icons.cloud, size: 32, color: Colors.grey,),
                        const SizedBox(height: 8,),
                        Text("21°C", style: TextStyle(fontSize: 16,
                        fontFamily: "Aclonica",
                        ),),
                      ],
                    ),
                  ),
                   Expanded(
                    child: Column(
                      children: [
                        Text("Sun", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        fontFamily: "Aclonica",
                        ),),
                        const SizedBox(height: 8,),
                        Icon(Icons.cloud, size: 32, color: Colors.grey,),
                        const SizedBox(height: 8,),
                        Text("21°C", style: TextStyle(fontSize: 16,
                        fontFamily: "Aclonica",
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
               
              const SizedBox(height: 20),
               const Text("Weather Forecast", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                        fontFamily: "Aclonica",
               ),),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                   HourlyItemCard( time: "12:22",Icons: Icons.wb_sunny,temp: "403",color: Colors.grey),
                   HourlyItemCard( time: "16:22",Icons: Icons.wb_sunny,temp: "203",color: Colors.grey),
                   HourlyItemCard( time: "14:32",Icons: Icons.cloud_done_sharp,temp: "403", color: Colors.grey),
                   HourlyItemCard( time: "10:00",Icons: Icons.wb_sunny,temp: "203",color: Colors.orange,),
                   HourlyItemCard( time: "02:40",Icons: Icons.wb_sunny,temp: "223",color: Colors.grey),
                   HourlyItemCard( time: "04:22",Icons: Icons.wb_sunny,temp: "212",color: Colors.grey),
         
                    
                  ],
                ),
              ),
         
              const SizedBox(height: 20,),
               const Text("Additional Information", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                        fontFamily: "Aclonica",
               ),),
                 AdditionalInfo()
            ],
           ),
         ),
       );

  }
}



