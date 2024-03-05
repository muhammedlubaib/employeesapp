class PaginationModel<T> {
  final bool isLastPage;
  final int nextPage;
  final int currenPage;
  final List<T> newItems;

  PaginationModel({
    required this.isLastPage,
    required this.nextPage,
    required this.newItems,
    required this.currenPage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLastPage': isLastPage,
      'nextPage': nextPage,
      'newItems': newItems,
    };
  }

  factory PaginationModel.fromMap(Map<String, dynamic> map,List<T> newItems) {
    return PaginationModel<T>(
      isLastPage:newItems.length <  ((map['per_page'] as int? ) ?? 0) ,
      nextPage: ((map['current_page'] as int?) ?? 0) +1 ,
      currenPage: (map['current_page'] as int?) ?? 0,
      newItems: newItems,
    );
  }
}
