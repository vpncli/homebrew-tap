# Homebrew formula for vpn. Lives in the tap repo `vpncli/homebrew-tap`.
#
#   brew install vpncli/tap/vpn
#
# The sha256 placeholders are filled in automatically by the release workflow.
class Vpn < Formula
  desc "Manage every VPN from your terminal: xray proxy plus full-tunnel apps"
  homepage "https://github.com/vpncli/vpn"
  version "1.0.4"
  license "MIT"

  # xray is the actual proxy engine; vpn drives it.
  depends_on "xray"

  on_macos do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-arm64"
      sha256 "b5b754dc06737fff45daadba7faadf14815f837f83dcb10282df6df9e4582ba6"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-x64"
      sha256 "a70c92cd457ffa3c60eeed51333c110cdd64130d111538658a66d32d773f06e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-arm64"
      sha256 "44f9402f802432f119f7acef5aeabfd0645dd2bfc1dab741603f9e5993194804"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-x64"
      sha256 "f76874bd667bb481f4badee7bf4ca8d92dc58bf7dbc12802eb8338c76fcabda8"
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
