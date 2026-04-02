# Tow - Lightweight deployment orchestrator
# Created by Murry Jeong (comchangs) — Supported by neurosam.AI
#
# Install: brew install neurosamAI/tap/tow

class Tow < Formula
  desc "Lightweight, agentless deployment orchestrator for bare-metal servers and VMs"
  homepage "https://tow-cli.neurosam.ai"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-darwin-arm64"
      sha256 "bf209a00839d0dff03568cac6e417a8d96c0e4a9cfe35a97c37d2e352ec0398f"

      def install
        bin.install "tow-darwin-arm64" => "tow"
      end
    else
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-darwin-amd64"
      sha256 "8a1a5d491285540a7945bd9594eb966433696d04b6e236911fd9f22ad3e1b86f"

      def install
        bin.install "tow-darwin-amd64" => "tow"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-linux-arm64"
      sha256 "08b49e39a387152028c3b3a10591a9d528f0449cfdca722ccd5fec26cc07526e"

      def install
        bin.install "tow-linux-arm64" => "tow"
      end
    else
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-linux-amd64"
      sha256 "2e6a80da16e264fd6b6bb9bba6f13669891f91e58f4241eb612aaaf7c97a69d8"

      def install
        bin.install "tow-linux-amd64" => "tow"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tow --version")
  end
end
