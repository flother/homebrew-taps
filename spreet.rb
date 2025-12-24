class Spreet < Formula
  desc "Create a spritesheet from a set of SVG images"
  homepage "https://github.com/flother/spreet"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-apple-darwin.tar.gz"
      sha256 "02ec53d37d311e302dfe3cdd96a6b7213b57f6d2428f0ff059e786f96a8d0acf"
    elsif Hardware::CPU.arm?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-aarch64-apple-darwin.tar.gz"
      sha256 "59c369168fce28b4314026b63561a99970cd8b756afdd92d8b55a1cc61138be3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0119329214870da10b256f1eae314b9346a7d0a404e3350df902d76796117e64"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-arm-unknown-linux-gnueabihf.tar.gz"
      sha256 "8447922aae11d8ebe6283d7ba5b0079107f150d75e7e0d8832ca438dd7d35c2b"
    end
  end

  def install
    bin.install "spreet"
  end

  test do
    system "#{bin}/spreet", "--version"
  end
end
