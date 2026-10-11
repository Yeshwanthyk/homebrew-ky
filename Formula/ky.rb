# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.0/ky-darwin-arm64.tar.gz"
      sha256 "271e75760f3efe0dc6be9ede1f3e73d83c3b83b8a307b347513c100d6c1201f1"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.0/ky-darwin-x64.tar.gz"
      sha256 "dd74646a571026c0298d1a068c26275fbaacc0913079eec53452dd1a07aa3d99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.0/ky-linux-arm64.tar.gz"
      sha256 "ba9c771912b0cc81bfc8c1e18c4ebe31e99d0ce06c51a641fc4581bfae004192"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.0/ky-linux-x64.tar.gz"
      sha256 "daf6a48efe80c6f232d173fe6e3f51833ff9b8ba4b5f2e0eabd935183ce33fda"
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
