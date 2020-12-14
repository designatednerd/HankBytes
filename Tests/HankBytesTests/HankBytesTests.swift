import XCTest
@testable import HankBytes

final class HankBytesTests: XCTestCase {
    func testFilesNotInAssetCatalogHavePhotoURL() {
        for byte in HankByte.allBytes {
            if byte.inAssetCatalog {
                XCTAssertNil(byte.photoURL, byte.fileName)
            } else {
                XCTAssertNotNil(byte.photoURL, byte.fileName)
            }
        }
    }
        
    func testAllFilesCanLoadImage() {
        for byte in HankByte.allBytes {
            XCTAssertNotNil(byte.image)
        }
    }
    
    func testAllBytesLoadCaptions() {
        for byte in HankByte.allBytes {
            XCTAssertNotEqual(byte.captionKey, byte.caption)
        }
    }
}
