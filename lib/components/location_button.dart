import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayers/Utility/TGBL.dart';

class LocationButton extends StatefulWidget {
  LocationButton({Key? key}) : super(key: key);

  @override
  State<LocationButton> createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  enableLocation() async {
    PermissionStatus status = await Permission.location.status;
    if (status.isGranted) {
      setState(() {
        isLocationEnabled = true;
      });
    } else {
      status = await Permission.location.request();
      if (status.isGranted) {
        setState(() {
          isLocationEnabled = true;
        });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
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
                                  elevation: MaterialStateProperty.resolveWith(
                                      (states) => 0),
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.blueGrey),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.blueGrey,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                  ),
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("non consentire".toUpperCase()),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.resolveWith(
                                      (states) => 0),
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Color(0xFF1BC0C5)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Color(0xFF1BC0C5),
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  openAppSettings();
                                },
                                child: Text(
                                  "consenti".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
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
          backgroundColor: isLocationEnabled
              ? MaterialStateColor.resolveWith((states) => Colors.green)
              : MaterialStateColor.resolveWith((states) => Color(0xFF80CBC4)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                  color: isLocationEnabled ? Colors.green : Colors.teal,
                  style: BorderStyle.solid,
                  width: 2),
            ),
          ),
        ),
        onPressed: () => enableLocation(),
        child: Text(isLocationEnabled
            ? "Posizione abilitata".toUpperCase()
            : "Abilita posizione".toUpperCase()),
      ),
    );
  }
}
