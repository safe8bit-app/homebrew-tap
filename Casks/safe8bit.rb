cask "safe8bit" do
  version "0.1.1"
  sha256 "9cebd11c1570198453b4418208c0cb4ee672c785dd84b58fa95e5503aee036f8"

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
