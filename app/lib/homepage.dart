import 'package:flutter/material.dart';
import 'components.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //sized box to lower down The App title
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: const Text(
                  'Live Safe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Earthquake card
              const WeatherCard(),

              Disaster(
                  photo: const AssetImage("Images/earthquake-2.jpg"),
                  txt: "Earthquake",
                  txtroute: () {
                    Navigator.pushNamed(context, "/3rd");
                  }),
              // Flood card
              Disaster(
                  photo: const AssetImage("Images/flood-2.jpg"),
                  txt: "Flood",
                  txtroute: () {
                    Navigator.pushNamed(context, "/2nd");
                  }),
              // Cyclone card
              Disaster(
                  photo: const AssetImage("Images/cyclone-1.jpg"),
                  txt: "Cyclone",
                  txtroute: () {
                    Navigator.pushNamed(context, "/4th");
                  }),
              // Landslide card
              Disaster(
                  photo: const AssetImage("Images/landslide-3.jpg"),
                  txt: "Landslide",
                  txtroute: () {
                    Navigator.pushNamed(context, "/5th");
                  }),
              // Tornado card
              Disaster(
                  photo: const AssetImage("Images/tornado-1.jpg"),
                  txt: "Tornado",
                  txtroute: () {
                    Navigator.pushNamed(context, "/6th");
                  }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy weather data
    final weatherData = {
      'name': 'India',
      'main': {
        'temp': 41.0,
        'humidity': 63,
      },
      'weather': [
        {'description': 'Mostly cloudy'}
      ],
      'wind': {
        'speed': 5.0,
      },
    };

    return Card(
      margin: const EdgeInsets.all(6.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              weatherData['name'] as String,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${(weatherData['main'] as Map)['temp']}°C',
              style: const TextStyle(fontSize: 48.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              (weatherData['weather'] as List)[0]['description'],
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.water_drop),
                const SizedBox(width: 4.0),
                Text('${(weatherData['main'] as Map)['humidity']}%'),
                const SizedBox(width: 16.0),
                const Icon(Icons.air),
                const SizedBox(width: 4.0),
                Text('${(weatherData['wind'] as Map)['speed']} m/s'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
