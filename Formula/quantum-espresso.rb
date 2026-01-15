class QuantumEspresso < Formula
    desc "Quamtum opEn-Source Package for Research in Electronic Structure, Simulation, and Optimization"
    homepage "https://www.quantum-espresso.org"
    license "GPL-2.0"
    version "7.4.1"
    revision 5
    url "https://github.com/JyJyJcr/q-e.git",
        tag: "7.4.1-brew-4",
        revision: "9cb5f5f487af36ec5f744bf4e884241643d008ba"
    head "https://github.com/JyJyJcr/q-e.git", branch: "brew"

  bottle do
    root_url "https://github.com/JyJyJcr/homebrew-materiapps/releases/download/release/quantum-espresso/7.4.1-5_"
    rebuild 1
    sha256 arm64_sonoma: "d7146d4731379c651af4ecc13dfdfeaf4962d485b1841985015f38c281211a60"
    sha256 sequoia:      "27cf2c72106832b3e2c3a24f24436ac41cffa10038f776dca28a52dc573f777e"
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
            "-DCMAKE_INSTALL_RPATH=#{rpath}",
            "-DBUILD_SHARED_LIBS=ON",
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
      system "true"
    end
end
