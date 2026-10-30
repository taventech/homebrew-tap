# Homebrew formula for the hedge CLI.
#
# Installs the self-contained standalone binary (no Node required). On each
# release, bump `version` and replace both sha256 values with the checksums of
# the new darwin binaries:
#   shasum -a 256 hedge-darwin-arm64 hedge-darwin-x64
class Hedge < Formula
  desc "Quote Hedge Instant Quote markets from your terminal: appetite, quotes, bind link"
  homepage "https://github.com/taventech/hedge-cli"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taventech/hedge-cli/releases/download/v0.5.1/hedge-darwin-arm64"
      sha256 "189c02fb292bab1a0d16f1d6f5af44082a18288b50099d836f9b3ac9e8bafb18"
    else
      url "https://github.com/taventech/hedge-cli/releases/download/v0.5.1/hedge-darwin-x64"
      sha256 "5547e6fa991405aa87a01eaa41d9ca21f8e65ea9a411e12735058bfca900734a"
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
    assert_match "0.5.1", shell_output("#{bin}/hedge --version")
  end
end
