# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.10"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.10/ky-darwin-arm64.tar.gz"
      sha256 "494e12bf2552ac3cd85cc79e463f7d524e6f1fd945e48034edeeb89092ae7a96"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.10/ky-darwin-x64.tar.gz"
      sha256 "6f27271431f4ab15abf84cac27cc5ae65625771e82decaeea1aa01e03fb7d8f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.10/ky-linux-arm64.tar.gz"
      sha256 "a0264bf33a60e4bb3637e11239ad614eb1e8a90dd27dcd0e97e8ad1a66c24400"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.10/ky-linux-x64.tar.gz"
      sha256 "028b60eb2cd69809b148d4a64eb4726b525a5aa2df45d728f89340224703e8eb"
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
