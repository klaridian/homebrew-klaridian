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
# The 0.5.1 / __SHA_*__ placeholders below are substituted there.
class Klaridian < Formula
  desc "Generate MCP servers from an OpenAPI spec — native binary, no Node required"
  homepage "https://klaridian.dev"
  version "0.5.1"
  license "MIT"

  # The prebuilt macOS binaries need macOS 13 (Ventura) or later — the
  # minimum comes from Bun's runtime (LC_BUILD_VERSION minos 13.0), not from
  # the release runner. release.yml asserts the wheel tags match (MCPFO-135).
  depends_on macos: :ventura

  on_macos do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.5.1/klaridian-darwin-arm64"
      sha256 "3c1960bfb42a09ce9e0d14eeec29779c7910a4c17eaa290329f6e6546af58f12"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.5.1/klaridian-darwin-x64"
      sha256 "150c69bfd07e0ce6617f584e3151d61137662019557bc1de93a3f1996afad147"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.5.1/klaridian-linux-arm64"
      sha256 "e0ea71d7ad0338c838854a285cf0150e4cf07ca25dddabf60e2e2b4fb22165a5"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.5.1/klaridian-linux-x64"
      sha256 "79358d0c6ab85c6a5b2988e3be8185265f764896e2ef8719dab62de7cc315930"
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
