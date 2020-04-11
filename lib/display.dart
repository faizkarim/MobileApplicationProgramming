// import 'package:flutter/material.dart';
// import 'package:settings/theme.dart';
// import 'package:provider/provider.dart';

// class Display extends StatelessWidget {

//   Widget build(BuildContext context) {
//     ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
//     return Scaffold(
      
//       appBar: AppBar(
//         elevation: 0,
        
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back,), 
//           onPressed: () => Navigator.of(context).pop()
//         ),
        
//         title: Text('Display'),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             FlatButton(
//               child: Text('Light Theme'),
//               onPressed: () => _themeChanger.setTheme(ThemeData.light()),
//             ),
//             FlatButton(
//               child: Text('Dark Theme'),
//               onPressed: () => _themeChanger.setTheme(ThemeData.dark()),
//             ),
//           ]
//         )
//       )
//     );
//   }
// }
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('display'),
    );
  }
}