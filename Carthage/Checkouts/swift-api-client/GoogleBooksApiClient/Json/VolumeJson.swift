import Foundation

extension Volumes: Deserializable {
    
    public static func create(_ dict: [AnyHashable:Any]) -> Volumes? {
        guard
            let kind = dict["kind"] as? String, kind == BooksKind.volumes.description,
            let items = dict["items"] as? [[AnyHashable:Any]]
            else { return nil }
        return Volumes(totalItems: dict["totalItems"] as? Int,items: items.flatMap(Volume.create))
    }
    
}

extension Volume: Deserializable {
    
    public static func create(_ dict: [AnyHashable:Any]) -> Volume? {
        guard
            let kind = dict["kind"] as? String, kind == BooksKind.volume.description,
            let id = dict["id"] as? String,
            let etag = dict["etag"] as? String,
            let selfLinkString = dict["selfLink"] as? String, let selfLink = URL(string: selfLinkString),
            let volumeInfoDict = dict["volumeInfo"] as? [AnyHashable:Any]
            else { return nil }
        guard
            let volumeInfo = VolumeInfo.create(volumeInfoDict)
            else { return nil }
        let userInfoDict = dict["userInfo"] as? [AnyHashable:Any]
        let userInfo = userInfoDict.flatMap(Volume.UserInfo.create)
        let saleInfoDict = dict["saleInfo"] as? [AnyHashable:Any]
        let saleInfo = saleInfoDict.flatMap(Volume.SaleInfo.create)
        let accessInfoDict = dict["accessInfo"] as? [AnyHashable:Any]
        let accessInfo = accessInfoDict.flatMap(Volume.AccessInfo.create)
        let searchInfoDict = dict["searchInfo"] as? [AnyHashable:Any]
        let searchInfo = searchInfoDict.flatMap(Volume.SearchInfo.create)
        return Volume(
            id: Id(id),
            etag: etag,
            selfLink: selfLink,
            volumeInfo: volumeInfo,
            userInfo: userInfo,
            saleInfo: saleInfo,
            accessInfo: accessInfo,
            searchInfo: searchInfo
        )
    }
    
}

extension Volume.VolumeInfo {
    
    static func create(_ dict: [AnyHashable:Any]) -> Volume.VolumeInfo? {
        guard
            let title = dict["title"] as? String
            else { return nil }
        let subtitle = dict["subtitle"] as? String
        let authors = dict["authors"] as? [String]
        let publisher = dict["publisher"] as? String
        let publishedDate = dict["publishedDate"] as? String
        let desc = dict["description"] as? String
        let industryIdentifers = (dict["industryIdentifiers"] as? [[AnyHashable:Any]])?.flatMap({ Volume.VolumeInfo.IndustryIdentifer.create($0) })
        let pageCount = dict["pageCount"] as? Int
        let dimensions = (dict["dimensions"] as? [AnyHashable:Any]).flatMap(Dimensions.create)
        let printType = dict["printType"] as? String
        let mainCategory = dict["mainCategory"] as? String
        let categories = dict["categories"] as? [String]
        let averageRating = dict["avarageRating"] as? Double
        let ratingCount = dict["ratingsCount"] as? Int
        let contentVersion = dict["contentVersion"] as? String
        let language = dict["language"] as? String
        let previewLink = (dict["previewLink"] as? String).flatMap(URL.init)
        let infoLink = (dict["infoLink"] as? String).flatMap(URL.init)
        let canonicalVolumeLink = (dict["canonicalVolumeLink"] as? String).flatMap(URL.init)
        let imageLinks = (dict["imageLinks"] as? [AnyHashable:Any]).flatMap(Volume.VolumeInfo.ImageLinks.create)
        return Volume.VolumeInfo(
            title: title,
            subtitle: subtitle,
            authors: authors ?? [],
            publisher: publisher,
            publishedDate: publishedDate,
            desc: desc,
            industryIdentifiers: industryIdentifers ?? [],
            pageCount: pageCount,
            dimensions: dimensions,
            printType: printType,
            mainCategory: mainCategory,
            categories: categories ?? [],
            averageRating: averageRating,
            ratingsCount: ratingCount,
            contentVersion: contentVersion,
            imageLinks: imageLinks,
            language: language,
            previewLink: previewLink,
            infoLink: infoLink,
            canonicalVolumeLink: canonicalVolumeLink
        )
    }
    
}

