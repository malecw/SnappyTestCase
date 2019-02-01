//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import FBSnapshotTestCase

extension FBSnapshotTestCase {
    
    struct SnapVerifyError {
        
        let message: String
        var snaps: [Snap]
        
        var description: String {
            return "\(message) (\(snaps.map { $0.identifier }.joined(separator: ", ")))"
        }
    }

    typealias DeviceSettings = (scale: CGFloat, orientation: Int)

    private func readDeviceSettings() -> DeviceSettings {
        return (scale: UIScreen.main.scale,
                orientation: UIDevice.current.orientation.rawValue)
    }

    private func restoreDeviceSettings(_ settings: DeviceSettings) {
        UIScreen.main.setValue(settings.scale, forKeyPath:"scale")
        UIDevice.current.setValue(settings.orientation, forKeyPath:"orientation")
    }
    
    public func verifyViewSnaps<T: UIView>(_ snaps: [Snap],
                                           view: T,
                                           container: UIView? = nil,
                                           tolerance: CGFloat = 0.0,
                                           file: StaticString = #file,
                                           line: UInt = #line,
                                           beforeSnapshot: ((T, Snap) -> Void)? = nil,
                                           performOrientationChange: Bool = true,
                                           defaultReferenceDirectory: String = "",
                                           defaultImageDiffDirectory: String = "") {
        let settings = readDeviceSettings()
        defer {
            restoreDeviceSettings(settings)
        }

        let frameView = container == nil ? view : container!
        var errors = [SnapVerifyError]()
        for snap in snaps {
            UIScreen.main.setValue(snap.scale, forKeyPath:"scale")
            if performOrientationChange {
                UIDevice.current.setValue(snap.deviceOrientation.rawValue, forKeyPath:"orientation")
            }
            
            frameView.frame.size = snap.frameSize
            frameView.layoutIfNeeded()
            
            beforeSnapshot?(view, snap)
            
            if var msg = snapshotVerifyViewOrLayer(
                view,
                identifier: snap.identifier,
                suffixes: FBSnapshotTestCaseDefaultSuffixes(),
                tolerance: tolerance,
                defaultReferenceDirectory: defaultReferenceDirectory,
                defaultImageDiffDirectory: defaultImageDiffDirectory
            ) {
                if recordMode {
                    msg = "Test ran in record mode. Reference image is now saved. Disable record mode to perform an actual snapshot comparison!"
                }
                if let existingIndex = errors.index(where: { $0.message == msg }) {
                    errors[existingIndex].snaps.append(snap)
                } else {
                    errors.append(SnapVerifyError(message: msg, snaps: [snap]))
                }
            }
        }
        if !errors.isEmpty {
            XCTFail(combinedPartialMessages(errors), file: file, line: line)
        }
    }
    
    func combinedPartialMessages(_ errors: [SnapVerifyError]) -> String {
        return errors.map { $0.description }.joined(separator: "; ")
    }
    
}
