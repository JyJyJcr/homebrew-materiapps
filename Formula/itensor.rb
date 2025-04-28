class ITensor < Formula
    desc "A C++ library for efficient tensor network calculations"
    homepage "http://itensor.org/"
    license "Apache 2.0"
    version "3.15"
    url "https://github.com/JyJyJcr/ITensor/archive/refs/tags/3.15-brew.tar.gz"
    head "https://github.com/JyJyJcr/ITensor.git", branch: "cmake"
  
    depends_on "cmake" => :build
    depends_on "ninja" => :build
    depends_on "libomp"
    depends_on "openblas"
  
    def install
        system "cmake", "-GNinja", "-S", ".", "-B", "build",
            "-DCMAKE_PREFIX_PATH=#{Formula["openblas"].opt_prefix}",
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
