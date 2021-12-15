
class Realtime {
  double temperature = 0;
  String skycon = '';
  AirQuality? airQuality;

  Realtime.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    skycon = json['skycon'];
    airQuality = json['air_quality'] != null
        ? new AirQuality.fromJson(json['air_quality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['skycon'] = this.skycon;
    if (this.airQuality != null) {
      data['air_quality'] = this.airQuality!.toJson();
    }
    return data;
  }
}

class AirQuality {
  AQI? aqi;

  AirQuality.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'] != null ? new AQI.fromJson(json['aqi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aqi != null) {
      data['aqi'] = this.aqi!.toJson();
    }
    return data;
  }
}

class AQI {
  int chn = 0;

  AQI.fromJson(Map<String, dynamic> json) {
    chn = json['chn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chn'] = this.chn;
    return data;
  }
}
