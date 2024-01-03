import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_widget.dart';

GlobalKey<ScaffoldState> _scaffolfKey = GlobalKey<ScaffoldState>();

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolfKey,
      drawer: Responsive.isDesktop(context) ? null : const SideDrawer(),
      appBar: AppBar(
        leading: Responsive.isDesktop(context)
            ? null
            : IconButton(
                onPressed: () {
                  _scaffolfKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.list)),
      ),
      body: Expanded(
        child: Responsive(
          mobile: Column(
            children: getListOfWidgets(context),
          ),
          tablet: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: getListOfWidgets(context),
          ),
          desktop: Row(
            children: [
              const SideDrawer(),
              Expanded(
                child: Row(
                  children: getListOfWidgets(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getListOfWidgets(BuildContext context) {
    List<Color> colors = [Colors.red, Colors.green, Colors.blue];
    List<Widget> listOfWidgets = [];

    for (int i = 0; i < colors.length; i++) {
      listOfWidgets.add(Expanded(
        flex: i == 1 ? 2 : 1,
        child: Container(
          color: colors[i],
          child: Center(
              child: Text(
            "${i + 1} Section",
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          )),
        ),
      ));
    }

    return listOfWidgets;
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.width / 4
          : Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width / 2
              : MediaQuery.of(context).size.width / 2.5,
      child: Column(
        children: [
          Visibility(
            visible:  !Responsive.isDesktop(context),
            child: FloatingActionButton(onPressed: () {
              _scaffolfKey.currentState!.closeDrawer();
            }),
          ),
          const Text(
            "Text 1",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const Text(
            "Text 2",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const Text(
            "Text 3",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const Text(
            "Text 4",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const Text(
            "Text 5",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
          )
        ],
      ),
    );
  }
}
