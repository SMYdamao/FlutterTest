import 'package:flutter/material.dart';
import 'hybrid_stack_manager_plugin.dart';

class FPage1Widget extends StatelessWidget {
  RouterOption routerOption;
  FPage1Widget(RouterOption option, {Key key}) : super(key: key) {
    routerOption = option;
  }
  Widget build(BuildContext context) {
    Map m = Utils.parseUniquePageName(routerOption.userInfo);
    return new Scaffold(
      appBar: new AppBar(
        leading: new GestureDetector(
          child: new Icon(Icons.arrow_back_ios),
          onTap: () {
            HybridStackManagerPlugin.hybridStackManagerPlugin.popCurPage();
          },
        ),
        title: new Text("Flutter Custome Page1(${m["id"]})"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SizedBox(
              width: 1.0,
              height: 100.0,
            ),
            new GestureDetector(
              child: new Text('Click to open Flutter Custome Page1'),
              onTap: () {
                HybridStackManagerPlugin.hybridStackManagerPlugin
                    .openUrlFromNative(
                        url: "hrd://fpage1", query: {"flutter": true});
              },
            ),
            new SizedBox(
              width: 1.0,
              height: 100.0,
            ),
            new GestureDetector(
              child: new Text("Click to open Custome NativePage1"),
              onTap: () {
                HybridStackManagerPlugin.hybridStackManagerPlugin
                    .openUrlFromNative(url: "hrd://npage1");
              },
            )
          ],
        ),
      ),
      floatingActionButton: null,
    );
  }
}
