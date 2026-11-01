# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.12"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.12/ky-darwin-arm64.tar.gz"
      sha256 "f14821d136cb530657a4410fe07f9a806b779cee2bc086dd6a57596dae6e92e1"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.12/ky-darwin-x64.tar.gz"
      sha256 "affcc6dc180a6e6d3e389ba2146484910b2b3c9fca37d304d390e6eb2cdbcd5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.12/ky-linux-arm64.tar.gz"
      sha256 "086f4812c830aafe400bc6db9e6efa24bc3035f730cb58cfd1dc6f1624e0bbad"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.12/ky-linux-x64.tar.gz"
      sha256 "ce154c091fba620bde90412c11d87eb4382f191f2c1077fba71a13626f7d50cb"
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
