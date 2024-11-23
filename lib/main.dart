import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RadiusProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Corner Radius',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Container Corner Radius')),
        body: RadiusConfigurationSection(),
      ),
    );
  }
}

class RadiusConfigurationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedContainer(), 
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RadiusSlider(
                    label: "TL",
                    getValue: (provider) => provider.topLeftRadius,
                    setValue: (provider, value) => provider.setTopLeftRadius(value),
                  ),
                  RadiusSlider(
                    label: "TR",
                    getValue: (provider) => provider.topRightRadius,
                    setValue: (provider, value) => provider.setTopRightRadius(value),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RadiusSlider(
                    label: "BL",
                    getValue: (provider) => provider.bottomLeftRadius,
                    setValue: (provider, value) => provider.setBottomLeftRadius(value),
                  ),
                  RadiusSlider(
                    label: "BR",
                    getValue: (provider) => provider.bottomRightRadius,
                    setValue: (provider, value) => provider.setBottomRightRadius(value),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RoundedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final radiusProvider = Provider.of<RadiusProvider>(context);

    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusProvider.topLeftRadius),
          topRight: Radius.circular(radiusProvider.topRightRadius),
          bottomLeft: Radius.circular(radiusProvider.bottomLeftRadius),
          bottomRight: Radius.circular(radiusProvider.bottomRightRadius),
        ),
      ),
    );
  }
}