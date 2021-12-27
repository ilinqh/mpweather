class Sky {
  String info;
  String icon;
  String bg;

  Sky(this.info, this.icon, this.bg);

  static var _sky = {
    "CLEAR_DAY": Sky(
      '晴',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_clear_day.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_clear_day.jpg',
    ),
    "CLEAR_NIGHT": Sky(
      "晴",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_clear_night.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_clear_night.jpg',
    ),
    "PARTLY_CLOUDY_DAY": Sky(
      "多云",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_partly_cloud_day.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_partly_cloudy_day.jpg',
    ),
    "PARTLY_CLOUDY_NIGHT": Sky(
      "多云",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_partly_cloud_night.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_partly_cloudy_night.jpg',
    ),
    "CLOUDY": Sky(
      "阴",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_cloudy.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_cloudy.jpg',
    ),
    "WIND": Sky(
      "大风",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_cloudy.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_wind.jpg',
    ),
    "LIGHT_RAIN": Sky(
      "小雨",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_light_rain.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_rain.jpg',
    ),
    "MODERATE_RAIN": Sky(
      "中雨",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_moderate_rain.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_rain.jpg',
    ),
    "HEAVY_RAIN": Sky(
      "大雨",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_heavy_rain.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_rain.jpg',
    ),
    "STORM_RAIN": Sky(
      "暴雨",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_storm_rain.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_rain.jpg',
    ),
    "THUNDER_SHOWER": Sky(
      "雷阵雨",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_thunder_shower.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_rain.jpg',
    ),
    "SLEET": Sky(
      "雨夹雪",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_sleet.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_rain.jpg',
    ),
    "LIGHT_SNOW": Sky(
      "小雪",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_light_snow.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_snow.jpg',
    ),
    "MODERATE_SNOW": Sky(
      "中雪",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_moderate_snow.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_snow.jpg',
    ),
    "HEAVY_SNOW": Sky(
      "大雪",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_heavy_snow.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_snow.jpg',
    ),
    "STORM_SNOW": Sky(
      "暴雪",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_heavy_snow.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_snow.jpg',
    ),
    "HAIL": Sky(
      "冰雹",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_hail.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_snow.jpg',
    ),
    "LIGHT_HAZE": Sky(
      "轻度雾霾",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_light_haze.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_fog.jpg',
    ),
    "MODERATE_HAZE": Sky(
      "中度雾霾",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_moderate_haze.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_fog.jpg',
    ),
    "HEAVY_HAZE": Sky(
      "重度雾霾",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_heavy_haze.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_fog.jpg',
    ),
    "FOG": Sky(
      "雾",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_fog.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_fog.jpg',
    ),
    "DUST": Sky(
      "浮尘",
      'https://gitee.com/llqinhh/mpweather-images/raw/master/ic_fog.png',
      'https://gitee.com/llqinhh/mpweather-images/raw/master/bg_fog.jpg',
    )
  };

  static Sky getSky(String skycon) {
    return _sky[skycon] ?? _sky['CLEAR_DAY']!;
  }
}
