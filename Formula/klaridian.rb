# Homebrew formula for klaridian — TEMPLATE.
#
# This is the source of truth for the formula that lives in the tap repo
# `klaridian/homebrew-klaridian` (Formula/klaridian.rb). It downloads
# the PREBUILT binary from the GitHub Release — it does NOT `depends_on "node"`
# and does NOT build from source. That keeps `brew install` a zero-Node,
# instant install (the Speakeasy model, ARCHITECTURE.md §64).
#
# The url/sha256 per platform are filled in per release by
# packaging/homebrew/render-formula.sh from the release's binary assets.
# The 0.1.1 / __SHA_*__ placeholders below are substituted there.
class Klaridian < Formula
  desc "Generate MCP servers from an OpenAPI spec — native binary, no Node required"
  homepage "https://klaridian.dev"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.1.1/klaridian-darwin-arm64"
      sha256 "fa0f80ddc2b5471cad640037d4e0e9b3017b1955eb98a1e0329e734df1e86a9f"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.1.1/klaridian-darwin-x64"
      sha256 "db8c6627581969e01b90ab53eaeb3dc68e624d09eccd287bf1781b1a563ef181"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.1.1/klaridian-linux-arm64"
      sha256 "a8967cbdad783b1319b78f821b485365668aa22a7579ac3db7fcc2eab1d92bc1"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.1.1/klaridian-linux-x64"
      sha256 "38bc5d9047434118b289d0f52a5d32b62df9b80edc715958fbb1217d8d46d09a"
    end
  end

  def install
    # The downloaded asset is the bare binary; install it as `klaridian`.
    bin.install Dir["*"].first => "klaridian"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/klaridian --version")
  end
end
