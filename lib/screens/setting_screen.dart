import 'package:cwiz/app_manager/theme_manager.dart';
import 'package:cwiz/cwiz_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var darkProvider = Provider.of<ThemeManager>(context, listen: true);
    darkProvider.getToggeldValue();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.dark_mode,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Dark Mode',
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Switch(
                  value: darkProvider.isToggled,
                  onChanged: (v) {
                    darkProvider.setDark(v);
                  })
            ],
          )
        ]),
      )),
    );
  }
}
