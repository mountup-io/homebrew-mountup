class Mountup < Formula
  desc "mountup is a code syncing tool used with remote machines"
  homepage "https://mountup.io"
  url "https://github.com/mountup-io/mountup/archive/v0.1.2.tar.gz"
  sha256 "9d8d4a2f76684d3f8b127127f7e94ead1449f9d096b2411deee5fe0887595f69"

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
