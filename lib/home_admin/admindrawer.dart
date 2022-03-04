import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  _AdminDrawerState createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  int curState = 0;
  List<String> pos = [
    "SUG President",
    "Vice President",
    "Senate",
    "DOS",
    "Governor",
    "Provost",
    "Financial Secretary",
  ];

  @override
  void initState() {
    final String? adminPos = MyPrefs.getDef("ADMIN_POS");
    if (adminPos != null) {
      curState = pos.indexOf(adminPos);
    } else {
      curState = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003478).withOpacity(0.5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: pos.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                curState = index;
                Navigator.of(context).pop();
                await MyPrefs.setDef("ADMIN_POS", pos[curState]);
                Provider.of<MyNotif>(context, listen: false)
                    .changePosTitle(pos[curState]);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  pos[index],
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 16,
                      color: curState == index
                          ? const Color(0xFFFFC727)
                          : Colors.white),
                ),
              ),
            );
          }),
    );
  }
}
