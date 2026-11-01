# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.13"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.13/ky-darwin-arm64.tar.gz"
      sha256 "accc01a0125035057f7ba184757d530b44d9d94939746f181fcccde9f9c13ca5"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.13/ky-darwin-x64.tar.gz"
      sha256 "9c6b5733a8ccef74c50f701bb2df01c5bd99d9b380420bc3edb13e398a43691d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.13/ky-linux-arm64.tar.gz"
      sha256 "120a7279025713c8143f2acc13f05c7d4671786da9b7f181dbf8da79b5d71f91"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.13/ky-linux-x64.tar.gz"
      sha256 "1578a307e6c8db5ae5bc89c9bab767be636af7b55b10a763f69baf4e26448f8a"
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
