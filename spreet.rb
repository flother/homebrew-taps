class Spreet < Formula
  desc "Create a spritesheet from a set of SVG images"
  homepage "https://github.com/flother/spreet"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-apple-darwin.tar.gz"
      sha256 "f1feacdefd9bbfb082ec945e1c83680330b7d9c0b06e9119f152652f162e4089"
    elsif Hardware::CPU.arm?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-aarch64-apple-darwin.tar.gz"
      sha256 "bf312a8203057fc1c010a7d77e0e666810dafbd01132ef8eeec3692d527debc3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6fc9800064949bd034975229ba7b75d2584ec7a3d471906b7daa1f8039b476d1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-arm-unknown-linux-gnueabihf.tar.gz"
      sha256 "1ef8620e6b7795be80bd728eb5cb7bbdf37a81f032b5c894cf76c8f3abf8b6f7"
    end
  end

  def install
    bin.install "spreet"
  end

  test do
    system "#{bin}/spreet", "--version"
  end
end
