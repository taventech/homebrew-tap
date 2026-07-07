# Homebrew formula for the hedge CLI.
#
# Installs the self-contained standalone binary (no Node required). On each
# release, bump `version` and replace both sha256 values with the checksums of
# the new darwin binaries:
#   shasum -a 256 hedge-darwin-arm64 hedge-darwin-x64
class Hedge < Formula
  desc "Hedge broker portal from your terminal: submit risks, check appetite, track quotes"
  homepage "https://github.com/taventech/hedge-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taventech/hedge-cli/releases/download/v0.2.0/hedge-darwin-arm64"
      sha256 "ce9bd55e7c9575ad68dfa5a3cc23c59d1e66ca4ac908d55c3e648591980bd7a1"
    else
      url "https://github.com/taventech/hedge-cli/releases/download/v0.2.0/hedge-darwin-x64"
      sha256 "6e47d1ce26bc8b4e43759aea22870fce05ce61acb76880b566dc2d4d7f03bafd"
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
    assert_match "0.2.0", shell_output("#{bin}/hedge --version")
  end
end
