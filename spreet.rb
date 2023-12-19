class Spreet < Formula
  desc "Create a spritesheet from a set of SVG images"
  homepage "https://github.com/flother/spreet"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-apple-darwin.tar.gz"
      sha256 "2ea6a1e38e90ad52f26b5fca5df1cea1c243b7b8539a3a40c65ce52269477aa5"
    elsif Hardware::CPU.arm?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-aarch64-apple-darwin.tar.gz"
      sha256 "0b522e474bb49adf331ac43fee95f30e088ce83af4e85e8adad02082e3771940"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3308fb7df8f0c700a9d4e91f7190f1842f8102fc27c6e1fafa60dbd48762a324"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-arm-unknown-linux-gnueabihf.tar.gz"
      sha256 "64e9fcb8fc10f1231039c4ac455f93abc9d82a84b71cab965cbcfca0ae95dcb7"
    end
  end

  def install
    bin.install "spreet"
  end

  test do
    system "#{bin}/spreet", "--version"
  end
end
