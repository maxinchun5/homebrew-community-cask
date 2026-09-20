cask "chromedriver" do
  arch arm: "arm64", intel: "x64"

  version "153.0.8010.52"
  sha256 arm:   "23dc682b73c6473562b4b0d6ddd5b8a0823dbeeccd32a901d085df5f8d87b5cd",
         intel: "10af2210d1e69b4517b2b87535d3ee37dac21ca274487e6c0ff66134492f2786"

  url "https://storage.googleapis.com/chrome-for-testing-public/#{version}/mac-#{arch}/chromedriver-mac-#{arch}.zip"
  name "ChromeDriver"
  desc "Automated testing of webapps for Google Chrome"
  homepage "https://chromedriver.chromium.org/"

  livecheck do
    url "https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json"
    strategy :json do |json|
      json.dig("channels", "Stable", "version")
    end
  end

  conflicts_with cask: "chromedriver@beta"
  depends_on :macos

  binary "chromedriver-mac-#{arch}/chromedriver"

  # No zap stanza required

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end
end
