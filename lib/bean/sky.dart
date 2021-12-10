class Sky {
  String info;
  String icon;
  String bg;

  Sky(this.info, this.icon, this.bg);

  var _sky = {
    "CLEAR_DAY": Sky(
      '晴',
      'assets/images/ic_clear_day.png',
      'assets/images/bg_clear_day.jpg',
    ),
    "CLEAR_NIGHT": Sky(
      "晴",
      'assets/images/ic_clear_night.png',
      'assets/images/bg_clear_night.jpg',
    ),
    "PARTLY_CLOUDY_DAY": Sky(
      "多云",
      'assets/images/ic_partly_cloud_day.png',
      'assets/images/bg_partly_cloudy_day.jpg',
    ),
    "PARTLY_CLOUDY_NIGHT": Sky(
      "多云",
      'assets/images/ic_partly_cloud_night.png',
      'assets/images/bg_partly_cloudy_night.jpg',
    ),
    "CLOUDY": Sky(
      "阴",
      'assets/images/ic_cloudy.png',
      'assets/images/bg_cloudy.jpg',
    ),
    "WIND": Sky(
      "大风",
      'assets/images/ic_cloudy.png',
      'assets/images/bg_wind.jpg',
    ),
    "LIGHT_RAIN": Sky(
      "小雨",
      'assets/images/ic_light_rain.png',
      'assets/images/bg_rain.jpg',
    ),
    "MODERATE_RAIN": Sky(
      "中雨",
      'assets/images/ic_moderate_rain.png',
      'assets/images/bg_rain.jpg',
    ),
    "HEAVY_RAIN": Sky(
      "大雨",
      'assets/images/ic_heavy_rain.png',
      'assets/images/bg_rain.jpg',
    ),
    "STORM_RAIN": Sky(
      "暴雨",
      'assets/images/ic_storm_rain.png',
      'assets/images/bg_rain.jpg',
    ),
    "THUNDER_SHOWER": Sky(
      "雷阵雨",
      'assets/images/ic_thunder_shower.png',
      'assets/images/bg_rain.jpg',
    ),
    "SLEET": Sky(
      "雨夹雪",
      'assets/images/ic_sleet.png',
      'assets/images/bg_rain.jpg',
    ),
    "LIGHT_SNOW": Sky(
      "小雪",
      'assets/images/ic_light_snow.png',
      'assets/images/bg_snow.jpg',
    ),
    "MODERATE_SNOW": Sky(
      "中雪",
      'assets/images/ic_moderate_snow.png',
      'assets/images/bg_snow.jpg',
    ),
    "HEAVY_SNOW": Sky(
      "大雪",
      'assets/images/ic_heavy_snow.png',
      'assets/images/bg_snow.jpg',
    ),
    "STORM_SNOW": Sky(
      "暴雪",
      'assets/images/ic_heavy_snow.png',
      'assets/images/bg_snow.jpg',
    ),
    "HAIL": Sky(
      "冰雹",
      'assets/images/ic_hail.png',
      'assets/images/bg_snow.jpg',
    ),
    "LIGHT_HAZE": Sky(
      "轻度雾霾",
      'assets/images/ic_light_haze.png',
      'assets/images/bg_fog.jpg',
    ),
    "MODERATE_HAZE": Sky(
      "中度雾霾",
      'assets/images/ic_moderate_haze.png',
      'assets/images/bg_fog.jpg',
    ),
    "HEAVY_HAZE": Sky(
      "重度雾霾",
      'assets/images/ic_heavy_haze.png',
      'assets/images/bg_fog.jpg',
    ),
    "FOG": Sky(
      "雾",
      'assets/images/ic_fog.png',
      'assets/images/bg_fog.jpg',
    ),
    "DUST": Sky(
      "浮尘",
      'assets/images/ic_fog.png',
      'assets/images/bg_fog.jpg',
    )
  };

  Sky getSky(String skycon) {
    return _sky[skycon] ?? _sky['CLEAR_DAY']!;
  }
}
