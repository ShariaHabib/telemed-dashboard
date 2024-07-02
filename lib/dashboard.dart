import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telemed/constant.dart';
import 'package:telemed/models/data_model.dart';
import 'package:telemed/services/app_theme.dart';
import 'package:telemed/utils/date_convert.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map<String, dynamic> patientName = {};
  final SwiperController _swiperControllerPrescription = SwiperController();
  final SwiperController _swiperControllerMedicine = SwiperController();
  final SwiperController _swiperControllerReport = SwiperController();
  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  DataModel data = DataModel();
  @override
  void initState() {
    data = DataModel.fromJson(Constant.data);
    generatePatientName();
    super.initState();
  }

  void generatePatientName() {
    data.prescriptions?.forEach((element) {
      patientName[element.prescriptionNoPk.toString()] = element.patientName;
    });
  }

  bool showDetails = false;

  void toggleDetails() {
    setState(() {
      showDetails = !showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          excludeHeaderSemantics: true,
          forceMaterialTransparency: true,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('নাজমুল ছাকিব',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0)),
                        SizedBox(width: 10.0),
                        Icon(Icons.keyboard_arrow_down_rounded,
                            color: Colors.white),
                      ],
                    ),
                    Text("বিপি নং: NA12345",
                        style: TextStyle(color: Colors.white, fontSize: 12.0)),
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
            top: MediaQuery.of(context).size.height * 0.20,
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
          _bannerCard(),
          if (!showDetails) ...[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.20 + 245,
              left: -10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.primaryColor,
                  size: 15,
                ),
                onPressed: () {
                  _swiperControllerPrescription.previous();
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.20 + 245,
              right: -10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.primaryColor,
                  size: 15,
                ),
                onPressed: () {
                  _swiperControllerPrescription.next();
                },
              ),
            ),
            _prescriptionBody(),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.20 + 450,
              left: -10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.primaryColor,
                  size: 15,
                ),
                onPressed: () {
                  _swiperControllerMedicine.previous();
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.20 + 450,
              right: -10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.primaryColor,
                  size: 15,
                ),
                onPressed: () {
                  _swiperControllerMedicine.next();
                },
              ),
            ),
            _medicineBody(),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.20 + 650,
              left: -10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.primaryColor,
                  size: 15,
                ),
                onPressed: () {
                  _swiperControllerReport.previous();
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.20 + 650,
              right: -10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.primaryColor,
                  size: 15,
                ),
                onPressed: () {
                  _swiperControllerReport.next();
                },
              ),
            ),
            _reportBody()
          ],
          if (showDetails) ...[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.20 + 130,
              left: 20,
              right: 20,
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.banners?[0].title} \n',
                          style: AppTheme.headlineLarge
                              .copyWith(color: AppTheme.bt1Card3),
                        ),
                        buildRichText(data.banners?[0].description ?? ''),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _bannerCard() {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.20 - 50,
        left: 20,
        right: 20,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF32348F),
                Color(0xFF494B9B),
                Color(0xFF5B5DA5),
                Color(0xFF343690),
                Color(0xFF32348F)
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Card(
            color: Colors.transparent,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: SizedBox(
              height: 170,
              child: Swiper(
                viewportFraction: 1,
                itemCount: 3,
                itemWidth: MediaQuery.of(context).size.width - 40,
                layout: SwiperLayout.DEFAULT,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${data.banners?[0].title}", // hardcoded index
                                  maxLines: 4,
                                  style: AppTheme.headlineLarge
                                      .copyWith(color: Colors.white)),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01),
                              Container(
                                width: 150,
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                child: !showDetails
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          alignment: Alignment.center,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          padding: const EdgeInsets.all(2),
                                          backgroundColor: AppTheme.bt1Card2,
                                        ),
                                        onPressed: () {
                                          toggleDetails();
                                        },
                                        child: const Text('বিস্তারিত দেখুন',
                                            style: TextStyle(
                                                color: AppTheme.primaryColor)))
                                    : const SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: double.infinity,
                            child: Image.network(
                                data.banners?[0].image ?? '', // hardcoded index
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
          ),
        ));
  }

  Widget _prescriptionBody() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.20 + 110,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "চলমান প্রেসক্রিপশন",
                    style: AppTheme.headLineMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "সব দেখুন",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 190,
                child: Swiper(
                  controller: _swiperControllerPrescription,
                  itemCount: data.prescriptions?.length ?? 0,
                  itemWidth: MediaQuery.of(context).size.width - 40,
                  itemHeight: 190,
                  layout: SwiperLayout.DEFAULT,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppTheme.cardColor1,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/images/pulse.svg',
                                color: AppTheme.primaryColor,
                                width: 50,
                              ),
                            ),
                            // const Icon(
                            //   Icons.medical_services,
                            //   color: AppTheme.primaryColor,
                            //   size: 50,
                            // ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "প্রেসক্রিপশন",
                                      style: AppTheme.bodyTextLarge,
                                    ),
                                    const Text("বিভাগঃ মেডিসিন",
                                        style: AppTheme.bodyTextSmall),
                                    Text(
                                      "রোগীর নামঃ ${data.prescriptions?[index].patientName} (${data.prescriptions?[index].serviceNumber})",
                                      style: AppTheme.bodyTextSmall,
                                    ),
                                    Text(
                                      "রোগীর আইডিঃ ${data.prescriptions?[index].patientCode}",
                                      style: AppTheme.bodyTextSmall,
                                    ),
                                    Text(
                                        DateConvert.convertDate(data
                                                .prescriptions?[index]
                                                .prescriptionDate ??
                                            ''),
                                        style: AppTheme.bodyTextSmall),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            padding: const EdgeInsets.all(2),
                                            backgroundColor:
                                                Theme.of(context).primaryColor),
                                        onPressed: () {
                                          // _pdfViewerKey.currentState
                                          //     ?.openBookmarkView();
                                          // print("object");
                                          // print(data.prescriptions?[index]
                                          //     .prescriptionUrl);
                                          // SfPdfViewer.network(

                                          //     key: _pdfViewerKey,
                                          //     data.prescriptions?[index].prescriptionDownloadUrl??
                                          //         '',
                                          //     );
                                        },
                                        child: const SizedBox(
                                          width: 85,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: AppTheme.whiteColor,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text('দেখুন',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(2),
                                      backgroundColor: AppTheme.bt1Card1),
                                  onPressed: () {},
                                  child: Text('সর্বশেষ',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor))),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _medicineBody() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.20 + 350,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "চলমান মেডিসিন",
                    style: AppTheme.headLineMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "সব দেখুন",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 115,
                // padding: EdgeInsets.all(10),
                child: Swiper(
                  controller: _swiperControllerMedicine,
                  itemCount: data.medicines?.length ?? 0,
                  itemWidth: MediaQuery.of(context).size.width - 40,
                  itemHeight: 115,
                  layout: SwiperLayout.DEFAULT,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppTheme.cardColor2,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/medicine.svg',
                                    color: AppTheme.primaryColor,
                                    // color: Color(0xFF8C8EFF),
                                    width: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    "${data.medicines?[index].itemName}",
                                    style: AppTheme.headLineMedium.copyWith(
                                        fontWeight: FontWeight.normal),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppTheme.bt1Card2),
                                      onPressed: () {},
                                      child: Text(
                                          patientName[data.medicines?[index]
                                                  .prescriptionNoFk] ??
                                              "",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor))),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "সময়কাল",
                                      style: AppTheme.bodyTextSmall
                                          .copyWith(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      "${data.medicines?[index].duration} মাস",
                                      style: AppTheme.bodyTextSmall,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "ডোজ",
                                      style: AppTheme.bodyTextSmall
                                          .copyWith(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      "${data.medicines?[index].dosage}",
                                      style: AppTheme.bodyTextSmall,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "নির্দেশনা",
                                      style: AppTheme.bodyTextSmall
                                          .copyWith(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      "${data.medicines?[index].instructionTake}",
                                      style: AppTheme.bodyTextSmall,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reportBody() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.20 + 510,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ইনভেস্টিগেশন রিপোর্ট",
                    style: AppTheme.headLineMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "সব দেখুন",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 190,
                child: Swiper(
                    controller: _swiperControllerReport,
                    itemCount:
                        data.investigationReports?.pathelogies?.length ?? 0,
                    itemWidth: MediaQuery.of(context).size.width - 40,
                    itemHeight: 190,
                    layout: SwiperLayout.DEFAULT,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppTheme.cardColor3,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/pulse.svg',
                                  color: AppTheme.primaryColor,
                                  width: 50,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.investigationReports
                                              ?.pathelogies?[index].itemName ??
                                          "",
                                      style: AppTheme.headLineMedium,
                                    ),
                                    Text(
                                        "বিভাগঃ ${data.investigationReports?.pathelogies?[index].dept}",
                                        style: AppTheme.bodyTextSmall),
                                    Text(
                                      "রোগীর নামঃ ${data.investigationReports?.pathelogies?[index].patientName}",
                                      style: AppTheme.bodyTextSmall,
                                    ),
                                    Text(
                                      "ল্যাব আইডিঃ ${data.investigationReports?.pathelogies?[index].labCode}",
                                      style: AppTheme.bodyTextSmall,
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(2),
                                                backgroundColor:
                                                    AppTheme.bt1Card3),
                                            onPressed: () {},
                                            child: const SizedBox(
                                              width: 100,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .remove_red_eye_outlined,
                                                    color: AppTheme.whiteColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text('রিপোর্ট ট্র্যাক',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                disabledBackgroundColor:
                                                    Colors.grey[300],
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(2),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor),
                                            onPressed: null,
                                            child: const SizedBox(
                                              width: 85,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .remove_red_eye_outlined,
                                                    color: AppTheme.whiteColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text('দেখুন',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // r
                            ],
                          ),
                        ),
                      );
                    },
                    pagination: const SwiperPagination(
                      builder: RectSwiperPaginationBuilder(
                        size: Size(40, 10),
                        activeSize: Size(55, 20),
                        color: Colors.amber,
                        activeColor: AppTheme.bt1Card3,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildRichText(String text) {
    List<TextSpan> spans = [];
    List<String> parts = text.split('\n\n');
    parts.remove(parts[parts.length - 1]);
    for (String part in parts) {
      if (part.contains(':')) {
        List<String> subParts = part.split(':');
        for (int i = 0; i < subParts.length; i++) {
          print('$i ==== ${subParts[i]}');
          if (i == 0) {
            String lastSpanText = spans.last.text ?? '';
            if (lastSpanText.endsWith('\n\n')) {
            } else {
              spans.add(
                const TextSpan(
                  text: '\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }
          }
          if (i != 0) {
            spans.add(
              const TextSpan(
                text: ':',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }
          spans.add(
            TextSpan(
              text: subParts[i],
              style: i % 2 == 0
                  ? const TextStyle(fontWeight: FontWeight.bold)
                  : const TextStyle(),
            ),
          );
        }
      } else {
        bool flag = !part.endsWith('।');

        spans.add(
          TextSpan(
            text: '$part\n\n',
            style: TextStyle(
              color: flag ? Colors.blue : Color(0xFF64748B),
              fontWeight: flag ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }
    }
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            fontSize: 15, height: 1.2, color: Color(0xFF64748B)),
        children: spans,
      ),
    );
  }
}
