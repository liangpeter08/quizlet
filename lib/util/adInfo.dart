import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import '../views/questionview.dart';

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['Canada', 'Citizenship', 'test'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  // adUnitId:  'ca-app-pub-3940256099942544/6300978111', // test ad
  adUnitId: 'ca-app-pub-3370394751776686/1968417247',
  size: AdSize.banner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

InterstitialAd myInterstitial(context) {
  return InterstitialAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  // adUnitId: 'ca-app-pub-3940256099942544/1033173712', // test
  adUnitId: 'ca-app-pub-3370394751776686/3290071927',
  targetingInfo: targetingInfo,
  listener: context == null ? (MobileAdEvent event) {
    if(event == MobileAdEvent.opened) {
    print(event);
    Future.delayed(const Duration(seconds: 1), () {return Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return QuestionPage(skipAd: false);
          }));});
    print("InterstitialAd event is $event");
    }
  } : null,
);
}
