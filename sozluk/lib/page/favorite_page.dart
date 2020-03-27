import 'package:flutter/material.dart';
import 'package:sozluk/model/Favorite.dart';
import '../util/app_constant.dart';
import 'package:flutter_svg/svg.dart';
class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with SingleTickerProviderStateMixin{
  PageController _pageController = PageController(initialPage: 0);
  bool isEmpty = false;
  int _selectedCategory = 0;
  final List<Favorite> _allFavories = Favorite.allFavorite();
  AnimationController controller;
  Animation<Offset> offset;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppConstant.colorHeading,
          ),
        ),
        elevation: 0,
        backgroundColor: AppConstant.colorPageBg,
        title: Text(
          'Favoriler',
          style: TextStyle(color: AppConstant.colorHeading),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: offset,
              child: Padding(
                padding: EdgeInsets.all(1),
                child: Container(
                    width: double.infinity,
                    color: Colors.amber,
                    height: 120,
                    child: Center(child: Text("Flutter"))),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _horizontalCategoryItem(id: 0, title: 'Sözcük'),
                    _horizontalCategoryItem(id: 1, title: 'Atasözü & Deyim'),
                    _horizontalCategoryItem(id: 2, title: 'Lorem'),
                    _horizontalCategoryItem(id: 3, title: 'Ipsum'),
                    _horizontalCategoryItem(id: 4, title: 'Dolor'),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: isEmpty ? _renderEmptyState() : _renderFavorite(),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _renderEmptyState() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.bookmark_border,
            size: 48,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Henüz favori yok',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstant.colorParagraph2),
          ),
        ],
      ),
    );
  }

  Widget _renderFavorite() {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _selectedCategory = page;
              });
            },
            children: <Widget>[
              _words(),
              _idioms(),
              _lorem(),
              _ipsum(),
              _dolor()
            ],
          ),
        ),
      ],
    );
  }

  Widget _words() {
    return Column(
      children: <Widget>[
        _favoriteItem(),
      ],
    );
  }

  Widget _idioms() {
    return Column(
      children: <Widget>[
        _favoriteItem(),
      ],
    );
  }

  Widget _lorem() {
    return Column(
      children: <Widget>[
        _favoriteItem(),
      ],
    );
  }

  Widget _ipsum() {
    return Column(
      children: <Widget>[
        _favoriteItem(),
      ],
    );
  }

  Widget _dolor() {
    return Column(
      children: <Widget>[
        _favoriteItem(),
      ],
    );
  }

  Widget _horizontalCategoryItem({@required int id, @required String title}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = id;
        });

        _pageController.animateToPage(id,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: _selectedCategory == id
                      ? FontWeight.bold
                      : FontWeight.normal,
                )),
            SizedBox(
              height: 4,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 2,
              width: _selectedCategory == id ? title.length * 4.5 : 0,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _favoriteItem() {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: _allFavories.length,
        itemBuilder: getfavoriteItemList,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget getfavoriteItemList(BuildContext context, int index) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: Colors.white,
        elevation: 4,
        shadowColor: _allFavories[index].fovoriteicon?Colors.red:Colors.black26,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {
//            showModalBottomSheet(
//                context: context,
//                builder: (context) {
//                  return Container(
//                    height: 160,
//                    child: Padding(
//                      padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 26,),
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              Container(
//                                width: 175,
//                                height: 48,
//                                child: RaisedButton.icon(
//                                  onPressed: (){},
//                                  icon: Icon(Icons.restore_from_trash,color: Colors.white,),
//                                  label: Text("Sil",style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 14,
//                                    fontWeight: FontWeight.bold,
//                                  ),),
//                                  color: AppConstant.colorPrimary,
//                                ),
//                              ),
//                              SizedBox(width: 20.0,),
//                              Container(
//                                width: 175,
//                                height: 48,
//                                child: RaisedButton(
//                                  onPressed: (){},
//                                  color: AppConstant.colorDrawerButton,
//                                  child: Text("Tümünü Seç",style: TextStyle(
//                                    fontSize: 14,
//                                    fontWeight: FontWeight.bold,
//                                  ),),
//                                ),
//                              )
//                            ],
//                          ),
//                          SizedBox(height:20,),
//                          Center(
//                            child: FlatButton(
//                              onPressed: (){},
//                              child: Text("Vazgeç",style: TextStyle(
//                                color:AppConstant.colorParagraph2,
//                                fontSize: 14,
//                                fontWeight: FontWeight.bold,
//                              ),),
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                  );
//                });
            switch (controller.status) {
              case AnimationStatus.completed:
                controller.reverse();
                break;
              case AnimationStatus.dismissed:
                controller.forward();
                break;
              default:
            }

          },
          onLongPress: () {
            setState(() {
              _allFavories[index].fovoriteicon=true;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _allFavories[index].name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                _allFavories[index].fovoriteicon ?
                SvgPicture.asset(
                  AppConstant.favoriteicon,
                )
                    : Icon(
                  Icons.arrow_forward_ios,
                  color: AppConstant.colorPrimary,
                  size: 18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
