class NewItems {
  String? productImgInfo;
  String? subTitle;
  String? seqNo;
  String? siteCustomUrl;
  String? price;
  String? siteGalleryRoot;
  String? siteName;
  String? boardSeq;
  String? title;

  NewItems({
    this.productImgInfo,
    this.subTitle,
    this.seqNo,
    this.siteCustomUrl,
    this.price,
    this.siteGalleryRoot,
    this.siteName,
    this.boardSeq,
    this.title,
  });

  factory NewItems.fromJson(Map<String, dynamic> json) {
    return NewItems(
      productImgInfo: json['productImgInfo'],
      subTitle: json['subTitle'],
      seqNo: json['seqNo'],
      siteCustomUrl: json['siteCustomUrl'],
      price: json['price'],
      siteGalleryRoot: json['siteGalleryRoot'],
      siteName: json['siteName'],
      boardSeq: json['boardSeq'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productImgInfo'] = productImgInfo;
    data['subTitle'] = subTitle;
    data['seqNo'] = seqNo;
    data['siteCustomUrl'] = siteCustomUrl;
    data['price'] = price;
    data['siteGalleryRoot'] = siteGalleryRoot;
    data['siteName'] = siteName;
    data['boardSeq'] = boardSeq;
    data['title'] = title;

    return data;
  }
}
