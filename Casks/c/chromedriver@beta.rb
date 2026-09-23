cask "chromedriver@beta" do
  arch arm: "arm64", intel: "x64"

  version "155.0.8059.12"
  sha256 arm:   "775ff37f835ca2fd4ca9287135e8c104060ce49a9267e60b6ecd613debdaebe2",
         intel: "5f9f6a1440149f795a743655a940f677125c2ab16f19fd2bbb9e6499161a29d1"

  url "https://storage.googleapis.com/chrome-for-testing-public/#{version}/mac-#{arch}/chromedriver-mac-#{arch}.zip"
  name "ChromeDriver"
  desc "Automated testing of webapps for Google Chrome"
  homepage "https://chromedriver.chromium.org/"

  livecheck do
    url "https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json"
    strategy :json do |json|
      json.dig("channels", "Beta", "version")
    end
  end

  conflicts_with cask: "chromedriver"
  depends_on :macos

  binary "chromedriver-mac-#{arch}/chromedriver"

  # No zap stanza required

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end
end
