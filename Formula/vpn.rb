# Homebrew formula for vpn. Lives in the tap repo `vpncli/homebrew-tap`.
#
#   brew install vpncli/tap/vpn
#
# The sha256 placeholders are filled in automatically by the release workflow.
class Vpn < Formula
  desc "Manage every VPN from your terminal: xray proxy plus full-tunnel apps"
  homepage "https://github.com/vpncli/vpn"
  version "1.0.5"
  license "MIT"

  # xray is the actual proxy engine; vpn drives it.
  depends_on "xray"

  on_macos do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-arm64"
      sha256 "7919de1e7c70121848a8c0550e8a1c3453f2073c82853ddd47f8f02fa0808db5"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-darwin-x64"
      sha256 "3bbd5a5be0aa04ad6ce19917d881fed0ab87e8edb24c9f53a785ae2146f1da8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-arm64"
      sha256 "a8eafe29508e18303e7b30e219c4f9e1fb3b21f552ce8cead52b8c0738325248"
    end
    on_intel do
      url "https://github.com/vpncli/vpn/releases/download/v#{version}/vpn-linux-x64"
      sha256 "873a1e53d2bcf1246c61b9d7094813f2c7f8f602af0cf7aa4d8d5089c3649b52"
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
