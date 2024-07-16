class AppConfiguration {
  String? versionNumber;
  String? iosAppID;
  String? buildNumber;
  String? customerName;
  bool? active;

  AppConfiguration(
      {this.versionNumber,
        this.iosAppID,
        this.buildNumber,
        this.customerName,
        this.active});

  AppConfiguration.fromJson(Map<String, dynamic> json) {
    versionNumber = json['versionNumber'];
    iosAppID = json['iosAppID'];
    buildNumber = json['buildNumber'];
    customerName = json['customerName'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['versionNumber'] = versionNumber;
    data['iosAppID'] = iosAppID;
    data['buildNumber'] = buildNumber;
    data['customerName'] = customerName;
    data['active'] = active;
    return data;
  }
}