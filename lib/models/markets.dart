class Markets {
  List<MarketList>? marketList;

  Markets({this.marketList});

  Markets.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      marketList = <MarketList>[];

      json['list'].forEach((value) {
        marketList!.add(MarketList.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (marketList != null) {
      data['list'] = marketList!.map((value) => value.toJson()).toList();
    }

    return data;
  }
}

class MarketList {
  bool? scoreBoardShareBool;
  int? siteCateSeq;
  int? scoreBoardShareCount;
  String? allCount;
  int? productCount;
  bool? showSearchBar;
  String? scoreBoardVisitorCount;
  bool? showPopularItems;
  bool? showBanner;
  String? faviconRoot;
  bool? popularlist;
  bool? showRecentSoldItems;
  bool? showAdSlide;
  String? storeName;
  String? storeUrlName;
  dynamic scoreBoardShareCountFormatted; // can int and string
  int? scoreBoardSaleCount;
  String? kakaoImgRoot;
  bool? scoreBoardSaleBool;
  String? tPage;
  String? storeDescription;
  int? scoreBoardVisitorCountInteger;
  String? storeDescriptionOriginal;
  String? instagramUrl;
  List<DtoList>? dtoList;

  MarketList(
      {this.scoreBoardShareBool,
      this.siteCateSeq,
      this.scoreBoardShareCount,
      this.allCount,
      this.productCount,
      this.showSearchBar,
      this.scoreBoardVisitorCount,
      this.showPopularItems,
      this.showBanner,
      this.faviconRoot,
      this.popularlist,
      this.showRecentSoldItems,
      this.showAdSlide,
      this.storeName,
      this.storeUrlName,
      this.scoreBoardShareCountFormatted,
      this.scoreBoardSaleCount,
      this.kakaoImgRoot,
      this.scoreBoardSaleBool,
      this.tPage,
      this.storeDescription,
      this.scoreBoardVisitorCountInteger,
      this.storeDescriptionOriginal,
      this.instagramUrl,
      this.dtoList});

  MarketList.fromJson(Map<String, dynamic> json) {
    scoreBoardShareBool = json['scoreBoardShareBool'];
    siteCateSeq = json['siteCateSeq'];
    scoreBoardShareCount = json['scoreBoardShareCount'];
    allCount = json['allCount'];
    productCount = json['productCount'];
    showSearchBar = json['showSearchBar'];
    scoreBoardVisitorCount = json['scoreBoardVisitorCount'];
    showPopularItems = json['showPopularItems'];
    showBanner = json['showBanner'];
    faviconRoot = json['faviconRoot'];
    popularlist = json['popularlist'];
    showRecentSoldItems = json['showRecentSoldItems'];
    showAdSlide = json['showAdSlide'];
    storeName = json['storeName'];
    storeUrlName = json['storeUrlName'];
    scoreBoardShareCountFormatted = json['scoreBoardShareCountFormatted'];
    scoreBoardSaleCount = json['scoreBoardSaleCount'];
    kakaoImgRoot = json['kakaoImgRoot'];
    scoreBoardSaleBool = json['scoreBoardSaleBool'];
    tPage = json['tPage'];
    storeDescription = json['storeDescription'];
    scoreBoardVisitorCountInteger = json['scoreBoardVisitorCountInteger'];
    storeDescriptionOriginal = json['storeDescriptionOriginal'];
    instagramUrl = json['instagramUrl'];

    if (json['dtoList'] != null) {
      dtoList = <DtoList>[];

      json['dtoList'].forEach((v) {
        dtoList!.add(DtoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scoreBoardShareBool'] = scoreBoardShareBool;
    data['siteCateSeq'] = siteCateSeq;
    data['scoreBoardShareCount'] = scoreBoardShareCount;
    data['allCount'] = allCount;
    data['productCount'] = productCount;
    data['showSearchBar'] = showSearchBar;
    data['scoreBoardVisitorCount'] = scoreBoardVisitorCount;
    data['showPopularItems'] = showPopularItems;
    data['showBanner'] = showBanner;
    data['faviconRoot'] = faviconRoot;
    data['popularlist'] = popularlist;
    data['showRecentSoldItems'] = showRecentSoldItems;
    data['showAdSlide'] = showAdSlide;
    data['storeName'] = storeName;
    data['storeUrlName'] = storeUrlName;
    data['scoreBoardShareCountFormatted'] = scoreBoardShareCountFormatted;
    data['scoreBoardSaleCount'] = scoreBoardSaleCount;
    data['kakaoImgRoot'] = kakaoImgRoot;
    data['scoreBoardSaleBool'] = scoreBoardSaleBool;
    data['tPage'] = tPage;
    data['storeDescription'] = storeDescription;
    data['scoreBoardVisitorCountInteger'] = scoreBoardVisitorCountInteger;
    data['storeDescriptionOriginal'] = storeDescriptionOriginal;
    data['instagramUrl'] = instagramUrl;

    if (dtoList != null) {
      data['dtoList'] = dtoList!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class DtoList {
  String? title;
  String? subTitle;
  int? siteCateSeq;
  String? productNum;
  int? price;
  int? boardSeq;
  int? seqNo;
  List<ProductImgInfo>? productImgInfo;
  String? siteGalleryRoot;
  String? siteCustomUrl;
  bool? likeBoolean;
  int? likeCount;
  bool? commentBoolean;
  int? commentCount;
  bool? shareBoolean;
  int? shareCount;
  bool? lastItem;

  DtoList(
      {this.title,
      this.subTitle,
      this.siteCateSeq,
      this.productNum,
      this.price,
      this.boardSeq,
      this.seqNo,
      this.productImgInfo,
      this.siteGalleryRoot,
      this.siteCustomUrl,
      this.likeBoolean,
      this.likeCount,
      this.commentBoolean,
      this.commentCount,
      this.shareBoolean,
      this.shareCount,
      this.lastItem});

  DtoList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    siteCateSeq = json['siteCateSeq'];
    productNum = json['productNum'];
    price = json['price'];
    boardSeq = json['boardSeq'];
    seqNo = json['seqNo'];
    siteGalleryRoot = json['siteGalleryRoot'];
    siteCustomUrl = json['siteCustomUrl'];
    likeBoolean = json['likeBoolean'];
    likeCount = json['likeCount'];
    commentBoolean = json['commentBoolean'];
    commentCount = json['commentCount'];
    shareBoolean = json['shareBoolean'];
    shareCount = json['shareCount'];
    lastItem = json['lastItem'];

    if (json['productImgInfo'] != null) {
      productImgInfo = <ProductImgInfo>[];
      json['productImgInfo'].forEach((v) {
        productImgInfo!.add(ProductImgInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['subTitle'] = subTitle;
    data['siteCateSeq'] = siteCateSeq;
    data['productNum'] = productNum;
    data['price'] = price;
    data['boardSeq'] = boardSeq;
    data['seqNo'] = seqNo;

    if (productImgInfo != null) {
      data['productImgInfo'] = productImgInfo!.map((v) => v.toJson()).toList();
    }

    data['siteGalleryRoot'] = siteGalleryRoot;
    data['siteCustomUrl'] = siteCustomUrl;
    data['likeBoolean'] = likeBoolean;
    data['likeCount'] = likeCount;
    data['commentBoolean'] = commentBoolean;
    data['commentCount'] = commentCount;
    data['shareBoolean'] = shareBoolean;
    data['shareCount'] = shareCount;
    data['lastItem'] = lastItem;

    return data;
  }
}

class ProductImgInfo {
  int? seqNo;
  String? fileNameChange;

  ProductImgInfo({this.seqNo, this.fileNameChange});

  ProductImgInfo.fromJson(Map<String, dynamic> json) {
    seqNo = json['seqNo'];
    fileNameChange = json['fileNameChange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seqNo'] = seqNo;
    data['fileNameChange'] = fileNameChange;

    return data;
  }
}
