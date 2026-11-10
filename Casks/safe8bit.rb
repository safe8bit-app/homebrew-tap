cask "safe8bit" do
  version "0.1.13"
  sha256 "25c5b4f6aca0ee14aaf7152ea7dc7f8001e1bc53d2fd3021b4d075702ca028c2"

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
  # Plain `postflight` on purpose: Homebrew 7 calls it deprecated, but `postflight_steps` runs in
  # a sandbox where neither `open` nor the app itself can register the agent with launchd.
  postflight do
    system_command "/usr/bin/open",
                   args: ["-g", "-j", "-a", "#{appdir}/Safe8bit.app", "--args", "--refresh-ssh-agent"]
  end

  # No zap stanza on purpose: the app's data is the encrypted vault, and uninstalling must never
  # delete it.
end
