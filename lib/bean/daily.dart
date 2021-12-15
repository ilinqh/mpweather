class Daily {
  List<Temperature>? temperature;
  List<Skycon>? skycon;
  LifeIndex? lifeIndex;

  Daily.fromJson(Map<String, dynamic> json) {
    if (json['temperature'] != null) {
      temperature = <Temperature>[];
      json['temperature'].forEach((v) {
        temperature!.add(Temperature.fromJson(v));
      });
    }
    if (json['skycon'] != null) {
      skycon = <Skycon>[];
      json['skycon'].forEach((v) {
        skycon!.add(Skycon.fromJson(v));
      });
    }
    lifeIndex = json['life_index'] != null
        ? LifeIndex.fromJson(json['life_index'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.temperature != null) {
      data['temperature'] = this.temperature!.map((v) => v.toJson()).toList();
    }
    if (this.skycon != null) {
      data['skycon'] = this.skycon!.map((v) => v.toJson()).toList();
    }
    if (this.lifeIndex != null) {
      data['life_index'] = this.lifeIndex!.toJson();
    }
    return data;
  }
}

class Temperature {
  double max = 0;
  double min = 0;

  Temperature.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['min'] = this.min;
    return data;
  }
}

class Skycon {
  String date = '';
  String value = '';

  Skycon.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['value'] = this.value;
    return data;
  }
}

class LifeIndex {
  List<LifeDescription>? ultraviolet;
  List<LifeDescription>? carWashing;
  List<LifeDescription>? dressing;
  List<LifeDescription>? coldRisk;

  LifeIndex.fromJson(Map<String, dynamic> json) {
    if (json['ultraviolet'] != null) {
      ultraviolet = <LifeDescription>[];
      json['ultraviolet'].forEach((v) {
        ultraviolet!.add(LifeDescription.fromJson(v));
      });
    }
    if (json['carWashing'] != null) {
      carWashing = <LifeDescription>[];
      json['carWashing'].forEach((v) {
        carWashing!.add(LifeDescription.fromJson(v));
      });
    }
    if (json['dressing'] != null) {
      dressing = <LifeDescription>[];
      json['dressing'].forEach((v) {
        dressing!.add(LifeDescription.fromJson(v));
      });
    }

    if (json['coldRisk'] != null) {
      coldRisk = <LifeDescription>[];
      json['coldRisk'].forEach((v) {
        coldRisk!.add(LifeDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ultraviolet != null) {
      data['ultraviolet'] = this.ultraviolet!.map((v) => v.toJson()).toList();
    }
    if (this.carWashing != null) {
      data['carWashing'] = this.carWashing!.map((v) => v.toJson()).toList();
    }
    if (this.dressing != null) {
      data['dressing'] = this.dressing!.map((v) => v.toJson()).toList();
    }
    if (this.coldRisk != null) {
      data['coldRisk'] = this.coldRisk!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LifeDescription {
  String desc = '';

  LifeDescription.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    return data;
  }
}
