class LinksData {
    List<Data> data;
    String ret;

    LinksData({this.data, this.ret});

    factory LinksData.fromJson(Map<String, dynamic> json) {
        return LinksData(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
            ret: json['ret'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ret'] = this.ret;
        if (this.data != null) {
            data['`data`'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Data {
    String name;
    String pv;
    int type;
    String url;
    String uv;

    Data({this.name, this.pv, this.type, this.url, this.uv});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            name: json['name'],
            pv: json['pv'],
            type: json['type'],
            url: json['url'],
            uv: json['uv'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['pv'] = this.pv;
        data['type'] = this.type;
        data['url'] = this.url;
        data['uv'] = this.uv;
        return data;
    }
}