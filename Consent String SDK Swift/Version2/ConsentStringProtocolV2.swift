
import Foundation

public typealias PurposeIdentifier = Int16
public typealias FeatureIdentifier = Int16

@objc public protocol ConsentStringV2Protocol {

   @objc init(consentString: String) throws

   @objc var dateCreated: Date { get }
    @objc var dateUpdated: Date { get }

    @objc  var consentString: String { get }
    @objc  var cmpId: Int { get }
    @objc var consentScreen: Int { get }
    @objc var consentLanguage: String { get }

    @objc var publisherCC: String { get }
    @objc var vendorListVersion: Int8 { get }

    @objc var tfcPolicyVersion: Int8 { get }
    @objc var isServiceSpecific: Int8 { get }
    @objc var useNonStandardTexts: Int8 { get }
    @objc var purposeOneTreatment: Int8 { get }

    @objc var specialFeatureOptIns: Set<FeatureIdentifier> { get }

    @objc var purposeConsents: Set<PurposeIdentifier> { get }
    @objc func purposeConsent(forPurposeId purposeId: PurposeIdentifier) -> Bool

    @objc var purposeLegitimateInterests: Set<PurposeIdentifier> { get }
    @objc func purposeLegitimateInterest(forPurposeId purposeId: PurposeIdentifier) -> Bool

    @objc var maxVendorIdForConsents: VendorIdentifier { get }
    @objc func isVendorAllowed(vendorId: VendorIdentifier) -> Bool

    @objc var maxVendorIdForLegitimateInterests: VendorIdentifier { get }
    @objc func isLegitimateInterestForVendorAllowed(vendorId: VendorIdentifier) -> Bool
}
