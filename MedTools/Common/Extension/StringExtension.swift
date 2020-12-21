//
//  StringExtension.swift
//  MedTools
//
//  Created by Ariel on 21/12/20.
//

extension String {
    /// Validate a string (Form validation)
    /// - Parameter validationType: Validation Type Case
    /// - Throws: Base error for validation type
    /// - Returns: String it self
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self)
    }
}
