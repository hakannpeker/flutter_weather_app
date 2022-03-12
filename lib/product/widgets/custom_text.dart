import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomText extends Text {
  const CustomText(String data) : super(data);

  CustomText.appbarText(String data, {required BuildContext context})
      : super(data, style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white));

  CustomText.cityText(String data, {required BuildContext context})
      : super(data, style: context.textTheme.headlineLarge?.copyWith(color: Colors.white));

  CustomText.temperatureText(String data, {required BuildContext context})
      : super(data, style: context.textTheme.headlineLarge?.copyWith(color: Colors.white));

  CustomText.descriptionText(String data, {required BuildContext context})
      : super(data, style: context.textTheme.headlineMedium?.copyWith(color: Colors.white));

  CustomText.maxTempText(String data, {required BuildContext context})
      : super(data, style: context.textTheme.headline5?.copyWith(color: Colors.white));

  CustomText.minTempText(String data, {required BuildContext context})
      : super(data, style: context.textTheme.headline5?.copyWith(color: Colors.white));

  CustomText.windText(String data, {required BuildContext context}) 
      : super(data, style: context.textTheme.headline5?.copyWith(color: Colors.white));
}
