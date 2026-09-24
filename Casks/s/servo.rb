cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-23"
  sha256 arm:   "181beac0b02babc8b674a76ff05ecaf6b6a94a1fe7e73a2ebe2c0ec6c91507ee",
         intel: "49d90ee93b07a1fd465198f230caf9e3644612120362fff5b1e34402aa8bdcd9"

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
