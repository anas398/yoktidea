class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  int? countryId;
  String? phone;
  String? phoneVerifiedAt;
  String? avatar;
  String? approvedAt;
  String? detailsType;
  String? detailsId;
  int? profileStatusId;
  int? reviewCount;
  String? reviewRating;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.countryId,
        this.phone,
        this.phoneVerifiedAt,
        this.avatar,
        this.approvedAt,
        this.detailsType,
        this.detailsId,
        this.profileStatusId,
        this.reviewCount,
        this.reviewRating,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    countryId = json['country_id'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    avatar = json['avatar'];
    approvedAt = json['approved_at'];
    detailsType = json['details_type'];
    detailsId = json['details_id'];
    profileStatusId = json['profile_status_id'];
    reviewCount = json['review_count'];
    reviewRating = json['review_rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country_id'] = this.countryId;
    data['phone'] = this.phone;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['avatar'] = this.avatar;
    data['approved_at'] = this.approvedAt;
    data['details_type'] = this.detailsType;
    data['details_id'] = this.detailsId;
    data['profile_status_id'] = this.profileStatusId;
    data['review_count'] = this.reviewCount;
    data['review_rating'] = this.reviewRating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}