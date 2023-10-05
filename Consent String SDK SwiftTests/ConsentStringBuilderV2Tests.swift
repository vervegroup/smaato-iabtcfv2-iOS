
import Foundation

import XCTest
@testable import Consent_String_SDK_Swift

class ConsentStringBuilderV2Tests: XCTestCase, BinaryStringTestSupport {

    func testEncodingAndDecoding() throws {
        let now = createDate(year: 2023, month: 10, day: 5)
        let builder = ConsentStringBuilderV2(now: { now })
        let tcString = try builder.build(
            cmpId: 10,
            cmpVersion: 2,
            consentScreenId: 5,
            consentLanguage: "DE",
            vendorListVersion: 19,
            tcfPolicyVersion: 4,
            useNonStandardTexts: 0,
            specialFeatureOptIns: [1, 2],
            purposeConsents: [1, 2, 3, 4],
            purposeLegitimateInterests: [2, 3],
            purposeOneTreatment: 1,
            publisherCC: "EN",
            allowedVendorIds: [82, 512, 528, 333, 667],            
            legitimateInterestsForVendorIds: [528, 333]
        )

        let consentString = try ConsentStringV2(consentString: tcString)
        XCTAssertEqual(consentString.cmpId, 10)
        XCTAssertEqual(consentString.dateCreated, now)
        XCTAssertEqual(consentString.dateUpdated, now)
        XCTAssertEqual(consentString.consentScreen, 5)
        XCTAssertEqual(consentString.consentLanguage, "DE")
        XCTAssertEqual(consentString.vendorListVersion, 19)
        XCTAssertEqual(consentString.tfcPolicyVersion, 4)
        XCTAssertEqual(consentString.isServiceSpecific, 1)
        XCTAssertEqual(consentString.useNonStandardTexts, 0)
        XCTAssertEqual(consentString.specialFeatureOptIns, Set<FeatureIdentifier>([1, 2]))
        XCTAssertEqual(consentString.purposeConsents, Set<PurposeIdentifier>([1, 2, 3, 4]))
        XCTAssertEqual(consentString.purposeLegitimateInterests, Set<PurposeIdentifier>([2, 3]))
        XCTAssertEqual(consentString.purposeOneTreatment, 1)
        XCTAssertEqual(consentString.publisherCC, "EN")

        XCTAssertEqual(consentString.maxVendorIdForConsents, 667)

        XCTAssertEqual(consentString.isVendorAllowed(vendorId: 665), false)
        XCTAssertEqual(consentString.isVendorAllowed(vendorId: 666), false)
        XCTAssertEqual(consentString.isVendorAllowed(vendorId: 667), true)

        XCTAssertEqual(consentString.isVendorAllowed(vendorId: 81), false)
        XCTAssertEqual(consentString.isVendorAllowed(vendorId: 82), true)
        XCTAssertEqual(consentString.isVendorAllowed(vendorId: 83), false)

        XCTAssertEqual(consentString.maxVendorIdForLegitimateInterests, 528)

        XCTAssertEqual(consentString.isLegitimateInterestForVendorAllowed(vendorId: 527), false)
        XCTAssertEqual(consentString.isLegitimateInterestForVendorAllowed(vendorId: 528), true)
        XCTAssertEqual(consentString.isLegitimateInterestForVendorAllowed(vendorId: 529), false)

        XCTAssertEqual(consentString.isLegitimateInterestForVendorAllowed(vendorId: 332), false)
        XCTAssertEqual(consentString.isLegitimateInterestForVendorAllowed(vendorId: 333), true)
        XCTAssertEqual(consentString.isLegitimateInterestForVendorAllowed(vendorId: 334), false)
    }

    private func createDate(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(
            calendar: .current,
            timeZone: TimeZone(secondsFromGMT: 0)!,
            year: year,
            month: month,
            day: day
        )
        return components.date!
    }
}

