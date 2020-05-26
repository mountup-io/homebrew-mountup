class Mountup < Formula
  desc "mountup is a code syncing tool used with remote machines"
  homepage "https://mountup.io"
  url "https://github.com/mountup-io/mountup/archive/v0.1.3.tar.gz"
  sha256 "39cfd6531e8ee7d86a2a1738be3b45975f448edd74ed6f9d798ffe256be97837"

  depends_on "go" => :build
  depends_on "fswatch"

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/mountup-io/mountup"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "get", "."
      system "go", "build", "-o", bin/"mountup", "."
    end
  end

  test do
    system "#{bin}/mountup", "--help"
  end
end
