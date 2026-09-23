cask "salesforce-cli" do
  arch arm: "arm64", intel: "x64"

  version "2.151.7,3910271"
  sha256 arm:   "5b10b490ac81818656eb46951bb1b090f5db85ea51f7f640f15af18c9ef50f93",
         intel: "9794f23c5e2e3abe9d313e15bc3b9f9127f5b68aca11d80e8e773ce8a335b95c"

  url "https://github.com/salesforcecli/cli/releases/download/#{version.csv.first}/sf-v#{version.csv.first}-#{version.csv.second}-#{arch}.pkg"
  name "Salesforce CLI"
  desc "CLI tools for Salesforce"
  homepage "https://developer.salesforce.com/tools/salesforcecli"

  livecheck do
    url "https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-darwin-#{arch}-buildmanifest",
        user_agent: :browser
    strategy :json do |json|
      next if json["version"].blank? || json["sha"].blank?

      "#{json["version"]},#{json["sha"]}"
    end
  end

  depends_on :macos

  pkg "sf-v#{version.csv.first}-#{version.csv.second}-#{arch}.pkg"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  uninstall pkgutil: "com.salesforce.cli",
            delete:  [
              "/usr/local/bin/sf",
              "/usr/local/bin/sfdx",
            ]

  zap trash: [
    "~/.cache/sf",
    "~/.config/sf",
    "~/.local/share/sf",
    "~/.sf",
  ]
end
