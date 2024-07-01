import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:telemed/constant.dart';
import 'package:telemed/models/data_model.dart';
import 'package:telemed/services/app_theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DataModel data = DataModel();
  @override
  void initState() {
    data = DataModel.fromJson(Constant.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          excludeHeaderSemantics: true,
          forceMaterialTransparency: true,
          toolbarHeight: 200,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Row(
              children: [
                Container(
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('John Doe',
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 10.0),
                        const Icon(Icons.keyboard_arrow_down_rounded,
                            color: Colors.white),
                      ],
                    ),
                    const Text("BP NO: 1234567890",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: AppTheme.primaryColor,
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.25,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.25 - 40,
              left: 20,
              right: 20,
              child: Card(
                color: AppTheme.cardColor,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  height: 200,
                  child: Swiper(
                    viewportFraction: 1,
                    itemCount: 3,
                    itemWidth: MediaQuery.of(context).size.width - 40,
                    itemHeight: 200,
                    layout: SwiperLayout.DEFAULT,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    data.banners?[0].title ??
                                        '', // hardcoded index
                                    maxLines: 4,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppTheme.primaryColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('View',
                                          style: TextStyle(
                                              color: AppTheme.primaryColor))),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: double.infinity,
                                child: Image.network(
                                    data.banners?[0].image ??
                                        '', // hardcoded index
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    pagination: const SwiperPagination(
                      margin: EdgeInsets.all(0.0),
                      alignment: Alignment.centerLeft,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.grey,
                        activeColor: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
// CarouselSlider(
//                     items: data.banners?.map((e) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               flex: 1,
//                               child: Text(
//                                 e.title ?? '',
//                                 maxLines: 4,
//                                 style: TextStyle(
//                                   overflow: TextOverflow.ellipsis,
//                                   color: AppTheme.primaryColor,
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Container(
//                                 height: double.infinity,
//                                 child: Image.network(e.image ?? '',
//                                     fit: BoxFit.contain),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                     options: CarouselOptions(
//                       scrollDirection: Axis.vertical,
//                       aspectRatio: 2.0,
//                       autoPlay: true,
//                       autoPlayInterval: const Duration(seconds: 3),
//                       autoPlayAnimationDuration:
//                           const Duration(milliseconds: 800),
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       pauseAutoPlayOnTouch: true,
//                       onPageChanged: (index, reason) {
//                         print(index);
//                       },
//                     )),