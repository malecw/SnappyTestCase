Pod::Spec.new do |s|
    s.name              = "SnappyTestCase"
    s.version           = "0.1.0"
    s.summary           = "iOS Simulator type agnostic snapshot testing, built on top of the iOSSnapshotTestCase (previously named FBSnapshotTestCase)."
    s.description       = <<-DESC
        SnappyTestCase combines tests with a set of device definitions (each one including screen size, scale, and orientation) to validate with, ignoring real device simulator context information.
                   DESC
    s.homepage          = "https://github.com/tooploox/SnappyTestCase"
    s.license           = "Apache 2.0"
    s.author            = 'Tooploox'
    s.platform          = :ios, "9.0"
    s.source            = { :git => "https://github.com/tooploox/SnappyTestCase.git",
                            :tag => s.version.to_s }
    s.source_files      = 'Snappy/*.{swift}'
    s.frameworks        = 'XCTest', 'UIKit','Foundation'
    s.dependency "iOSSnapshotTestCase", "~> 5.0"
end
