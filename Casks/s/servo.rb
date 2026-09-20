cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-19"
  sha256 arm:   "64f486bcd0c9c9095884ad84dc34e1764a241846fa0b3cad2ce337f22367dd37",
         intel: "ddd8176ba9e13a776db85f5ea2d9ee9f4f6928bddb7fb095e8d0316e3a7d5477"

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
