# Tow - Lightweight deployment orchestrator
# Created by Murry Jeong (comchangs) — Supported by neurosam.AI
#
# Install: brew install neurosamAI/tap/tow

class Tow < Formula
  desc "Lightweight, agentless deployment orchestrator for bare-metal servers and VMs"
  homepage "https://tow-cli.neurosam.ai"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-darwin-arm64"
      sha256 "5704ff8e085efe972ea8a3da8df9201c3c7d2d77b5a390970ea8c973f78fa8eb"

      def install
        bin.install "tow-darwin-arm64" => "tow"
      end
    else
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-darwin-amd64"
      sha256 "fcf2793fb7bd01402430d62b926d2956f8dbc2be20703a62bb2223db01a06f40"

      def install
        bin.install "tow-darwin-amd64" => "tow"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-linux-arm64"
      sha256 "d9dd37347b72e1efcda9505e9a60f456830ec314faf84ce7d3ce9189ce508339"

      def install
        bin.install "tow-linux-arm64" => "tow"
      end
    else
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-linux-amd64"
      sha256 "7933a817e1fe64b9890fac40e179ca96045aad7192cc9ce24dca6c72cae0dcd5"

      def install
        bin.install "tow-linux-amd64" => "tow"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tow --version")
  end
end
