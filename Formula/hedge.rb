# Homebrew formula for the hedge CLI.
#
# Installs the self-contained standalone binary (no Node required). On each
# release, bump `version` and replace both sha256 values with the checksums of
# the new darwin binaries:
#   shasum -a 256 hedge-darwin-arm64 hedge-darwin-x64
class Hedge < Formula
  desc "Quote Hedge Instant Quote markets from your terminal: appetite, quotes, bind link"
  homepage "https://github.com/taventech/hedge-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taventech/hedge-cli/releases/download/v0.5.0/hedge-darwin-arm64"
      sha256 "fe47c0e93d3e06e34c8988299857d9875a510cab2790e331b8339e9cfc8bb932"
    else
      url "https://github.com/taventech/hedge-cli/releases/download/v0.5.0/hedge-darwin-x64"
      sha256 "ca2a266ce6a52e722e0442592f1d09cacda5df0ca9b7edc083267b31e9cb8865"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "hedge-darwin-arm64" => "hedge"
    else
      bin.install "hedge-darwin-x64" => "hedge"
    end
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/hedge --version")
  end
end
