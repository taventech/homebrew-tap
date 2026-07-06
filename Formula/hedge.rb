# Homebrew formula for the hedge CLI.
#
# Installs the self-contained standalone binary (no Node required). On each
# release, bump `version` and replace both sha256 values with the checksums of
# the new darwin binaries:
#   shasum -a 256 hedge-darwin-arm64 hedge-darwin-x64
class Hedge < Formula
  desc "Hedge broker portal from your terminal: submit risks, check appetite, track quotes"
  homepage "https://github.com/taventech/hedge-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taventech/hedge-cli/releases/download/v0.1.0/hedge-darwin-arm64"
      sha256 "1be322557e92b8b2198192ec21e896e13bb7652572738453db924cf9b8475faa"
    else
      url "https://github.com/taventech/hedge-cli/releases/download/v0.1.0/hedge-darwin-x64"
      sha256 "092851fcccffe6674579cadb835bdc5b71aac6ca9ac29e184c29daa83e550220"
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
    assert_match "0.1.0", shell_output("#{bin}/hedge --version")
  end
end
