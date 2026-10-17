# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.8"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.8/ky-darwin-arm64.tar.gz"
      sha256 "9d944c2be48f7735ca9c3cefd0101497dc7353f1eec7a175ede2f541303d2d62"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.8/ky-darwin-x64.tar.gz"
      sha256 "f3e594d2f669e419830efd475a67583d7605a286ee3a332fec0d3fee79a02a38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.8/ky-linux-arm64.tar.gz"
      sha256 "51fa405e15d606984d63bc32339f1a5b7e2e0a3f35c9190565e6fdef766aefac"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.8/ky-linux-x64.tar.gz"
      sha256 "d589203ab87a2841aaf3c27089909dbe8136dd7caf49c4914d7a9b90ac1babd3"
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
