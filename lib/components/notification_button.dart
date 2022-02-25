import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/request_dialog.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({Key? key}) : super(key: key);

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
              return const RequestDialog(
                title:
                    'UPray vorrebbe inviarti delle notifiche\nLe notifiche possono includere avvisi, '
                    'suoni e badge icone configurabili in Impostazioni',
                content: "Consenti l'invio di notifiche",
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) => 0),
          backgroundColor: isNotificationEnabled
              ? MaterialStateColor.resolveWith((states) => Colors.green)
              : MaterialStateColor.resolveWith((states) => Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21),
              side: BorderSide(
                  color: isNotificationEnabled ? Colors.green : Colors.black,
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
