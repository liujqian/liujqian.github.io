import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jingqian Liu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: " Jingqian's Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var avatar = Image.asset("assets/avatar.jpg");
  final String chinese_cv = "https://liujqian.github.io/CV_Chinese.pdf";
  var inCn = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print("Rerendering, the width and the height are $width, $height!");
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.blueAccent,
          child: ListView(
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    Text(inCn ? "电邮" : " Email",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width < 650 ? 10 : 18))
                  ],
                ),
                onTap: () async =>
                    await canLaunch("mailto:liujqian@hotmail.com")
                        ? await launch("mailto:liujqian@hotmail.com")
                        : throw 'Could not launch mailto:liujqian@hotmail.com',
              ),
              ListTile(
                tileColor: Colors.blueAccent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.code,
                      color: Colors.white,
                    ),
                    Text(inCn ? "Github" : " Github",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width < 650 ? 10 : 18))
                  ],
                ),
                onTap: () async =>
                    await canLaunch("https://github.com/liujqian")
                        ? await launch("https://github.com/liujqian")
                        : throw 'Could not launch https://github.com/liujqian',
              ),
              ListTile(
                tileColor: Colors.blueAccent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white,
                    ),
                    Text(inCn ? "脸书" : " Facebook",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width < 650 ? 10 : 18))
                  ],
                ),
                onTap: () async => await canLaunch(
                        "https://www.facebook.com/liujqian110")
                    ? await launch("https://www.facebook.com/liujqian110")
                    : throw 'Could not launch https://www.facebook.com/liujqian110',
              ),
              ListTile(
                tileColor: Colors.blueAccent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.book_outlined,
                      color: Colors.white,
                    ),
                    Text(inCn ? "豆瓣" : " Douban",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width < 650 ? 10 : 18))
                  ],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(
                          "My Douban ID is liujqian. Feel free to follow me on Douban!",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      actions: <Widget>[
                        new FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: new Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                tileColor: Colors.blueAccent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.assignment,
                      color: Colors.white,
                    ),
                    Text(inCn ? "中文简历" : " Chinese CV",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width < 650 ? 10 : 18))
                  ],
                ),
                onTap: () async => await canLaunch(chinese_cv)
                    ? await launch(chinese_cv)
                    : throw 'Could not launch $chinese_cv',
              ),
              ListTile(
                tileColor: Colors.blueAccent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.assignment,
                      color: Colors.white,
                    ),
                    Text(inCn ? "英文简历" : " English CV",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width < 650 ? 10 : 18))
                  ],
                ),
                onTap: () async => await canLaunch(
                        "https://liujqian.github.io/CV_English.pdf")
                    ? await launch("https://liujqian.github.io/CV_English.pdf")
                    : throw 'Could not launch https://liujqian.github.io/CV_English.pdf',
              ),
              ListTile(
                tileColor: Colors.blueAccent,
                title: Row(
                  children: [
                    Text("English",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width < 650 ? 10 : 18)),
                    Switch(
                        activeColor: Colors.white,
                        value: inCn,
                        onChanged: (bool newLang) {
                          setState(() {
                            inCn = newLang;
                          });
                        }),
                    Text("中文",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width < 650 ? 10 : 18)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Text(inCn ? "刘竞谦的个人主页" : widget.title),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Divider(
            height: 4,
          ),
          Expanded(
            child: Row(
              children: [
                VerticalDivider(
                  width: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: width < 650 ? 40 : 75,
                        child: ClipOval(child: avatar),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        child: Text(
                          inCn
                              ? "在我心里，刘竞谦是世界上最好的孩子。他聪明伶俐，善解人意，能言善辩，持之以恒。"
                                  "只要他下决心他可以做到任何事。\n--我妈妈"
                              : "In my mind, Jingqian is the best in the world. He is "
                                  "smart, kind, eloquent and determined. He can do anything"
                                  " he sets his mind to. \n--My mom",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                VerticalDivider(
                  width: 16,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Card(
                        elevation: 16,
                        color: Colors.indigo,
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.indigo, width: 2)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: width < 650 ? 32 : 46,
                            horizontal: width < 650 ? 32 : 46,
                          ),
                          child: Text(
                            inCn
                                ? '大家好我是刘竞谦。我朋友也管我叫Larry。'
                                    '我本科就读于英属哥伦比亚大学的计算机工程专业。'
                                    '我十分喜欢写代码和研究各种新的技术。希望能与你交个朋友呀！'
                                : '    Hello my friend. Welcome to my homepage. '
                                    'My name is Jingqian Liu; my friends also call me Larry. '
                                    'I completed my undergraduate degree in computer engineering '
                                    'in the Department of Electrical and Computer Engineering '
                                    'in the University of British Columbia. I love to code and '
                                    'learn new technologies very much! ',
                            style: TextStyle(
                                fontSize: width < 650 ? 12 : 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Card(
                        shape: BeveledRectangleBorder(
                            side: BorderSide(
                                color: Colors.deepPurpleAccent, width: 2)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          child: Column(
                            children: [
                              Text(
                                inCn
                                    ? ' 有趣的项目与经历 '
                                    : " Projects of Which I'm Proud",
                                style: TextStyle(
                                    fontSize: width < 650 ? 12 : 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 0.5 * height,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ProjectCard(
                                        "assets/zoola.png",
                                        inCn
                                            ? "一个基于位置的匿名聊天室安卓应用。前段使用安卓SDK开发，"
                                                "后端使用Node.js和MongoDB开发。"
                                            : "A location based anonymous chatting application on the Android"
                                                " platform. The backend is developed using Node.js and MongoDB."),
                                    ProjectCard(
                                        "assets/ch.jpeg",
                                        inCn
                                            ? "一个用Go开发的分布式哈希表。使用多种流言协议和"
                                                "一致协议。保证两重备份的顺序性一致。"
                                                "在GCP上部署并测试。"
                                            : "A sequential consistent distributed "
                                                "hash table with two-way back-up."
                                                "It was written in Go and tested "
                                                "on GCP."),
                                    ProjectCard(
                                        "assets/mugshare.png",
                                        inCn
                                            ? "为共享水杯组织”mugshare“开发的一款水杯追踪管理系统。"
                                                "前端使用Flutter开发，后端使用Node.js和PostgreSQL开发。"
                                            : "A mug tracking application for mugshare, "
                                                "a social impact program that "
                                                "provides a convenient mug deposit-return system."),
                                    ProjectCard(
                                        "assets/card.png",
                                        inCn
                                            ? "一个21点游戏自动发牌机器。使用树莓派对扑克牌进行拍照"
                                                "对照片进行预处理。"
                                                "使用KNN算法进行分类。使用FPGA开发版控制周围硬件，"
                                                "FPGA开发版和树莓派之间用自定义串口协议通信。"
                                            : "An automatic blackjack dealing machine "
                                                "that incorporates machine learning, computer vision, FPGA and "
                                                "embedded programming."),
                                    ProjectCard(
                                        "assets/intelligent_pot.jpg",
                                        inCn
                                            ? "一个由树莓派控制的智能花盆。使用各种传感器记录光照，湿度等数据。"
                                                "自动对花定期浇水。使用一个网页前段来显示花盆的实时状态。"
                                            : "A robotic pot holder that uses Raspberry Pi to "
                                                "detect light and moisture level. A "
                                                "web application is written for remote control."),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  width: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String imgSrc;
  final String desc;

  ProjectCard(this.imgSrc, this.desc);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget card = SizedBox(
      width: width < 620 ? 150 : 180,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.deepPurpleAccent,
                width: 2,
                style: BorderStyle.solid)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset(imgSrc),
            ),
            Text(
              desc,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
    return MaterialButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
                "This page is not yet implemented : ) Stay tuned!\n这一页还尚未完工呢！请等一等吧。",
                style: TextStyle(
                  fontSize: 20,
                )),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text('OK'),
              ),
            ],
          ),
        );
      },
      child: card,
    );
  }
}
