
import 'package:cwiz/models/five_days_forcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AnimatedForcastCard extends StatefulWidget {
  const AnimatedForcastCard({Key? key, required this.listElement,}) : super(key: key);
  final ListElement listElement;

  @override
  _AnimatedForcastCardState createState() => _AnimatedForcastCardState();
}

class _AnimatedForcastCardState extends State<AnimatedForcastCard> {

  bool isSelected = false;
  late ListElement listElement;


  @override
  void initState() {
    // TODO: implement initState
    listElement = widget.listElement;
    super.initState();
  }
  chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: <Widget>[
        _buildChip('Temp ${listElement.main!.temp.toString()}°C', Color(0xFFff6666)),
        _buildChip('Min ${listElement.main!.temp_min.toString()}°C', Color(0xFF007f5c)),
        _buildChip('Max ${listElement.main!.temp_max.toString()}°C', Color(0xFF5f65d3)),
        _buildChip('Feels like ${listElement.main!.feels_like.toString()}', Colors.deepOrange),
        _buildChip('Main ${listElement.weather!.first.main.toString()}°C', Color(0xff8d300b)),
        _buildChip('Pressure ${listElement.main!.pressure.toString() }hPa', Color(0xff355f66)),
        _buildChip('Humidity ${listElement.main!.humidity.toString()}%', Color(0xff651744)),

      ],
    );
  }


  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.today, color: Color(0xff03989e),),
      textColor: Theme.of(context).iconTheme.color,
      iconColor: Theme.of(context).iconTheme.color,
      title: Text(listElement.dt_txt.toString(),style:  GoogleFonts.gudea(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w700),),
      children: [
        ListTile(
          title: Text("Properties: ", style: TextStyle(fontSize: 16,color: Colors.white),),
          subtitle: chipList(),
        ),
      ],
    );
  }
}