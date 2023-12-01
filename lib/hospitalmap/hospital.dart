//병원위치 api(1차)
class Location {
  String? distance; // 현재 위치에서의 거리(필수)
  String? hpid; // 병원 아이디(필수)

  Location({
    this.distance,
    this.hpid,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      distance: json["distance"] as String,
      hpid: json["hpid"] as String,
    );
  }
  // Override hashCode and operator == to identify instances by hpid
  @override
  int get hashCode => hpid.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HospitalCode && hpid == other.hpid;
}

//병원 진료코드 api(2차)
class HospitalCode {
  String? dutyName; // 병원 이름 (필수)
  String? dutyDiv; // 병원 종류 필요?
  String? dutyAddr; // 병원 위치(도로명 주소) (필수)
  String? dgidIdName; // 병원진료코드(필수)
  String? dutyTel1; //대표전화
  String? latitude; //병원 위도 (필수)
  String? longitude; // 병원 경도 (필수)
  String? hpid; // 병원 아이디
  String? distance; // 현재 위치에서의 거리(필수)

  HospitalCode({
    this.dutyAddr,
    this.dutyDiv,
    this.dutyName,
    this.latitude,
    this.longitude,
    this.dgidIdName,
    this.dutyTel1,
    this.hpid,
  });

  factory HospitalCode.fromJson(Map<String, dynamic> json) {
    return HospitalCode(
      dgidIdName: json['dgidIdName'] as String? ?? '',
      dutyAddr: json['dutyAddr'] as String? ?? '',
      dutyName: json['dutyName'] as String? ?? '',
      dutyTel1: json['dutyTel1'] as String? ?? '',
      latitude: json['wgs84Lat'] as String? ?? '',
      longitude: json['wgs84Lon'] as String? ?? '',
      dutyDiv: json['dutyDiv'] as String? ?? '',
      hpid: json["hpid"] as String,
    );
  }
}

/* dutyDiv (병원분류)
A[상급종합병원, 종합병원]
B[병원, 군 병원]
C[의원,군 의원]
D[요양병원]
E[한방병원]
G[한의원,군 한의원]
H[약국]
I[기타]
M[치과병원]
N[치과의원]
R[보건소, 보건지소, 보건진료소, 보건의료원, S이송단체]
T[119구급대]
U[경찰서(교도소포함)]
V[지방자치단체]
W[기타시설, 군 기타]
Y[중앙응급의료센터]
Z[응급의료지원센터]
 */
/* dgidIdName (병원진료코드)   가정의학과,내과,마취통증의학과,... 이런 형식으로 들어옴
D001:내과,
D002:소아청소년과,
D003:신경과,
D004:정신건강의학과,
D005:피부과,
D006:외과,
D007:흉부외과,
D008:정형외과,
D009:신경외과,
D010:성형외과,
D011:산부인과,
D012:안과,
D013:이비인후과,
D014:비뇨기과,
D016:재활의학과,
D017:마취통증의학과,
D018:영상의학과,
D019:치료방사선과,
D020:임상병리과,
D021:해부병리과,
D022:가정의학과,
D023:핵의학과,
D024:응급의학과,
D026:치과,
D034:구강악안면외과
 */
