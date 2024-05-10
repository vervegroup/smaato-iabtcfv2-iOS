
import Foundation

public protocol ConsentStringBuildingV2 {
    func build(
        created: Date,
        updated: Date,
        cmpId: Int,
        cmpVersion: Int,
        consentScreenId: Int,
        consentLanguage: String,
        vendorListVersion: Int16,
        tcfPolicyVersion: Int16,
        isServiceSpecific: Int16,
        useNonStandardTexts: Int16,
        specialFeatureOptIns: Set<FeatureIdentifier>,
        purposeConsents: Set<PurposeIdentifier>,
        purposeLegitimateInterests: Set<PurposeIdentifier>,
        purposeOneTreatment: Int16,
        publisherCC: String,
        maxVendorIdForConsents: VendorIdentifier,
        allowedVendorIds: Set<VendorIdentifier>,
        maxVendorIdForLegitimateInterests: VendorIdentifier,
        legitimateInterestsForVendorIds: Set<VendorIdentifier>
    ) throws -> String

    /// Helper build method that set default values for some fields
    ///
    /// The following fields will have default values
    /// - **created**, **updates** will be set to current date
    /// - **maxVendorIdForConsents** and **maxVendorIdForLegitimateInterests** will be derived from **allowedVendorIds** and **legitimateInterestsForVendorIds** respectively
    func build(
        cmpId: Int,
        cmpVersion: Int,
        consentScreenId: Int,
        consentLanguage: String,
        vendorListVersion: Int16,
        tcfPolicyVersion: Int16,
        useNonStandardTexts: Int16,
        specialFeatureOptIns: Set<FeatureIdentifier>,
        purposeConsents: Set<PurposeIdentifier>,
        purposeLegitimateInterests: Set<PurposeIdentifier>,
        purposeOneTreatment: Int16,
        publisherCC: String,
        allowedVendorIds: Set<VendorIdentifier>,
        legitimateInterestsForVendorIds: Set<VendorIdentifier>
    ) throws -> String
}

