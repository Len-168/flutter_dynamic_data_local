import 'package:cine_stream_ui/constant/colors.dart';
import 'package:cine_stream_ui/constant/image.dart';
import 'package:cine_stream_ui/constant/textStyle.dart';
import 'package:cine_stream_ui/screen/pathScreen.dart/path_detail_screen.dart';
import 'package:cine_stream_ui/reusable_widget/appBar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final ImageDetail data;

  DetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackAppColors,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidget(
          title: "Detail",
          leading: Icons.arrow_back_ios,
          colorAllFore: Colors.white,
          actionIcon: Icons.bookmark,
          leadingRout: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip
                  .none, // This is use for the hovering of the small movie box.
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(data.coverImg),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            color: BackAppColors.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_border_rounded,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "9.5",
                                  style: googleFontsPoppinsGold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 190,
                  left: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 110,
                            height: 145,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(data.profileImg),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            // color: Colors.red,
                            width: 230,
                            height: 70,
                            child: Text(
                              data.title,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child_icon_date(Icons: Icons.date_range_sharp),
                SizedBox(width: 5),
                child_text_date(text: "2023"),
                SizedBox(width: 20),
                child_icon_date(Icons: Icons.timelapse_rounded),
                SizedBox(width: 5),
                child_text_date(text: "148 Minutes"),
                SizedBox(width: 20),
                child_icon_date(Icons: Icons.confirmation_num_outlined),
                SizedBox(width: 5),
                child_text_date(text: "Action")
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 45,
              padding: EdgeInsets.only(left: 10),
              child: const TabBar(
                tabAlignment: TabAlignment.center,
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 15,
                indicatorColor: IconSerachColor,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5, color: IconSerachColor),
                  insets: EdgeInsets.symmetric(horizontal: 14.0),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      "About Movie",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Tab(
                    child: Text("Reviews", style: TextStyle(fontSize: 17)),
                  ),
                  Tab(
                    child: Text("Casts", style: TextStyle(fontSize: 17)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    data.detail,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 100,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        listView,
                      ],
                    ),
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      GridView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.3,
                            mainAxisSpacing: 1,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          'images/detail_image/tom.jpeg'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Tom Holland",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ]),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
