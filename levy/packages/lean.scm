(define-module (levy packages lean)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages python))

(define-public lean
  (package
    (name "lean")
    (version "3.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/leanprover/lean/archive/v"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "11qdq3v739bmw6icmlrrc53jcyqg7l983v4dydk7cmvkhjz8hi7c"))))
    (build-system cmake-build-system)
    (arguments
      `(#:phases
         (modify-phases %standard-phases
            (replace 'configure
              (lambda* (#:key outputs #:allow-other-keys)
                (let ((out (assoc-ref outputs "out")))
                  (invoke "cmake" "-DCMAKE_BUILD_TYPE=Release"
                          "-DCMAKE_INSTALL_LIBDIR=lib"
                          "src/"
                          (string-append "-DCMAKE_INSTALL_PREFIX=" out))))))))

    (native-inputs
      `(("python" ,python)
        ("gperf" ,gperf)))
    (inputs
      `(("gmp" ,gmp)
        ("mpfr" ,mpfr)
        ("lua" ,lua)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))
