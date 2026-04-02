# Tow - Lightweight deployment orchestrator
# Created by Murry Jeong (comchangs) — Supported by neurosam.AI
#
# Install: brew install neurosamAI/tap/tow

class Tow < Formula
  desc "Lightweight, agentless deployment orchestrator for bare-metal servers and VMs"
  homepage "https://tow-cli.neurosam.ai"
  license "MIT"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-darwin-arm64"
      sha256 "bb03d09c09d63bd5c81d766d438f753ab8dd3a8a78823053339559ab0682df2b"

      def install
        bin.install "tow-darwin-arm64" => "tow"
      end
    else
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-darwin-amd64"
      sha256 "17ee4cd57adc6cd27c52f22b4ff67a3696ae74c142ba65699f7b1742151d36ab"

      def install
        bin.install "tow-darwin-amd64" => "tow"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-linux-arm64"
      sha256 "8747b30155bd32bdb0071b3c8335925fe2328f9d5422800e2103ffc85d202690"

      def install
        bin.install "tow-linux-arm64" => "tow"
      end
    else
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-linux-amd64"
      sha256 "242b660d0538a3f241fbec61134e4642082e559679082b3a40f95e394adb5a39"

      def install
        bin.install "tow-linux-amd64" => "tow"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tow --version")
  end
end
