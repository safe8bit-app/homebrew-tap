cask "safe8bit" do
  version "0.1.4"
  sha256 "d9ff492c870aaade6e91f1c88bbb10c835dd19655c281742fe8c1d255ee71501"

  url "https://github.com/safe8bit-app/homebrew-tap/releases/download/v#{version}/Safe8bit-#{version}.zip"
  name "Safe8bit"
  desc "Secrets vault for developers, with CLI, git guard and AI agent shield"
  homepage "https://safe8bit.com/"

  depends_on macos: :sequoia

  app "Safe8bit.app"
  binary "#{appdir}/Safe8bit.app/Contents/Helpers/safe8bit"
  binary "#{appdir}/Safe8bit.app/Contents/Helpers/safe8bit", target: "safebit"

  # No zap stanza on purpose: the app's data is the encrypted vault, and uninstalling must never
  # delete it.
end
