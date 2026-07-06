# Homebrew formula for the bindly CLI.
#
# Installs the self-contained standalone binary (no Node required). On each
# release, bump `version` and replace both sha256 values with the checksums of
# the new darwin binaries:
#   shasum -a 256 bindly-darwin-arm64 bindly-darwin-x64
class Bindly < Formula
  desc "Start Bindly intake sessions and submit to Hedge from your terminal"
  homepage "https://github.com/taventech/bindly-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taventech/bindly-cli/releases/download/v0.1.0/bindly-darwin-arm64"
      sha256 "1025a7815006246abad3685d8371cba3f4137fe28f90eea83fba34972615f823"
    else
      url "https://github.com/taventech/bindly-cli/releases/download/v0.1.0/bindly-darwin-x64"
      sha256 "11faf567fff45bdf5608f29e97d9b2393f18553da50f1b14a01f23a0ae8b3e1c"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "bindly-darwin-arm64" => "bindly"
    else
      bin.install "bindly-darwin-x64" => "bindly"
    end
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/bindly --version")
  end
end
