import UIKit

@available(iOS 13.0, *)
open class ContinueButton: LoadingButton {

    open var enableColor: UIColor = .systemBlue
    open var disableColor: UIColor = .systemGray5

    open override var isEnabled: Bool {
        didSet { backgroundColor = isEnabled ? enableColor : disableColor }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(.white, for: .normal)
        setTitleColor(.systemGray, for: .disabled)
        layer.cornerRadius = 12
        isEnabled = true
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
