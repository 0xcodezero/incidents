class Incident {
  String? id;
  String? description;
  int? latitude;
  int? longitude;
  int? status;
  int? priority;
  int? typeId;
  String? issuerId;
  String? assigneeId;
  String? createdAt;
  String? updatedAt;
  List<Medias>? medias;

  Incident(
      {this.id,
      this.description,
      this.latitude,
      this.longitude,
      this.status,
      this.priority,
      this.typeId,
      this.issuerId,
      this.assigneeId,
      this.createdAt,
      this.updatedAt,
      this.medias});

  Incident.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    priority = json['priority'];
    typeId = json['typeId'];
    issuerId = json['issuerId'];
    assigneeId = json['assigneeId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['medias'] != null) {
      medias = <Medias>[];
      json['medias'].forEach((v) {
        medias!.add(new Medias.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['priority'] = this.priority;
    data['typeId'] = this.typeId;
    data['issuerId'] = this.issuerId;
    data['assigneeId'] = this.assigneeId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.medias != null) {
      data['medias'] = this.medias!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medias {
  String? id;
  String? mimeType;
  String? url;
  int? type;
  String? incidentId;

  Medias({this.id, this.mimeType, this.url, this.type, this.incidentId});

  Medias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mimeType = json['mimeType'];
    url = json['url'];
    type = json['type'];
    incidentId = json['incidentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mimeType'] = this.mimeType;
    data['url'] = this.url;
    data['type'] = this.type;
    data['incidentId'] = this.incidentId;
    return data;
  }
}
