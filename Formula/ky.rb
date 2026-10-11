# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.1.0-rc.1"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.1.0-rc.1/ky-darwin-arm64.tar.gz"
      sha256 "5d64b6467126c1642d50006c98fe8631c7a1275b9d4f869fa1cd346e69de592c"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.1.0-rc.1/ky-darwin-x64.tar.gz"
      sha256 "f4189eddf847035dc87372426e02630fefd017000017381d414b3f20fa7d60c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.1.0-rc.1/ky-linux-arm64.tar.gz"
      sha256 "69a530a7819a723765131b3cac329a14176c77b13734fca5ff7b31488fcad705"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.1.0-rc.1/ky-linux-x64.tar.gz"
      sha256 "7da928cde0dca320446c61aa9b48083beaffd45ebfe99fa9e469151ba54a6d57"
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
