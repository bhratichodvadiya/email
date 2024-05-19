import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:flutter_email_sender/flutter_email_sender.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  // final _key = GlobalKey<FormState>();
  // TextEditingController email = TextEditingController();
  // TextEditingController body = TextEditingController();
  // TextEditingController subject = TextEditingController();

  // sendEmail(String recipients, String body, String subject) async {
  //   final Email email = Email(
  //       body: body, subject: subject, recipients: [recipients], isHTML: false);
  //   await FlutterEmailSender.send(email);
  // }

  bool isbannerloaded = false;
  late BannerAd bannerAd;
  initialibanner() async {
    bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: 'ca-app-pub-3940256099942544/9214589741',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isbannerloaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            isbannerloaded = false;
            print('Error');
          },
        ),
        request: AdRequest());

    bannerAd.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialibanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar:
      //     isbannerloaded == true ? SizedBox(
      //       height: 100,
      //       child: AdWidget(ad: bannerAd)) : Container(),

      //     backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Banner Ads'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  FlutterPhoneDirectCaller.callNumber('+917874159935');
                  launch('tel:+91439234857');
                  if (!await launch('tel:+917874159937'))
                    throw 'Cloud not lunch';
                },
                child: Icon(Icons.call)),
            Gap(10),
            ElevatedButton(
                onPressed: () async {
                  if (!await launch('sms:+917874159937'))
                    throw 'Cloud not lunch';
                },
                child: Icon(Icons.sms)),
          ],
        ),
      ),
    );
  }
}
