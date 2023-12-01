import 'package:cine_stream_ui/constant/colors.dart';
import 'package:cine_stream_ui/constant/image.dart';
import 'package:cine_stream_ui/reusable_widget/app_bar_form_widget.dart';
import 'package:cine_stream_ui/reusable_widget/none_watch_list/none_list_screen_widget.dart';
import 'package:cine_stream_ui/screen/detalilsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var watchListScreenKey = GlobalKey<_WatchListScreenState>();

// ignore: must_be_immutable
class WatchListScreen extends StatefulWidget {
  Key key = watchListScreenKey;

  final PageController tabController;

  WatchListScreen({super.key, required this.tabController});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen>
    with AutomaticKeepAliveClientMixin {
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
  Widget build(BuildContext context) {
    final List<ImageDetail> allImages = [];
    dataHOme.forEach((data) => allImages.addAll(data.images));

    return Scaffold(
      backgroundColor: BackAppColors,
      appBar: AppBarFormWidget(
        "Watch list",
        leading: Icons.arrow_back_ios,
        leadingRout: () {
          print("Click on leading button");
          widget.tabController.jumpToPage(0);
        },
        colorAllFore: Colors.white,
      ),

      // body: buildItem(allImages),
      body: allImages == null
          ? NoneListScreenWidget(
              image: "images/magic-box.png",
              title: "There Is No Movie Yet!",
              subTitle:
                  "Find your movie by Typing title, categories, years, etc")
          : buildItem(allImages),
    );
  }

  Padding buildItem(List<ImageDetail> allImages) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Container(
        child: ListView.builder(
          controller: scrollController,
          // itemCount: lstPlayNow.length,
          itemCount: allImages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: () {
                  // RatingScreen.buildShowModalBottomSheet(context);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        data: allImages[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 120,
                  child: Row(
                    children: [
                      Container(
                        width: 95,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          image: DecorationImage(
                            // image: AssetImage(lstPlayNow[index]),
                            // image: AssetImage(dataWatchList[index].imageProfile),
                            image: AssetImage(allImages[index].profileImg),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  // "Spider-Man: No Way Home, Best Movie.",
                                  "${allImages[index].title}",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildInfo(
                                      Icons.star_outline,
                                      "9.5",
                                      Color(0xFFFF8700),
                                      fontWeightT: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    buildInfo(
                                      Icons.local_attraction_outlined,
                                      "Action",
                                      Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    buildInfo(
                                      Icons.calendar_today_outlined,
                                      "2023",
                                      Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    buildInfo(
                                      Icons.info_outline,
                                      "127" + " minutes",
                                      Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// this widget of 4 info
  Container buildInfo(IconData icon, String subTitle, Color colorS,
      {FontWeight fontWeightT = FontWeight.w400}) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Icon(
              icon,
              // color: Color(0xFFFF8700),
              color: colorS,
              size: 16,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            child: Text(
              "$subTitle",
              style: GoogleFonts.montserrat(
                // color: Color(0xFFFF8700),
                color: colorS,
                fontSize: 12,
                fontWeight: fontWeightT,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
