import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestDialog extends StatelessWidget {
  final String title;
  final String content;

  const RequestDialog({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).iconTheme.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                AutoSizeText(
                  content,
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
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 0),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blueGrey),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      child: Text("nega".toUpperCase()),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 0),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Theme.of(context).iconTheme.color!),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: Theme.of(context).iconTheme.color!,
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
                            color: Colors.white, fontWeight: FontWeight.bold),
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
  }
}
