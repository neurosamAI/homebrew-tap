# Tow - Lightweight deployment orchestrator
# Created by Murry Jeong (comchangs) — Supported by neurosam.AI
#
# Install: brew install neurosamAI/tap/tow

class Tow < Formula
  desc "Lightweight, agentless deployment orchestrator for bare-metal servers and VMs"
  homepage "https://tow-cli.neurosam.ai"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-darwin-arm64"
      sha256 "245a54c11771dcd9f4153c0b0695951acc471a2028469780a511e1b7663a26dd"

      def install
        bin.install "tow-darwin-arm64" => "tow"
      end
    else
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-darwin-amd64"
      sha256 "8b2b726846c1cfccdadf2b4d102186bacb4c13813b5e0d6893bb8b4df673a884"

      def install
        bin.install "tow-darwin-amd64" => "tow"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-linux-arm64"
      sha256 "d8af2c1e93e512ddb3130fea084330001282b17c194f70f0b28c3343df68139a"

      def install
        bin.install "tow-linux-arm64" => "tow"
      end
    else
      url "https://github.com/neurosamAI/tow-cli/releases/download/v#{version}/tow-linux-amd64"
      sha256 "125908369e0306bd35be4e446fc3bde2f345181a4fb57371c1b5d5649d14bc8e"

      def install
        bin.install "tow-linux-amd64" => "tow"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tow --version")
  end
end
