# Homebrew formula for the hedge CLI.
#
# Installs the self-contained standalone binary (no Node required). On each
# release, bump `version` and replace both sha256 values with the checksums of
# the new darwin binaries:
#   shasum -a 256 hedge-darwin-arm64 hedge-darwin-x64
class Hedge < Formula
  desc "Hedge broker portal from your terminal: submit risks, check appetite, track quotes"
  homepage "https://github.com/taventech/hedge-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taventech/hedge-cli/releases/download/v0.4.0/hedge-darwin-arm64"
      sha256 "37f234396f343bbb0f87e9b64b71aef725a06fefc43cdd08ec9aeaf412b4a0ab"
    else
      url "https://github.com/taventech/hedge-cli/releases/download/v0.4.0/hedge-darwin-x64"
      sha256 "00f793989a197da6bfb752ac10d57f411d4e7f4a0daa3b9f04ee2c3a335b08c2"
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
    assert_match "0.4.0", shell_output("#{bin}/hedge --version")
  end
end
