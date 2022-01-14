import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/request_dialog.dart';

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
              return RequestDialog(
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.60,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) => 0),
          backgroundColor: isNotificationEnabled
              ? MaterialStateColor.resolveWith((states) => Colors.green)
              : MaterialStateColor.resolveWith((states) => Theme.of(context).iconTheme.color!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                  color: isNotificationEnabled ? Colors.green : Theme.of(context).unselectedWidgetColor,
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
