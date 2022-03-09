import 'package:cwiz/app_manager/theme_manager.dart';
import 'package:cwiz/cwiz_themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: ListView(children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.nightlight_round),
              title: Text("Dark Mode"),
              trailing: Switch(
                  value: darkProvider.isToggled,
                  onChanged: (v) {
                    darkProvider.setDark(v);
                  }),
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text("About the app"),
              textColor:Theme.of(context).iconTheme.color,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "   This app gets current weather data for any location on Earth including over 200,000 cities! We collect and process weather data from different sources such as global and local weather models, just use your location and network services. ",
                    style: GoogleFonts.carme(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text("App usage and  privacy policy:"),
            collapsedTextColor: Colors.orange.shade500,
              textColor:Theme.of(context).iconTheme.color,

              children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "   By using this app you must confirm that and you are not allowed to break or hack the software polices!, such as third parties and using the same code snippets.\n   This app can access location and connection services, it can use third party to handle the api requests. Our privacy grantees to you that we do not use any personal info or data respect with your phone. ",
                  style: GoogleFonts.carme(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              )
            ],),
          ),
          Card(
            child: ExpansionTile(
              title: Text("Contact us"),
              textColor: Theme.of(context).iconTheme.color,
              // collapsedTextColor: Theme.of(context).iconTheme.color,
              children: [
                ListTile(
                  title: Text('Email us'),
                  trailing: TextButton(
                    onPressed: _sendingMails,
                    child: Icon(Icons.email_rounded),
                  ),
                ),
                ListTile(
                  title: Text('Phone'),
                  trailing: TextButton(
                    onPressed: () async {
                      await _makePhoneCall("+249906078535");
                    },
                    child: Icon(Icons.phone),
                  ),
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }

  _sendingMails() async {
    const url = 'mailto:alfatihtalab7@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}
