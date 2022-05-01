import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_teams/controllers/header_controller.dart';

// class HeaderWidget extends StatelessWidget {
//   const HeaderWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Provider<HeaderController>(
//         create: (context) => HeaderController(),
//         child: Header(),
//       );
// }

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final header = Provider.of<HeaderController>(context);
    return Observer(
      builder: (context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<String>(
                  future: header.getUsername(),
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Text(header.headerText + snapshot.data.toString() + "!",
                        style: Theme.of(context).textTheme.headline1);
                    }
                    return Text(header.headerText + "...!",
                        style: Theme.of(context).textTheme.headline1);
                  }
                ),
                Row(
                  children: header.currentType == HeaderType.home
                      ? ([
                          Text(header.subHeaderText + " ",
                              style: Theme.of(context).textTheme.headline2),
                          Text(header.highlightedText,
                              style: Theme.of(context).textTheme.headline3),
                        ])
                      : ([
                          Text(header.highlightedText + " ",
                              style: Theme.of(context).textTheme.headline3),
                          Text(header.subHeaderText,
                              style: Theme.of(context).textTheme.headline2),
                        ]),
                )
              ],
            ),
            // Row(
            //   children: [
            //     Material(
            //         borderRadius: BorderRadius.circular(100),
            //         color: const Color(0xFF3D3C3C),
            //         child: InkWell(
            //           borderRadius: BorderRadius.circular(100),
            //           radius: 25,
            //           onTap: () => Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => UserPage())),
            //           splashColor: Colors.grey,
            //           highlightColor: Colors.grey,
            //           child: const SizedBox(
            //             width: 40,
            //             height: 40,
            //             child: Icon(
            //               Icons.person,
            //               color: Color(0xFF8D8D8E),
            //               size: 24,
            //             ),
            //           ),
            //         )),
            //     Container(
            //       child: Material(
            //         borderRadius: BorderRadius.circular(100),
            //         color: const Color(0xFF3D3C3C),
            //         child: InkWell(
            //           borderRadius: BorderRadius.circular(100),
            //           radius: 25,
            //           onTap: () => /*Navigator.pop(context)*/ print("test"),
            //           splashColor: Colors.grey,
            //           highlightColor: Colors.grey,
            //           child: const SizedBox(
            //             width: 40,
            //             height: 40,
            //             child: Icon(
            //               Icons.settings,
            //               color: Color(0xFF8D8D8E),
            //               size: 24,
            //             ),
            //           ),
            //         ),
            //       ),
            //       margin: const EdgeInsets.only(left: 16, right: 21),
            //     ),
            //   ],
            // )
          ],
        ),
        margin: const EdgeInsets.only(bottom: 22.0),
        padding: const EdgeInsets.only(top: 30.0),
        height: 100.0,
        width: 800.0,
      ),
    );
  }
}
