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
# The 0.5.0 / __SHA_*__ placeholders below are substituted there.
class Klaridian < Formula
  desc "Generate MCP servers from an OpenAPI spec — native binary, no Node required"
  homepage "https://klaridian.dev"
  version "0.5.0"
  license "MIT"

  # The prebuilt macOS binaries need macOS 13 (Ventura) or later — the
  # minimum comes from Bun's runtime (LC_BUILD_VERSION minos 13.0), not from
  # the release runner. release.yml asserts the wheel tags match (MCPFO-135).
  depends_on macos: :ventura

  on_macos do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.5.0/klaridian-darwin-arm64"
      sha256 "65fb38732cef9d62fb8a8319e936dc94ed10875c5d59f4b1bd46217eda16194c"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.5.0/klaridian-darwin-x64"
      sha256 "1442fd98d0662e40e358727f07399b07e0009cea9525ed08cdb6a1a9c5cbdb66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.5.0/klaridian-linux-arm64"
      sha256 "0a43581df6d964d76342821636cc0f8d2e0dfe4f626229de9a7484e4f52adc83"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.5.0/klaridian-linux-x64"
      sha256 "f61753dcdecf876cc76eb58c57de2e7e3a9ccd0642b62f4ac537839007e37b9a"
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
