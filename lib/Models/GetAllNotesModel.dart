/// code : 200
/// success : true
/// timestamp : 1695810979888
/// message : "Paginated Response"
/// items : [{"_id":"6514050fafd623000097ae40","title":"3rd TODO Updated","description":"This is the Third TODO description","is_completed":true,"created_at":"2023-09-27T10:33:51.266Z","updated_at":"2023-09-27T10:33:51.266Z"},{"_id":"65140567afd623000097ae48","title":"3rd TODO Updated","description":"This is the Third TODO description","is_completed":true,"created_at":"2023-09-27T10:35:19.440Z","updated_at":"2023-09-27T10:35:19.440Z"}]
/// meta : {"total_items":2,"total_pages":1,"per_page_item":10,"current_page":1,"page_size":2,"has_more_page":false}

class GetAllNotesModel {
  GetAllNotesModel({
      int? code, 
      bool? success, 
      int? timestamp, 
      String? message, 
      List<Items>? items, 
      Meta? meta,}){
    _code = code;
    _success = success;
    _timestamp = timestamp;
    _message = message;
    _items = items;
    _meta = meta;
}

  GetAllNotesModel.fromJson(dynamic json) {
    _code = json['code'];
    _success = json['success'];
    _timestamp = json['timestamp'];
    _message = json['message'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  int? _code;
  bool? _success;
  int? _timestamp;
  String? _message;
  List<Items>? _items;
  Meta? _meta;
GetAllNotesModel copyWith({  int? code,
  bool? success,
  int? timestamp,
  String? message,
  List<Items>? items,
  Meta? meta,
}) => GetAllNotesModel(  code: code ?? _code,
  success: success ?? _success,
  timestamp: timestamp ?? _timestamp,
  message: message ?? _message,
  items: items ?? _items,
  meta: meta ?? _meta,
);
  int? get code => _code;
  bool? get success => _success;
  int? get timestamp => _timestamp;
  String? get message => _message;
  List<Items>? get items => _items;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['success'] = _success;
    map['timestamp'] = _timestamp;
    map['message'] = _message;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}

/// total_items : 2
/// total_pages : 1
/// per_page_item : 10
/// current_page : 1
/// page_size : 2
/// has_more_page : false

class Meta {
  Meta({
      int? totalItems, 
      int? totalPages, 
      int? perPageItem, 
      int? currentPage, 
      int? pageSize, 
      bool? hasMorePage,}){
    _totalItems = totalItems;
    _totalPages = totalPages;
    _perPageItem = perPageItem;
    _currentPage = currentPage;
    _pageSize = pageSize;
    _hasMorePage = hasMorePage;
}

  Meta.fromJson(dynamic json) {
    _totalItems = json['total_items'];
    _totalPages = json['total_pages'];
    _perPageItem = json['per_page_item'];
    _currentPage = json['current_page'];
    _pageSize = json['page_size'];
    _hasMorePage = json['has_more_page'];
  }
  int? _totalItems;
  int? _totalPages;
  int? _perPageItem;
  int? _currentPage;
  int? _pageSize;
  bool? _hasMorePage;
Meta copyWith({  int? totalItems,
  int? totalPages,
  int? perPageItem,
  int? currentPage,
  int? pageSize,
  bool? hasMorePage,
}) => Meta(  totalItems: totalItems ?? _totalItems,
  totalPages: totalPages ?? _totalPages,
  perPageItem: perPageItem ?? _perPageItem,
  currentPage: currentPage ?? _currentPage,
  pageSize: pageSize ?? _pageSize,
  hasMorePage: hasMorePage ?? _hasMorePage,
);
  int? get totalItems => _totalItems;
  int? get totalPages => _totalPages;
  int? get perPageItem => _perPageItem;
  int? get currentPage => _currentPage;
  int? get pageSize => _pageSize;
  bool? get hasMorePage => _hasMorePage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_items'] = _totalItems;
    map['total_pages'] = _totalPages;
    map['per_page_item'] = _perPageItem;
    map['current_page'] = _currentPage;
    map['page_size'] = _pageSize;
    map['has_more_page'] = _hasMorePage;
    return map;
  }

}

/// _id : "6514050fafd623000097ae40"
/// title : "3rd TODO Updated"
/// description : "This is the Third TODO description"
/// is_completed : true
/// created_at : "2023-09-27T10:33:51.266Z"
/// updated_at : "2023-09-27T10:33:51.266Z"

class Items {
  Items({
      String? id, 
      String? title, 
      String? description, 
      bool? isCompleted, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _description = description;
    _isCompleted = isCompleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Items.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _description = json['description'];
    _isCompleted = json['is_completed'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _title;
  String? _description;
  bool? _isCompleted;
  String? _createdAt;
  String? _updatedAt;
Items copyWith({  String? id,
  String? title,
  String? description,
  bool? isCompleted,
  String? createdAt,
  String? updatedAt,
}) => Items(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  isCompleted: isCompleted ?? _isCompleted,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  bool? get isCompleted => _isCompleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['is_completed'] = _isCompleted;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}