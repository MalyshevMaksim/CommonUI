import UIKit

open class LifecycleObservViewController: UIViewController {

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeNotifications()
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unsubscribeNotifications()
    }

    open func willEnterForeground() {}

    private func subscribeNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(willEnterForegroundSelector),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }

    private func unsubscribeNotifications() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }

    @objc private func willEnterForegroundSelector() {
        willEnterForeground()
    }
}
