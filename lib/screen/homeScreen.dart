import 'package:cine_stream_ui/constant/colors.dart';
import 'package:cine_stream_ui/constant/image.dart';
import 'package:cine_stream_ui/reusable_widget/BoxSerach.dart';
import 'package:cine_stream_ui/reusable_widget/tab_home/nowplaying.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var homeScreenKey = GlobalKey<_HomeScreenState>();

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {

  Key key = homeScreenKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  late TabController _controller;
  int _selectedIndex = 0;

  ScrollController scrollController = ScrollController();

  gotoTop() {
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: dataHOme.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ImageDetail> allImages = [];
    dataHOme.forEach((data) => allImages.addAll(data.images));

    return Scaffold(
      backgroundColor: BackAppColors,
      appBar: AppBar(
        title: Text(
          "What do you want to watch?",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: BackAppColors,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 4,
        child: ListView(
          controller: scrollController,
          children: [
            SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: BoxSerachReusable(),
                ), // Box Serach
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 235,
                  child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: allImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16, right: 10),
                        child: Container(
                          width: 165,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(allImages[index].profileImg),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    controller: _controller,
                    indicatorColor: IconSerachColor,
                    dividerColor: Colors.transparent,
                    indicatorWeight: 15,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 5, color: IconSerachColor),
                      insets: EdgeInsets.symmetric(horizontal: 14.0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    tabs: dataHOme
                        .map(
                          (e) => Text(
                            e.labbel,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: NowPlaying(type: dataHOme[_selectedIndex].labbel),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
