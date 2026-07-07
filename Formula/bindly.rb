# Homebrew formula for the bindly CLI.
#
# Installs the self-contained standalone binary (no Node required). On each
# release, bump `version` and replace both sha256 values with the checksums of
# the new darwin binaries:
#   shasum -a 256 bindly-darwin-arm64 bindly-darwin-x64
class Bindly < Formula
  desc "Start Bindly intake sessions and submit to Hedge from your terminal"
  homepage "https://github.com/taventech/bindly-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/taventech/bindly-cli/releases/download/v0.2.0/bindly-darwin-arm64"
      sha256 "e1026d87cd875e3754c1080eb5fd184c1023c26727ae24c5e50dc8d7760ed0cb"
    else
      url "https://github.com/taventech/bindly-cli/releases/download/v0.2.0/bindly-darwin-x64"
      sha256 "37513fc9d02fab590a9bc42e7352a0c8dc5f7a3694e57cb433aec49bdc82d6d2"
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
    assert_match "0.2.0", shell_output("#{bin}/bindly --version")
  end
end
