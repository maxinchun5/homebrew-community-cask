cask "hp-prime" do
  version "2026-09-09"
  sha256 "8b4dfcee7ac564b7ce8fa989d69b6768f9238c4a3033237b7d8d664ab1fb604e"

  url "https://www.hpcalc.org/prime/pc//HP_Prime_Virtual_Calculator_#{version.hyphens_to_underscores}.dmg"
  name "HP Prime"
  desc "Graphing calculator emulator"
  homepage "https://www.hp.com/us-en/calculators.html"

  livecheck do
    url "https://www.hpcalc.org/details/7799"
    regex(/<title>.*?\((\d+(?:-\d+)+)\)/i)
  end

  depends_on :macos

  app "HP Prime.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  caveats do
    requires_rosetta
  end
end
