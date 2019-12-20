import 'package:demo_test/bean/homePageBean.dart';
import 'package:demo_test/bean/pageBean.dart';
import 'package:demo_test/bean/standbyBean.dart';
import 'package:demo_test/main.dart';
import 'package:demo_test/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<dynamic> ReadList = new List(); //小说
List<dynamic> PicList = new List(); //美图
List<dynamic> AggList = new List(); //聚合
List<dynamic> VideoList = new List(); //视频
List<dynamic> CartoonList = new List(); //漫画
List<dynamic> CookbookList = new List(); //菜谱
List<dynamic> ImageTextList = new List(); //图文
List<dynamic> BeautyList = new List(); //美妆
List<dynamic> CarList = new List(); //汽车
List<dynamic> GoldList = new List(); //砸金蛋
List<dynamic> NewPicList = new List(); //新美图
List<dynamic> CatList = new List(); //养猫游戏
List<dynamic> LifeList = new List(); //生活
List<dynamic> StandbyList = new List(); //备用

class HomePage extends StatelessWidget {
  HomePageBean homePageBean;
  List<String> items = [
    "H5链接数",
    "H5小说",
    "H5美图",
    "H5视频",
    "H5聚合",
    "H5漫画",
    "H5菜谱",
    "H5图文",
    "H5美妆",
    "H5汽车",
    "H5砸金蛋",
    "H5新美图",
    "养猫游戏",
    "生活",
    "H5备用"
  ];

