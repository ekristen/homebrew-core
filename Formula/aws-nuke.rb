class AwsNuke < Formula
  desc "Nuke a whole AWS account and delete all its resources"
  homepage "https://github.com/rebuy-de/aws-nuke"
  url "https://github.com/rebuy-de/aws-nuke/archive/refs/tags/v2.16.0.tar.gz"
  sha256 "a5abf8ef5ca9e10e5ebc5f3599278b22427e73ec3d78d1f5af343e41cb04aace"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/rebuy-de/aws-nuke"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", "#{bin}/aws-nuke"
    end
  end

  test do
    system "true"
  end
end
