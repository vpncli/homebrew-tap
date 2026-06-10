# Homebrew formula for vpn. Lives in the tap repo `vpncli/homebrew-tap`.
#
#   brew install vpncli/tap/vpn
#
# The sha256 placeholders are filled in automatically by the release workflow.
class Vpn < Formula
  desc "Manage every VPN from your terminal: xray proxy plus full-tunnel apps"
  homepage "https://github.com/vpncli/vpn"
  version "1.0.3"
  license "MIT"

  # xray is the actual proxy engine; vpn drives it.
  depends_on "xray"

  on_macos do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-arm64"
      sha256 "d58c4b62d7ce0bbbfe34aa3d338c596f63e601cbdbd99f60d6d0e70fed38056f"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-x64"
      sha256 "420c377ba7e725765654a3e278740467041805823f77a0029d25ca4d7b4f8889"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-arm64"
      sha256 "4a9cad0937f1a228b210406007ea2609ef990a11dd9d421e2118213a50a6de6a"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-x64"
      sha256 "154af0be6458691474434112bfbf8fd64029ce40fe65b9b395d70adb90120515"
    end
  end

  def install
    # The downloaded artifact keeps its release name (vpn-<os>-<arch>); install as `vpn`.
    binary = Dir["vpn-*"].first || "vpn"
    bin.install binary => "vpn"
  end

  test do
    assert_match "manage every VPN from your terminal", shell_output("#{bin}/vpn help")
  end
end
