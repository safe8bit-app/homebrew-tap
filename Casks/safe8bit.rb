cask "safe8bit" do
  version "0.1.5"
  sha256 "e461083c37589c1ba9e1812de9fd8bc18eee8bdb5267c6f4a5dfa36bcf1c7e7a"

  url "https://github.com/safe8bit-app/homebrew-tap/releases/download/v#{version}/Safe8bit-#{version}.zip"
  name "Safe8bit"
  desc "Secrets vault for developers, with CLI, git guard and AI agent shield"
  homepage "https://safe8bit.com/"

  depends_on macos: :sequoia

  app "Safe8bit.app"
  binary "#{appdir}/Safe8bit.app/Contents/Helpers/safe8bit"
  binary "#{appdir}/Safe8bit.app/Contents/Helpers/safe8bit", target: "safebit"

  # A new version's SSH agent helper only starts once the app registers it again. Run the app
  # once in the background to do that: it shows no window and quits by itself (0.1.5 or later).
  postflight do
    system_command "/usr/bin/open",
                   args: ["-g", "-j", "-a", "#{appdir}/Safe8bit.app", "--args", "--refresh-ssh-agent"]
  end

  # No zap stanza on purpose: the app's data is the encrypted vault, and uninstalling must never
  # delete it.
end
