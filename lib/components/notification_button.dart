import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayers/Utility/TGBL.dart';

class NotificationButton extends StatefulWidget {
  NotificationButton({Key? key}) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  enableNotification() async {
    PermissionStatus status = await Permission.notification.status;
    if (status.isGranted) {
      setState(() {
        isNotificationEnabled = true;
      });
    } else {
      status = await Permission.notification.request();
      if (status.isGranted) {
        setState(() {
          isNotificationEnabled = true;
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
                            "Consenti l'invio di notifiche",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          AutoSizeText(
                            'UPray vorrebbe inviarti delle notifiche\nLe notifiche possono includere avvisi, '
                            'suoni e badge icone configurabili in Impostazioni',
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
                                      (states) => 00),
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
          backgroundColor: isNotificationEnabled
              ? MaterialStateColor.resolveWith((states) => Colors.green)
              : MaterialStateColor.resolveWith((states) => Color(0xFF80CBC4)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                  color: isNotificationEnabled ? Colors.green : Colors.teal,
                  style: BorderStyle.solid,
                  width: 2),
            ),
          ),
        ),
        onPressed: () => enableNotification(),
        child: Text(
          isNotificationEnabled
              ? "Notifiche abilitate".toUpperCase()
              : "Abilita notifiche".toUpperCase(),
        ),
      ),
    );
  }
}
