import 'package:flutter/material.dart';
import 'package:flutter_weather_app_dio/core/widgets/custom_text.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text_field.dart';
import '../service/dio_service.dart';
import '../model/weather_model.dart';


class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final _cityTextController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final _dataService = DioService();
  final appbarTitle = "Weather Forecast";
  WeatherResponse? _response;

  Future<void> _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomText.appbarText(appbarTitle, context: context)),
        body: SingleChildScrollView(
          physics: focusNode.hasFocus ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: _allPage(context),
        ));
  }

  Center _allPage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.width * 0.5,
            child: CustomTextField(
              focusNode: focusNode,
              cityTextController: _cityTextController,
            ),
          ),
          //ElevatedButton(onPressed: _search, child: Text('Search')),
          CustomElevatedButton(
            onPressed: _search,
          ),
          if (_response != null) _resultBody(context)
        ],
      ),
    );
  }

  Center _resultBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText.cityText("${_response?.cityName}", context: context),
          CustomText.temperatureText('${_response?.tempInfo?.temperature}°C', context: context),
          CustomText.descriptionText(_response?.weatherInfo?.description ?? "", context: context),
          _imageContainer(context),
          CustomText.maxTempText('Max Temperature: ${_response?.tempInfo?.tempMax}°C', context: context),
          CustomText.minTempText('Min Temperature: ${_response?.tempInfo?.tempMin}°C', context: context),
          _lottieAndTextRow(context)
        ],
      ),
    );
  }

  Center _imageContainer(BuildContext context) {
    return Center(
        child: Container(
      color: context.appTheme.backgroundColor,
      child: Image.network(_response?.iconUrl ?? ""),
    ));
  }

  Row _lottieAndTextRow(BuildContext context) {
    return Row(
      children: [
        Lottie.asset('assets/wind.json', width: 60, height: 60),
        CustomText.windText('Wind: ${_response?.windInfo?.speed.toString() ?? ""} km/h', context: context)
      ],
    );
  }
}
