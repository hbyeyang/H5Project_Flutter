class NetUrlBeanEntity {
  String ret;
  List<NetUrlBeanData> data;

  NetUrlBeanEntity({this.ret, this.data});

  NetUrlBeanEntity.fromJson(Map<String, dynamic> json) {
    ret = json['ret'];
    if (json['data'] != null) {
      data = new List<NetUrlBeanData>();
      (json['data'] as List).forEach((v) {
        data.add(new NetUrlBeanData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ret'] = this.ret;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NetUrlBeanData {
  String uv;
  String pv;
  String name;
  int type;
  String url;

  @override
  String toString() {
    return 'NetUrlBeanData{uv: $uv, pv: $pv, name: $name, type: $type, url: $url}';
  }

  NetUrlBeanData(this.uv, this.pv, this.name, this.type, this.url);

  NetUrlBeanData.fromJson(Map<String, dynamic> json) {
    uv = json['uv'];
    pv = json['pv'];
    name = json['name'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uv'] = this.uv;
    data['pv'] = this.pv;
    data['name'] = this.name;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
