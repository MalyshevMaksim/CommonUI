import UIKit

public extension UILabel {

    func highlight(_ string: String?, color: UIColor) {
        guard let text = text, let attributed = attributedText, !text.isEmpty, let highlitedString = string else {
            return
        }
        let attributedText = NSMutableAttributedString(attributedString: attributed)
        let regularExpression = try? NSRegularExpression(
            pattern: highlitedString.trimmingCharacters(in: .whitespacesAndNewlines)
                .folding(options: .diacriticInsensitive, locale: .autoupdatingCurrent),
            options: .caseInsensitive
        )
        let matches = regularExpression?.matches(in: text, range: NSRange(location: 0, length: text.count)).first
        attributedText.addAttribute(.foregroundColor, value: color, range: matches?.range ?? .init())
        self.attributedText = attributedText
    }
}
