# Homebrew formula for vpn. Lives in the tap repo `vpncli/homebrew-tap`.
#
#   brew install vpncli/tap/vpn
#
# The sha256 placeholders are filled in automatically by the release workflow.
class Vpn < Formula
  desc "Manage every VPN from your terminal: xray proxy plus full-tunnel apps"
  homepage "https://github.com/vpncli/vpn"
  version "1.0.2"
  license "MIT"

  # xray is the actual proxy engine; vpn drives it.
  depends_on "xray"

  on_macos do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-arm64"
      sha256 "081ab2fe2723b4d27ac706f8ba5fb232e5c3838f161d30637a3dd6a1d1969e3c"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-x64"
      sha256 "5c220716b61bd5d35a8afe937f47655b5e53f24d5798e352cad8fdb5fba23977"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-arm64"
      sha256 "79212b7dd8bac5c7b9ed968e0fd5047e0eedec102eae38e7d6baadf3e0d4e677"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-x64"
      sha256 "9093c19f8465e674f7af765a41a1f081bb8a23b9c54042c3c0daa075614b759d"
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
