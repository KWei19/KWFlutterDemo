import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Article Detail',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(title: 'Article Detail'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  var article = {
    // Key:    Value
    'imgcaption': '新加坡海军部队巡海护卫舰正义号（RSS Justice，大图右）密切留意停泊在新加坡港界范围内的马来西亚海事部船只Pedoman号（左）。（新加坡警察部队提供）',
    'title': '我海域内柔大臣登马船发贴文照片 观察家：具挑衅意味无益双边磋商',
    'publishDate': 'turtledoves',
    'Description': 'golden rings'
  };

  Widget get articleImage {
    return new Container(
        height: 200.0,
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage("https://www.zaobao.com.sg/sites/default/files/styles/article_large_full/public/images/201901/20190111/ZB_0111_CJ_doc73ku0kxzhe0prj4p3b9_10225123_paecs.jpg?itok=F1C7Lixo&timestamp=1547148601"),
          ),
        )
    );
  }

  Widget get imageCaption {
    return new Text(
      article['imgcaption'],
      style: new TextStyle(fontSize: 12.0),
    );
  }

  Widget get articleTitle {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Text(
        article['title'],
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }

  Widget get articlePublishDate {
    return new Text(
      "发布 / 2019年1月11日 3:30 AM",
      style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 12.0),
    );
  }

  Widget get articleDescription {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: new Text(
        "柔佛州务大臣奥斯曼沙比安在贴文中称马国安全部队与公务员是在“控制与捍卫马国海域”，并向他们致谢。新加坡海事及港务管理局昨晚答复媒体询问时则证实，前天傍晚6时，我国大士一带领海共出现五艘马国政府船只。海港局也透露，截至昨晚6时，还有两艘马国政府船只逗留在这片海域。新马两国外交部长刚为航空与领海纠纷降温，柔佛州务大臣前天又点起新的争议之火，他不仅登上侵入我国海域的马方浮标船，还高调在网上发贴文与照片。本地政治观察家批评此举具挑衅意味，也无益于进行中的双边磋商工作。",
        style: new TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget get articleHtml {
    return new SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: new HtmlView(
          data: '<h1>This is heading 1 This is heading 1</h1> <h2>This is heading 2 This is heading 2</h2><h3>This is heading 3</h3><h4>This is heading 4</h4><h5>This is heading 5</h5><h6>This is heading 6</h6><p><img alt="Test Image" src=https://www.zaobao.com.sg/sites/default/files/styles/article_large_full/public/images/201901/20190111/ZB_0111_CJ_doc73ku0kxzhe0prj4p3b9_10225123_paecs.jpg?itok=F1C7Lixo&timestamp=1547148601" /></p>',
        )
    );
  }

  Widget get articleDetailImageWidget {
    return Row(
      children: <Widget>[
        Container(
          width: 30,
          height: 30,
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://www.zaobao.com.sg/sites/default/files/styles/article_large_full/public/images/201901/20190111/ZB_0111_CJ_doc73ku0kxzhe0prj4p3b9_10225123_paecs.jpg?itok=F1C7Lixo&timestamp=1547148601"),
          ),
//        child: Image.network(feed.post.column.icon,width: 25,height: 25,),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        )
      ],
    );
  }

  Widget descriptionLabel(String text,{double fontSize = 12,int maxLines = 1}){
    return Text(text,
      style:TextStyle(
        fontSize: fontSize,
        color: Color.fromARGB(200, 100, 100, 100),
      ) ,
      maxLines: maxLines,
      textAlign: TextAlign.left,
    );
  }

  Widget listBottomWidget(){
    return Row(
      children: <Widget>[
        descriptionLabel("title123"),
        Padding(padding: EdgeInsets.all(5),),
        descriptionLabel("20190116"),
      ],
    );
  }

  Widget get newsListBottomWidget {
    return Row(
      children: <Widget>[
        Container(
          child: listBottomWidget(),
          padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: descriptionLabel('查看详情>>'),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
          ),
        )
      ],
    );
  }


  Widget get articleContainter {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[imageCaption, articleTitle, articlePublishDate,articleDescription,articleDetailImageWidget,articleHtml,articleDescription,articleDescription,newsListBottomWidget,articleDescription,articleDetailImageWidget],
      ),
    );
  }

//  Widget home = new Scaffold(
//      appBar: new AppBar(
//        title: new Container(
//          margin: const EdgeInsets.symmetric(
//              vertical: 1.0, horizontal: 1.0),
//          child: new Row(
//            children: <Widget>[
//              Navigator.canPop(context) && defaultTargetPlatform == TargetPlatform.iOS ? new IconButton(
//                  icon: new Icon(Icons.arrow_back_ios), onPressed: () {
//                Navigator.pop(context);
//              }) : null,
//              new Text("Flutter App"),
//            ],
//          ),
//        ),
//      ),
//  )

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Container(
          child: new Row(
            children: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);}
              ),
              new Text(widget.title),
            ],
          ),
        ),
      ),
      body: new ListView(
        children: <Widget>[articleImage,articleContainter],
      ),
    );

  }
}
