import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

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