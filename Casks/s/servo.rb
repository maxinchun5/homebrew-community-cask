cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-24"
  sha256 arm:   "aa35fbf9d43b9f00fd0c71c60d6f2a5c1c7581b493a287176b42d274ea421bad",
         intel: "63e0da83d5667aca0719db949728ce92da1828276648b284f7f44308720527d9"

  url "https://github.com/servo/servo-nightly-builds/releases/download/#{version}/servo-#{arch}-apple-darwin.dmg"
  name "Servo"
  desc "Parallel browser engine"
  homepage "https://servo.org/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:[.-]\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Servo.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: "~/Library/Application Support/Servo"
end
