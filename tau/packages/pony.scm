(define-module (tau packages pony)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages benchmark)
  #:use-module (gnu packages check)
  #:use-module (gnu packages bdw-gc)
  #:use-module (gnu packages base)
  #:use-module (gnu packages cmake))

(define-public ponyc
  (package
    (name "ponyc")
    (version "0.35.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ponylang/ponyc/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "03hdwzzzkvr3a1k0afxf3ycyj7q6v3l67fxahhllfh1zg8spysin"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:strip-binaries? #f
       #:phases
       (modify-phases %standard-phases
        (replace 'install
         (lambda* (#:key outputs #:allow-other-keys)
          (let ((out (assoc-ref outputs "out")))
            (invoke "make" "install" (string-append "DESTDIR=" out)))))
        (replace 'build
         (lambda _
          (invoke "make" "libs")
          (invoke "make" "build")))
        (replace 'configure
         (lambda* (#:key inputs outputs #:allow-other-keys)
           (let ((clang (assoc-ref inputs "clang"))
                 (llvm  (assoc-ref inputs "llvm")))
             (substitute* "src/ponyc/CMakeLists.txt"
              (("llvm_config.ponyc all.") "llvm_config(ponyc all)
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
")
              (("atomic") "atomic Threads::Threads"))

                 (call-with-output-file "lib/CMakeLists.txt"
                   (lambda (port)
                    (display (string-append "
cmake_minimum_required(VERSION 3.11 FATAL_ERROR)
file(STRINGS \"../VERSION\" PONYC_PROJECT_VERSION)
project(ponyclibs VERSION ${PONYC_PROJECT_VERSION} LANGUAGES C CXX)
include(ExternalProject)
if(NOT DEFINED PONYC_LIBS_BUILD_TYPE)
    set(PONYC_LIBS_BUILD_TYPE Release)
endif()
add_library(blake2 STATIC blake2/blake2b-ref.c)
set_property(TARGET blake2 PROPERTY POSITION_INDEPENDENT_CODE ON)
install(TARGETS blake2
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT library
)
") port)))
             (substitute* "CMakeLists.txt"
              (("\"build/libs.*") ")\n")
              ((".*benchmark.*") "")
              ((".*test/.*") "")
              ((".*tests.*") "")
              ((".*GTest.*") ""))
             (setenv "CC" (which "gcc"))
             (setenv "CXX" (which "g++"))
             (setenv "LLVM_CONFIG" (string-append llvm "/bin/llvm-config"))
             (invoke "make" "configure")))))))
    (native-inputs `(("cmake" ,cmake)))
    (propagated-inputs `(("gold" ,binutils-gold)))
    (inputs
     `(("llvm" ,llvm-9)
       ("clang" ,clang-9)
       ("libatomic-ops" ,libatomic-ops)))
    (home-page "")
    (description "")
    (synopsis "")
    (license #f)))

(define-public pony-corral
  (package
    (name "pony-corral")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ponylang/corral/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0x91imkysz4jyznddz3gs7dpz4sqcr1p8d426b2q8vbafiigli7s"))))
    (build-system gnu-build-system)
    (arguments
      '(#:make-flags (list (string-append "prefix=" %output))
        #:phases
        (modify-phases %standard-phases
          (delete 'check)
          (delete 'configure))))
    (inputs `(("ponyc" ,ponyc)))
    (home-page "")
    (description "")
    (synopsis "")
    (license #f)))
