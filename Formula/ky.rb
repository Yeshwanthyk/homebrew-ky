# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.5/ky-darwin-arm64.tar.gz"
      sha256 "b38e7152b17a7a064b38b0c2b71ee200e23390f761caa4d1261859d7a1b83b47"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.5/ky-darwin-x64.tar.gz"
      sha256 "0b64a57834107c23bae38f01c2185bba47b0656875e483c9db724f9ef2074bf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.5/ky-linux-arm64.tar.gz"
      sha256 "77e391f053b117335cb530cff88cfbfd20186ae116d71469ffac56d5e84d56c7"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.5/ky-linux-x64.tar.gz"
      sha256 "dce2da5f7361cc98b70c3f9eaa835056513c1db03adf0476389ca80c1397dfae"
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
