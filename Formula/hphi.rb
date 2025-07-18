class Hphi < Formula
    desc "Quantum Lattice Model Simulator Package"
    homepage "https://www.pasums.issp.u-tokyo.ac.jp/hphi/en/"
    license "GPL-3.0"
    version "3.5.2"
    url "https://github.com/issp-center-dev/HPhi.git",
        tag: "v3.5.2",
        revision: "df0277d9a2c8f8a16dcc266db2e31ccd75214aa1"
    head "https://github.com/issp-center-dev/HPhi.git", branch: "develop"

  bottle do
    root_url "https://github.com/JyJyJcr/homebrew-materiapps/releases/download/release/hphi/3.5.2"
    sha256 cellar: :any, arm64_sonoma: "ba6b4e8d858887c4d70cc470a8c1a2c84713e04c208ea6464cbd6b9e4545a97e"
    sha256 cellar: :any, ventura:      "ca7388b1cbbbcdd5d89fd149030f5b67c455c42eb572187a68a6efba10053612"
  end
  
    depends_on "cmake" => :build
    depends_on "ninja" => :build
    depends_on "gcc" # for gfortran
    depends_on "open-mpi"
    depends_on "openblas"
    depends_on "scalapack"
  
    def install
        system "cmake", "-GNinja", "-S", ".", "-B", "build",
            "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
            "-DBUILD_SHARED_LIB=ON",
            "-DUSE_SCALAPACK=ON",
            "-DSCALAPACK_LIBRARIES=-lscalapack",
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
