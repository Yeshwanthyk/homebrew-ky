# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.7"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.7/ky-darwin-arm64.tar.gz"
      sha256 "c95a0382023ad81357cc6969445cc4cb3345618119114e0887a4069e20171c17"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.7/ky-darwin-x64.tar.gz"
      sha256 "e21148a59a83f0e754eae789463cfeee74bd1a3bf0c03e6e04f82067f0eea0dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.7/ky-linux-arm64.tar.gz"
      sha256 "92cb2d4cb418944868b7bb2b11707bbcaacf3a70a95c00eb64bde4dca27ec666"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.7/ky-linux-x64.tar.gz"
      sha256 "7178268d3d088f36987b7bb830eb795914ba4828fdbf161adc21424c3a16c18d"
    end
  end

  def install
    bin.install "ky"
  end

  def caveats
    <<~EOS
      Then run: ky init

      Another program can be named ky too. If `ky --version` doesn't say (ky-durable-cli),
      that one comes first on your PATH: run this one as #{opt_bin}/ky, or put
      #{HOMEBREW_PREFIX}/bin before its folder on your PATH.
    EOS
  end

  test do
    assert_match "ky #{version} (ky-durable-cli)", shell_output("#{bin}/ky --version")
  end
end
