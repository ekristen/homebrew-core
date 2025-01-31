require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.35.tgz"
  sha256 "8ceb78a9eef2211acc68f0fdd9703f4c193de891d1c1934a28035a35c7237302"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "b8b7e5b6a331e404df19a90cf33545ec2f93611a064b05b45b15eee28acb48c5"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
