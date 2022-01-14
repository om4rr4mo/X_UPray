
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart' as locationPackage;
import 'package:permission_handler/permission_handler.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/theme_provider.dart';

class LocationButton extends StatefulWidget {
  LocationButton({Key? key}) : super(key: key);

  @override
  State<LocationButton> createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  enableLocation() async {
    locationPackage.PermissionStatus _permission = locationPackage.PermissionStatus.DENIED;

    locationPackage.Location _locationService = new locationPackage.Location();

    await _locationService.changeSettings(accuracy: locationPackage.LocationAccuracy.HIGH, interval: 1000);

    bool serviceStatus = await _locationService.serviceEnabled();
    print("Service status: $serviceStatus");
    if (serviceStatus) {
      _permission = await _locationService.requestPermission();
      print("Permission: $_permission");
      if (_permission == locationPackage.PermissionStatus.GRANTED) {
        setState(() {
          isLocationEnabled = true;
        });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Theme.of(context).iconTheme.color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                //this right here
                child: Wrap(
                  //constraints: BoxConstraints.expand(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Consenti l'utilizzo della posizione",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          AutoSizeText(
                            'UPray vorrebbe utilizzare la tua posizione\n'
                            'Consenti a UPray di utilizzare la tua posizione per calcolare al meglio gli orari delle preghiere e la direzione della qibla',
                            maxLines: 4,
                            minFontSize: 17,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.resolveWith((states) => 0),
                                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blueGrey),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid, width: 2),
                                    ),
                                  ),
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("nega".toUpperCase()),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.resolveWith((states) => 0),
                                  backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).iconTheme.color!),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Theme.of(context).iconTheme.color!, style: BorderStyle.solid, width: 2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  openAppSettings();
                                },
                                child: Text(
                                  "consenti".toUpperCase(),
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      }
    } else {
      bool serviceStatusResult = await _locationService.requestService();
      print("Service status activated after request: $serviceStatusResult");
      if (serviceStatusResult) {
        enableLocation();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.60,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) => 0),
          backgroundColor: isLocationEnabled ? MaterialStateColor.resolveWith((states) => Colors.green) : MaterialStateColor.resolveWith((states) => Theme.of(context).iconTheme.color!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: isLocationEnabled ? Colors.green : Theme.of(context).unselectedWidgetColor, style: BorderStyle.solid, width: 2),
            ),
          ),
        ),
        onPressed: () => enableLocation(),
        child: Text(isLocationEnabled ? "Posizione abilitata".toUpperCase() : "Abilita posizione".toUpperCase()),
      ),
    );
  }
}