  HomePage({
    Key key,
    @required this.homePageBean,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLoadHomePage) {
      homePageBean = ModalRoute.of(context).settings.arguments;

      print("11111111" + homePageBean.toString());
      dynamic urlData = homePageBean.urlData;
      print("22222222" + urlData.toString());
//    urlData = json.decode(homePageBean.urlData.toString());
      setUrlList(urlData);
      isLoadHomePage = true;
    } else {
      if (ReadList != null && ReadList.length > 0) {
        items = [
          "H5链接数",
          "H5小说",
          "H5美图",
          "H5视频",
          "H5聚合",
          "H5漫画",
          "H5菜谱",
          "H5图文",
          "H5美妆",
          "H5汽车",
          "H5金蛋",
          "H5新美图",
          "养猫游戏",
          "H5生活",
          "H5备用"
        ];
        setItems();
      }
    }
    // TODO: implement build
    return buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("分类页面"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            cleanList();
            isLoadHomePage = false;
            Navigator.pop(context);
          },
        ),
      ),
      body: buildListView(),
    );
  }

  void cleanList() {
    ReadList.clear();
    PicList.clear();
    AggList.clear();
    VideoList.clear();
    CartoonList.clear();
    CookbookList.clear();
    ImageTextList.clear();
    BeautyList.clear();
    CarList.clear();
    GoldList.clear();
    CatList.clear();
    LifeList.clear();
    NewPicList.clear();
  }

  ListView buildListView() {
    return ListView.builder(
        itemExtent: 70.0,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: GestureDetector(
              child: new Text(items[index],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic)),
              onTap: () {
                if (items[index].contains("H5链接数")) {
                  MyToastUtils(items[index]);
                  return;
                }
                print(items[index]);
                MyToastUtils(items[index] + "被点击");
                switch (index) {
                  case 0:
//                    MyToastUtils(items[index]);
                    //进不来这里，被上面的拦截了
                    break;
                  case 1:
                    lunchList(context, index, "小说列表页面", ReadList);
                    break;
                  case 2:
                    lunchList(context, index, "美图列表页面", PicList);
                    break;
                  case 3:
                    lunchList(context, index, "视频列表页面", VideoList);
                    break;
                  case 4:
                    lunchList(context, index, "聚合列表页面", AggList);
                    break;
                  case 5:
                    lunchList(context, index, "漫画列表页面", CartoonList);
                    break;
                  case 6:
                    lunchList(context, index, "菜谱列表页面", CookbookList);
                    break;
                  case 7:
                    lunchList(context, index, "图文列表页面", ImageTextList);
                    break;
                  case 8:
                    lunchList(context, index, "美妆列表页面", BeautyList);
                    break;
                  case 9:
                    lunchList(context, index, "汽车列表页面", CarList);
                    break;
                  case 10:
                    lunchList(context, index, "砸金蛋列表页面", GoldList);
                    break;
                  case 11:
                    lunchList(context, index, "新美图列表页面", NewPicList);
                    break;
                  case 12:
                    lunchList(context, index, "养猫游戏列表页面", CatList);
                    break;
                  case 13:
                    lunchList(context, index, "生活列表页面", LifeList);
                    break;
                  case 14:
                    Navigator.pushNamed(context, standbyPage,
                        arguments: StandbyBean(
                            "备用代码",
//                            "http://t.alpha.channel.45xie.com/ad.html"));
                            "http://t.alpha.channel.45xie.com/cookbook/home.html?appid=B428109E4AA4E883DB8B1877BFF3575F"));
                    break;
                }
              },
            ),
          );
        });
  }

  /**
   * 跳转界面
   */
  void lunchList(context, index, title, list) {
    if (list != null && list.length != 0) {
    } else {
      MyToastUtils("请返回首页重新获取数据");
      return;
    }
    MyToastUtils(items[index]);
    print("跳转界面");
    Navigator.pushNamed(context, listPage, arguments: PageBean(title, list));
//    Navigator.pushNamed(context, '/listPage', arguments: PageBean(title, list));
  }

  /**
   * 设置集合数据
   */
  void setUrlList(urlData) {
    print("跑到设置方法了");

    if (urlData != null && urlData.length > 0) {
      for (var value in urlData) {
        var type = value['type'];
        String uv = value['uv'].toString();
//        if (int.parse(uv) < 50) {
//          //链接访问数小于50不统计
//          continue;
//        }
        switch (type) {
          case 1:
            ReadList.add(value);
            break;
          case 2:
            AggList.add(value);
            break;
          case 3:
            PicList.add(value);
            break;
          case 4:
            VideoList.add(value);
            break;
          case 5:
            CartoonList.add(value);
            break;
          case 6:
            CookbookList.add(value);
            break;
          case 7:
            ImageTextList.add(value);
            break;
          case 8:
            BeautyList.add(value);
            break;
          case 9:
            CarList.add(value);
            break;
          case 10:
            GoldList.add(value);
            break;
          case 11:
            NewPicList.add(value);
            break;
          case 12:
            CatList.add(value);
            break;
          case 13:
            LifeList.add(value);
            break;
        }
      }
    }
    sortList(ReadList);
    sortList(AggList);
    sortList(PicList);
    sortList(VideoList);
    sortList(CartoonList);
    sortList(CookbookList);
    sortList(ImageTextList);
    sortList(BeautyList);
    sortList(CarList);
    sortList(GoldList);
    sortList(NewPicList);
    sortList(CatList);
    sortList(LifeList);
//    "链接数：（" +
//        (ReadList.length +
//                PicList.length +
//                AggList.length +
//                VideoList.length +
//                CartoonList.length +
//                CookbookList.length +
//                ImageTextList.length)
//            .toString() +
//        "）";
    setItems();
    printListCount();
  }

  void setItems() {
    items = [
      items[0] +
          "（链接数：" +
          (ReadList.length +
                  PicList.length +
                  AggList.length +
                  VideoList.length +
                  CartoonList.length +
                  CookbookList.length +
                  ImageTextList.length +
                  BeautyList.length +
                  CarList.length +
                  GoldList.length +
                  NewPicList.length +
                  CatList.length +
                  LifeList.length)
              .toString() +
          "）",
      items[1] + "（链接数：" + ReadList.length.toString() + "）",
      items[2] + "（链接数：" + PicList.length.toString() + "）",
      items[3] + "（链接数：" + VideoList.length.toString() + "）",
      items[4] + "（链接数：" + AggList.length.toString() + "）",
      items[5] + "（链接数：" + CartoonList.length.toString() + "）",
      items[6] + "（链接数：" + CookbookList.length.toString() + "）",
      items[7] + "（链接数：" + ImageTextList.length.toString() + "）",
      items[8] + "（链接数：" + BeautyList.length.toString() + "）",
      items[9] + "（链接数：" + CarList.length.toString() + "）",
      items[10] + "（链接数：" + GoldList.length.toString() + "）",
      items[11] + "（链接数：" + NewPicList.length.toString() + "）",
      items[12] + "（链接数：" + CatList.length.toString() + "）",
      items[13] + "（链接数：" + LifeList.length.toString() + "）",
      items[14] + "（备用）",
    ];
  }

  void sortList(list) {
    if (list.length < 1) {
      return;
    }
//    print("排序");
    //升序
//    list.sort((a, b) =>
//        int.parse(a['uv'].toString()).compareTo(int.parse(b['uv'].toString())));

    //降序
    list.sort((a, b) =>
        int.parse(b['uv'].toString()).compareTo(int.parse(a['uv'].toString())));
//    log.info(ReadList.toString());
  }

  void printListCount() {
    print("分割线");
    print(ReadList.length);
    print(AggList.length);
    print(PicList.length);
    print(VideoList.length);
    print(CartoonList.length);
    print(CookbookList.length);
    print(ImageTextList.length);
    print(BeautyList.length);
    print(CarList.length);
    print(GoldList.length);
    print(NewPicList.length);
    print(CatList.length);
    print(LifeList.length);
  }
}
