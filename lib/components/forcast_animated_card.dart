import 'package:cwiz/models/explore_weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AnimatedForcastCard extends StatefulWidget {
  const AnimatedForcastCard({Key? key, required this.date,required this.daily}) : super(key: key);
  final Daily daily;
  final String date;

  @override
  _AnimatedForcastCardState createState() => _AnimatedForcastCardState();
}

class _AnimatedForcastCardState extends State<AnimatedForcastCard> {

  bool isSelected = false;
  String date = "date";
  late Daily dailyList;

  @override
  void initState() {
    // TODO: implement initState
    date = widget.date;
    dailyList = widget.daily;
    super.initState();
  }
  chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: <Widget>[
        _buildChip('Day ${dailyList.temp?.day ?? "0"}°C', Color(0xFFff6666)),
        _buildChip('Min ${dailyList.temp?.min ?? "0"}C', Color(0xFF007f5c)),
        _buildChip('Max ${dailyList.temp?.max ?? "0"}°C', Color(0xFF5f65d3)),
        _buildChip('night ${dailyList.temp?.night ?? "0"}°C', Color(0xff0c1d0c)),
        _buildChip('eve ${dailyList.temp?.eve ?? "0"}°C', Color(0xff8d300b)),
        _buildChip('Morning ${dailyList.temp?.morn ?? "0"}°C', Color(0xff169e9e)),
        _buildChip('Pressure ${dailyList.pressure ?? "0"}hPa', Color(0xff355f66)),
        _buildChip('${dailyList.weather?[0].main ?? "Clear"}', Color(0xff3e23d4)),
        _buildChip('Humidity ${dailyList.humidity ?? "0"}%', Color(0xff651744)),

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
        leading: Icon(Icons.today),
      textColor: Theme.of(context).iconTheme.color,
        iconColor: Theme.of(context).iconTheme.color,
        title: Text(date),
    children: [
      ListTile(
        title: Text("Properties: "),
        subtitle: chipList(),
      ),
      ],
    );
  }
}


// InkWell(
// onTap: (){
// setState(() {
// isSelected = !isSelected;
// });
// },
// child: AnimatedContainer(
// duration: Duration(milliseconds: 500),
// height: isSelected? 200.0: 70,
// child: Card(
// elevation: 3,
// child:
// ListTile(
// leading: isSelected? Icon(Icons.arrow_circle_up):Icon(Icons.arrow_circle_down_outlined),
// title: Text(date),
// ),
//
//
// ),
// ),
// );