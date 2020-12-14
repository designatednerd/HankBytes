import UIKit

public struct HankByte {
    public let fileName: String
    public let fileExtension: String
    public let captionKey: String
    public let inAssetCatalog: Bool
    
    public static let earbud = HankByte(fileName: "earbud",
                                        fileExtension: "jpeg",
                                        captionKey: "photo_caption_earbud",
                                        inAssetCatalog: true)
    
    public static let metalTube = HankByte(fileName: "metal_tube",
                                           fileExtension: "heic",
                                           captionKey: "photo_caption_metal_tube",
                                           inAssetCatalog: true)
    
    public static let onion = HankByte(fileName: "onion",
                                       fileExtension: "jpeg",
                                       captionKey: "photo_caption_onion",
                                       inAssetCatalog: false)
    
    public static let potato = HankByte(fileName: "potato",
                                        fileExtension: "heic",
                                        captionKey: "photo_caption_potato",
                                        inAssetCatalog: false)
    
    public var photoURL: URL? {
        Bundle.module.url(forResource: self.fileName,
                          withExtension: self.fileExtension)
    }
    
    public var image: UIImage? {
        if let image = UIImage(named: self.fileName, in: .module, compatibleWith: nil) {
            return image
        } else {
        
            guard let path = self.photoURL?.path else {
                return nil
            }
            
            return UIImage(contentsOfFile: path)
        }
    }
    
    public var caption: String {
        NSLocalizedString(self.captionKey,
                          bundle: .module,
                          comment: "")
    }
 
    public static let allBytes: [HankByte] = [
        .earbud,
        .onion,
        .potato,
        .metalTube,
    ]
}
