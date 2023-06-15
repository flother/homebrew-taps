class Spreet < Formula
  desc "Create a spritesheet from a set of SVG images"
  homepage "https://github.com/flother/spreet"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-apple-darwin.tar.gz"
      sha256 "7ef10b3351ed89f18a0db704cee20b8b89ee804f5799b72744fd47dd385d2aca"
    elsif Hardware::CPU.arm?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-aarch64-apple-darwin.tar.gz"
      sha256 "0686825f77986440c85c170d51be512796d8af2f0c1d0629727745d8bd604646"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e1891c7e2c5f333027510ff2598eb99721dd3833b3c2c82ceb98eb00af5cb04b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-arm-unknown-linux-gnueabihf.tar.gz"
      sha256 "51dcf3b89053113e6ad34bd513997d22416f4a140cb336d035b8d915abcacc4c"
    end
  end

  def install
    bin.install "spreet"
  end

  test do
    system "#{bin}/spreet", "--version"
  end
end
