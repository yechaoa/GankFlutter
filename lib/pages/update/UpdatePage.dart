import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _UpdatePageState();
  }
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final itemInfo = new List<ListItem>.generate(
      _allPages.length,
      (i) => i < _allPages.length - 1
          ? new MessageItem(_allPages[i])
          : new HeadingItem(),
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("版本更新"),
        ),
        body: new ListView.builder(
          itemCount: itemInfo.length,
          itemBuilder: (context, index) {
            final item = itemInfo[index];

            if (item is MessageItem) {
              return buildListTile(context, item.page);
            } else if (item is HeadingItem) {
              return buildFooter(context);
            }
          },
        ));
  }

  Widget buildListTile(BuildContext context, Page item) {
    return new Container(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 7.0, 0.0),
      child: new Row(
        ///主轴居中,即是横向居中
        children: <Widget>[
          ///一个图标，大小16.0，灰色
          new Expanded(
            child: new CircleAvatar(
              child: new Text(
                item.versionCode,
                style: const TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              maxRadius: 15.0,
            ),
          ),

          new Expanded(
            flex: 4,

            ///间隔
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(item.versionTime),
                new Text(item.versionName),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return

        ///居中显示
        new Center(
            child: Container(
      padding: EdgeInsets.only(top: 50.0),
      child: new Row(
        ///主轴居中,即是横向居中
        mainAxisAlignment: MainAxisAlignment.center,

        ///大小按照最大充满
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ///一个图标，大小16.0，灰色
          new Image.asset(
            'images/smile.png',
            width: 25.0,
            height: 25.0,
          ),

          ///间隔
          new Padding(padding: new EdgeInsets.only(left: 15.0)),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                '感谢你对我的关注',
                style: const TextStyle(color: Colors.orange, fontSize: 12.0),
              ),
              new Text(
                '希望这些更新能给你带来帮助',
                style: const TextStyle(color: Colors.orange, fontSize: 12.0),
              ),
            ],
          )
        ],
      ),
    ) //显示右侧的箭头，不显示则传null
            );
  }
}

class Page {
  Page({this.versionCode, this.versionName, this.versionTime});

  final String versionCode;
  final String versionName;
  final String versionTime;
}

// 存储所有页面的列表
final List<Page> _allPages = <Page>[
  new Page(
      versionCode: "1.0", versionName: "发布1.0测试版", versionTime: "2018-8-20"),
  new Page(
      versionCode: "1.1", versionName: "完善业务逻辑，避免造轮子", versionTime: "2018-9-7"),
  new Page(versionCode: "1.2", versionName: "待定", versionTime: "待定"),
];

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final Page page;

  MessageItem(this.page);
}