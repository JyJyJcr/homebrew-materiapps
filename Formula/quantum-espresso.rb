class QuantumEspresso < Formula
    desc "Quamtum opEn-Source Package for Research in Electronic Structure, Simulation, and Optimization"
    homepage "https://www.quantum-espresso.org"
    license "GPL-2.0"
    version "7.4.1"
    revision 1
    url "https://github.com/JyJyJcr/q-e.git",
        tag: "7.4.1-brew",
        revision: "7fe8102023e5ba60f0d3378dc2e72ad12343ae4c"
    head "https://github.com/JyJyJcr/q-e.git", branch: "develop-brew"

  bottle do
    root_url "https://github.com/JyJyJcr/homebrew-materiapps/releases/download/release/quantum-espresso/7.4.1-1"
    sha256 cellar: :any, arm64_sonoma: "94ae3aeac941bb0cfc4153ae5f4c8a66009c3f8518aa2995cc25fdcbc3e9a534"
    sha256 cellar: :any, ventura:      "f1861d28d6caaa2339b8f02d34108c7c06391febe778bc57d2c2d929c871613b"
  end
  
    depends_on "cmake" => :build
    depends_on "ninja" => :build
    depends_on "gcc" # for gfortran
    depends_on "fftw"
    depends_on "open-mpi"
    depends_on "openblas"
    depends_on "scalapack"
  
    def install
        system "cmake", "-GNinja", "-S", ".", "-B", "build",

            "-DBUILD_SHARED_LIB=ON",
            "-DQE_ENABLE_OPENMP=ON",
            "-DQE_ENABLE_SCALAPACK=ON",
            "-DQE_ENABLE_MPI=ON",
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
