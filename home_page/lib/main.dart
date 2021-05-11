import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print("Rerendering, the width and the height are $width, $height!");
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.account_box_outlined),
            Text(widget.title),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Divider(
            height: 8,
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
                      Divider(),
                      MaterialButton(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              Text(" Email",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          onPressed: () async => await canLaunch(
                                  "mailto:liujqian@hotmail.com")
                              ? await launch("mailto:liujqian@hotmail.com")
                              : throw 'Could not launch mailto:liujqian@hotmail.com'),
                      Divider(),
                      MaterialButton(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.code,
                                color: Colors.white,
                              ),
                              Text(" Github",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          onPressed: () async => await canLaunch(
                                  "https://github.com/liujqian")
                              ? await launch("https://github.com/liujqian")
                              : throw 'Could not launch https://github.com/liujqian'),
                      Divider(),
                      MaterialButton(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.supervised_user_circle_outlined,
                                color: Colors.white,
                              ),
                              Text(" Facebook",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          onPressed: () async => await canLaunch(
                                  "https://www.facebook.com/liujqian110")
                              ? await launch(
                                  "https://www.facebook.com/liujqian110")
                              : throw 'Could not launch https://www.facebook.com/liujqian110'),
                      Divider(),
                      MaterialButton(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.local_movies_outlined,
                                color: Colors.white,
                              ),
                              Text(" Douban",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          onPressed: () async => await canLaunch(
                                  "https://www.douban.com/people/liujqian/")
                              ? await launch(
                                  "https://www.douban.com/people/liujqian/")
                              : throw 'Could not launch https://www.douban.com/people/liujqian/'),
                      Divider(),
                      MaterialButton(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.receipt_long_outlined,
                                color: Colors.white,
                              ),
                              Text(" Chinese CV",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          onPressed: () async => await canLaunch(chinese_cv)
                              ? await launch(chinese_cv)
                              : throw 'Could not launch $chinese_cv'),
                      Divider(),
                      MaterialButton(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.receipt_long_outlined,
                                color: Colors.white,
                              ),
                              Text(" English CV",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          onPressed: () async => await canLaunch(
                                  "https://liujqian.github.io/CV_English.pdf")
                              ? await launch(
                                  "https://liujqian.github.io/CV_English.pdf")
                              : throw 'Could not launch https://liujqian.github.io/CV_English.pdf')
                    ],
                  ),
                ),
                VerticalDivider(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Card(
                      color: Colors.indigo,
                      shape: StadiumBorder(
                          side: BorderSide(color: Colors.indigo, width: 2)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: width < 650 ? 28 : 46,
                          horizontal: width < 650 ? 28 : 46,
                        ),
                        child: Text(
                          '    Hello my friend. Welcome to my homepage. '
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
                  ],
                )),
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
