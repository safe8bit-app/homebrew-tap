cask "safe8bit" do
  version "0.1.0"
  sha256 "5c098a5536deca57dec9d66b2b5d551e887859826f5654335d1d5574655fe383"

  url "https://github.com/chingling123/homebrew-tap/releases/download/v#{version}/Safe8bit-#{version}.zip"
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
