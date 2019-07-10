import 'package:facebook_audience_network/facebook_audience_network.dart';

bool interstitialLoaded = false;

FacebookBannerAd adBanner = FacebookBannerAd(
  placementId: "520598665142253_520602238475229",
  bannerSize: BannerSize.STANDARD,
  listener: (result, value) {
    switch (result) {
      case BannerAdResult.ERROR:
        print("Error: $value");
        break;
      case BannerAdResult.LOADED:
        print("Loaded: $value");
        break;
      case BannerAdResult.CLICKED:
        print("Clicked: $value");
        break;
      case BannerAdResult.LOGGING_IMPRESSION:
        print("Logging Impression: $value");
        break;
    }
  },
);

void loadInterstitial(Function callback) {
  FacebookInterstitialAd.loadInterstitialAd(
    placementId: "520598665142253_520650845137035",
    listener: (result, value) {
      print("Interstitial Ad: $result --> $value");
      if (result == InterstitialAdResult.LOADED) interstitialLoaded = true;

      /// Once an Interstitial Ad has been dismissed and becomes invalidated,
      /// load a fresh Ad by calling this function.
      if (result == InterstitialAdResult.DISMISSED &&
          value["invalidated"] == true) {
        interstitialLoaded = false;
        callback();
        loadInterstitial(callback);
      }
    },
  );
}

bool showInterstitial() {
  FacebookInterstitialAd.showInterstitialAd();
  return interstitialLoaded;
}
