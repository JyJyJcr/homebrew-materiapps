class HPhi < Formula
    desc "Quantum Lattice Model Simulator Package"
    homepage "https://www.pasums.issp.u-tokyo.ac.jp/hphi/en/"
    license "GPL-3.0"
    version "3.5.2"
    url "https://github.com/issp-center-dev/HPhi.git",
        tag: "v3.5.2",
        revision: "df0277d9a2c8f8a16dcc266db2e31ccd75214aa1"
    head "https://github.com/issp-center-dev/HPhi.git", branch: "develop"
  
    depends_on "cmake" => :build
    depends_on "ninja" => :build
    depends_on "gcc" # for gfortran
    depends_on "open-mpi"
    depends_on "openblas"
    depends_on "scalapack"
  
    def install
        system "cmake", "-GNinja", "-S", ".", "-B", "build",

            "-DBUILD_SHARED_LIB=ON",
            "-DUSE_SCALAPACK=ON",
            #"-DSCALAPACK_LIBRARIES=-lscalapack",
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
