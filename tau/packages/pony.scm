(define-module (tau packages pony)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages benchmark)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake))

(define-public pony
  (package
    (name "pony")
    (version "0.35.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ponylang/ponyc/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "03hdwzzzkvr3a1k0afxf3ycyj7q6v3l67fxahhllfh1zg8spysin"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'build-blake
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
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
              (setenv "CC" "gcc")
              (setenv "CXX" "g++")
              (invoke "make" "libs")
              #t)))
         (add-before 'configure 'fix-cmake-files
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "src/ponyc/CMakeLists.txt"
              (("llvm_config.ponyc all.") "llvm_config(ponyc all)
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
")
              (("atomic") "atomic Threads::Threads"))
             (substitute* "CMakeLists.txt"
              (("build/libs/lib/cmake/llvm")
               (string-append (assoc-ref inputs "llvm") "/lib/cmake/llvm"))
              ((".*test/.*") "")
              ((".*tests.*") "")
              ((".*GTest.*") "")
              ((".*benchmark.*") ""))
             #t)))))
;(native-inputs `(("pkg-config" ,pkg-config)))
    (inputs
      `(("llvm" ,llvm-8)
        ; TODO: fails to link
        ;("benchmark" ,benchmark)
        ;("googletest" ,googletest)
        ))
    (home-page "")
    (description "")
    (synopsis "")
    (license #f)))
