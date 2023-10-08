class Spreet < Formula
  desc "Create a spritesheet from a set of SVG images"
  homepage "https://github.com/flother/spreet"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-apple-darwin.tar.gz"
      sha256 "bb29424fcaee5d6bec622997a2b7df8223f0349db36023c429f2284d09494404"
    elsif Hardware::CPU.arm?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-aarch64-apple-darwin.tar.gz"
      sha256 "ff4e412f648621e04a049d517fe2ec800f800c45113ba8e4c5467a07f5d674b0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8a062133c0e49d69dd700c54cc21682f0a6058b22e7168de4e2a656b8f7618f6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/flother/spreet/releases/download/v#{version}/spreet-arm-unknown-linux-gnueabihf.tar.gz"
      sha256 "5af5c9a038e595711040b1fcfb1abf76e4f989485d29c27ab188fe923fda23b6"
    end
  end

  def install
    bin.install "spreet"
  end

  test do
    system "#{bin}/spreet", "--version"
  end
end