extension Volume.VolumeInfo.IndustryIdentifer {

    static func create(_ dict: [AnyHashable:Any]) -> Volume.VolumeInfo.IndustryIdentifer? {
        guard
            let type = dict["type"] as? String,
            let identifier = dict["identifier"] as? String
            else { return nil }
        return Volume.VolumeInfo.IndustryIdentifer(type: type, identifier: identifier)
    }
    
}

extension Volume.VolumeInfo.Dimensions {
    
    static func create(_ dict: [AnyHashable:Any]) -> Volume.VolumeInfo.Dimensions? {
        return Volume.VolumeInfo.Dimensions(
            height: dict["height"] as? String,
            width: dict["width"] as? String,
            thickness: dict["thickness"] as? String
        )
    }
    
}

extension Volume.VolumeInfo.ImageLinks {

    static func create(_ dict: [AnyHashable:Any]) -> Volume.VolumeInfo.ImageLinks? {
        return Volume.VolumeInfo.ImageLinks(
            smallThumbnail: (dict["smallThumbnail"] as? String).flatMap(URL.init),
            thumbnail: (dict["thumbnail"] as? String).flatMap(URL.init),
            small: (dict["small"] as? String).flatMap(URL.init),
            medium: (dict["medium"] as? String).flatMap(URL.init),
            large: (dict["large"] as? String).flatMap(URL.init),
            extraLarge: (dict["extraLarge"] as? String).flatMap(URL.init)
        )
    }

}

extension Volume.UserInfo {
    
    static func create(_ dict: [AnyHashable:Any]) -> Volume.UserInfo? {
        guard let updated = dict["update"] as? Date else {
            return nil
        }
        return Volume.UserInfo(
            isPurchased: dict["isPurchased"] as? Bool,
            isPreorderd: dict["isPreorderd"] as? Bool,
            updated: updated
        )
    }
    
}

extension Volume.SaleInfo {
    
    static func create(_ dict: [AnyHashable:Any]) -> Volume.SaleInfo? {
        let listPriceDict = dict["listPrice"] as? [AnyHashable:Any]
        let listPrice = listPriceDict.flatMap(Price.create)
        let retailPriceDict = dict["retailPrice"] as? [AnyHashable:Any]
        let retailPrice = retailPriceDict.flatMap(Price.create)
        let buyLinkString = dict["buyLink"] as? String
        let buyLink = buyLinkString.flatMap(URL.init)
        return Volume.SaleInfo(
            country: dict["country"] as? String,
            saleability: dict["saleability"] as? String,
            onSaleDate: dict["onSaleDate"] as? Date,
            isEbook: dict["isEbook"] as? Bool,
            listPrice: listPrice,
            retailPrice: retailPrice,
            buyLink: buyLink
        )
    }
    
}

extension Volume.SaleInfo.Price {
    
    static func create(_ dict: [AnyHashable:Any]) -> Volume.SaleInfo.Price? {
        guard
            let amount = dict["amount"] as? Double,
            let currencyCode = dict["currencyCode"] as? String
            else { return nil }
        return Volume.SaleInfo.Price(
            amount: amount,
            currencyCode: currencyCode
        )
    }
    
}

extension Volume.AccessInfo {
    
    static func create(_ dict: [AnyHashable:Any]) -> Volume.AccessInfo? {
        return Volume.AccessInfo(
            country: dict["country"] as? String,
            viewability: dict["viewability"] as? String,
            embeddable: dict["embeddable"] as? Bool,
            publicDomain: dict["publicDomain"] as? Bool,
            textToSpeechPermission: dict["textToSpeechPermission"] as? String,
            epub: nil,
            pdf: nil,
            webReaderLink: nil,
            accessViewStatus: dict["accessViewStatus"] as? String,
            downloadAccess: nil
        )
        
    }
    
}

extension Volume.SearchInfo {
    
    static func create(_ dict: [AnyHashable:Any]) -> Volume.SearchInfo? {
        return Volume.SearchInfo(textSnippet: dict["textSnippet"] as? String)
    }
    
}
