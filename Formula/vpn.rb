# Homebrew formula for vpn. Lives in the tap repo `vpncli/homebrew-tap`.
#
#   brew install vpncli/tap/vpn
#
# The sha256 placeholders are filled in automatically by the release workflow.
class Vpn < Formula
  desc "Intuitive xray VPN manager: server profiles, routing presets, pretty TUI"
  homepage "https://github.com/vpncli/vpn"
  version "0.1.0"
  license "MIT"

  # xray is the actual proxy engine; vpn drives it.
  depends_on "xray"

  on_macos do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-arm64"
      sha256 "118c9a5ab847549901168a16210202027e7d3d11776b8cdab35b3238943f95dd"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-x64"
      sha256 "cfc6bf6964dcab1221fc929dd1b0228697dea1feccb3e2e855ec6284bad57437"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-arm64"
      sha256 "10528219e627db84a7ff10fffb2386e8d8e7ddcf54c49ec6198059a1d6dbd26a"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-x64"
      sha256 "55f8875dbf6c149b3233889368edceb02396be56f03064455c8b5bf473b01d13"
    end
  end

  def install
    # The downloaded artifact keeps its release name (vpn-<os>-<arch>); install as `vpn`.
    binary = Dir["vpn-*"].first || "vpn"
    bin.install binary => "vpn"
  end

  test do
    assert_match "intuitive xray VPN manager", shell_output("#{bin}/vpn help")
  end
end
