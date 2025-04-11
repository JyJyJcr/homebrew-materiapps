class QuantumEspresso < Formula
    desc "Quamtum opEn-Source Package for Research in Electronic Structure, Simulation, and Optimization"
    homepage "https://www.quantum-espresso.org"
    license "GPL-2.0"
    url "https://github.com/JyJyJcr/q-e.git",
        tag: "7.4.1-brew",
        revision: "7fe8102023e5ba60f0d3378dc2e72ad12343ae4c"
    head "https://github.com/JyJyJcr/q-e.git", branch: "develop-brew"

  bottle do
    root_url "https://github.com/JyJyJcr/homebrew-materiapps/releases/download/prerelease-trial7"
    rebuild 1
    sha256 cellar: :any, arm64_sonoma: "790f01b13cb89de8255dea9cb2157ee8925d3148fac93515d0f7e0988c682191"
    sha256 cellar: :any, ventura:      "89ae51deeb47c6cfdd160bdf1a2d7abd656cac2b5d16757d74e60bc2d01e79db"
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
