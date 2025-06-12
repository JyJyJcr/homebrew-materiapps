class Itensor < Formula
    desc "A C++ library for efficient tensor network calculations"
    homepage "http://itensor.org/"
    license "Apache 2.0"
    version "3.2.0"
    url "https://github.com/JyJyJcr/ITensor.git",
        tag: "3.2.0-brew",
        revision: "82b0e54dcb8d2c0190adfb7cab292ecce40f003f"
    head "https://github.com/JyJyJcr/ITensor.git", branch: "version"

  bottle do
    root_url "https://github.com/JyJyJcr/homebrew-materiapps/releases/download/prerelease/itensor/trial1"
    sha256 cellar: :any, arm64_sonoma: "ff9de772a5a1b5591d75f63922929ceabdb422702a11713628a0da189e39e291"
    sha256 cellar: :any, ventura:      "75b1c8e4ee83a23189bb42525e7af0dfb1d1e513082575add53535453b8c0708"
  end
  
    depends_on "cmake" => :build
    depends_on "ninja" => :build

    on_macos do
        depends_on "libomp"
        fails_with :gcc do
            cause "libomp is not compatible with gcc"
        end
    end

    # not tested yet
    on_linux do
        depends_on "openblas"
        depends_on "gcc" # for libgomp, since openblas is built with this
        fails_with :clang do
            cause "itensor depends on openblas and openblas use libgomp (in gcc), which is not compatible with clang"
        end
    end
  
    def install
        system "cmake", "-GNinja", "-S", ".", "-B", "build",
#            "-DCMAKE_PREFIX_PATH=#{Formula["openblas"].opt_prefix}",
            *std_cmake_args
        system "cmake", "--build", "build"
        system "cmake", "--install", "build"
    end
  
    test do
      # here we add change for testing merge!

      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test quantum-espresso`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system bin/"program", "do", "something"`.
      system "false"
    end
end
