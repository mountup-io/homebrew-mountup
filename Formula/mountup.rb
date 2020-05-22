class Mountup < Formula
  desc "mountup is a code syncing tool used with remote machines"
  homepage "https://mountup.io"
  url "https://github.com/mountup-io/mountup/archive/v0.1.1.tar.gz"
  sha256 "eaa799100a307a9dfd09f2160fa373e51ec6794347416bb12f27deafd0526065"

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
