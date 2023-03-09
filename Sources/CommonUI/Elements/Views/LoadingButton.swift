import UIKit
import Lottie

open class LoadingButton: ShimeringButton {

    private var originalButtonText: String?

    private let activityIndicator: LottieAnimationView = {
        let animation = LottieAnimationView(asset: "Assets.loader.name")
        animation.backgroundBehavior = .pauseAndRestore
        animation.loopMode = .loop
        return animation
    }()

    open func startLoadingAnimation() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        originalButtonText = self.titleLabel?.text
        UIView.animate(withDuration: 0.2, delay: 0) {
            self.setTitle("", for: .normal)
            self.isEnabled = false
        }
        showSpinning()
    }

    open func stopLoadingAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0) {
            self.setTitle(self.originalButtonText, for: .normal)
            self.isEnabled = true
        }
    }

    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        return activityIndicator
    }

    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.play()
    }

    private func centerActivityIndicatorInButton() {
        NSLayoutConstraint.activate([
            activityIndicator.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
