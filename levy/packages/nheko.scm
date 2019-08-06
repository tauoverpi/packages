(define-module (levy packages nheko)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages check)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages qt))

(define tweeny
  (package
    (name "tweeny")
    (version "3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mobius3/tweeny/archive/v"
                                  version
                                  ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
                (base32
                  "0hf9chp43jjj2xcv09pwiph0ri1x0sn680gqcc9vp34mixbk75k9"))))
    (build-system cmake-build-system)
    (arguments
     '(#:tests? #f))
    (home-page "")
    (synopsis "")
    (description "")
    (license license:expat)))

(define lmdbxx
  (let ((commit "0b43ca87d8cfabba392dfe884eb1edb83874de02")
        (revision "1"))
    (package
      (name "lmdbxx")
      (version (string-append "0.9.14.0" revision "." (string-take commit 7)))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/drycpp/lmdbxx")
                       (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                  (base32
                    "1whsc5cybf9rmgyaj6qjji03fv5jbgcgygp956s3835b9f9cjg1n"))))
      (build-system gnu-build-system)
      (arguments
       '(#:tests? #f
         #:make-flags (list "CC=gcc"
                            (string-append "PREFIX=" %output))
         #:phases
         (modify-phases %standard-phases
           (delete 'configure))))
      (inputs
       `(("lmdb" ,lmdb)))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))

(define olm
  (package
    (name "olm")
    (version "3.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.matrix.org/matrix-org/olm/-/archive/"
                                  version
                                  "/olm-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1zr6bi9kk1410mbawyvsbl1bnzw86wzwmgc7i5ap6i9l96mb1zqh"))))
    (build-system cmake-build-system)
    (arguments
     '(#:tests? #f))
    (home-page "https://github.com/Nheko-Reborn/mtxclient")
    (synopsis "")
    (description "")
    (license license:expat)))

(define nlohmann-json-cpp-3.2.0
  (package
    (inherit nlohmann-json-cpp)
    (version "3.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nlohmann/json/archive/v"
                                  version
                                  ".tar.gz"))
              (file-name (string-append "nlohmann-json" "-" version ".tar.gz"))
              (sha256
               (base32
                 "0bp2flqbnqy7z30qr3gsmh8gfgvd40v9yviagxx3vgs01q4mpi40"))))
    (arguments
     '(#:tests? #f))))

(define spdlog
  (package
    (name "spdlog")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gabime/spdlog/archive/v"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0w5bwshfyhdz8l5v7csc3irnc4lhyqvmcxgg494ivnwldqk4a20n"))))
    (build-system cmake-build-system)
    (arguments
      '(#:tests? #f
        #:phases
        (modify-phases %standard-phases
           (add-after 'unpack 'remove-benchmark
              (lambda _
                (substitute* "CMakeLists.txt"
                  (("^.*bench.*$") ""))
              #t)))))
    (home-page "https://github.com/Nheko-Reborn/mtxclient")
    (synopsis "")
    (description "")
    (license license:expat)))

(define mtxclient
  (package
    (name "mtxclient")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Nheko-Reborn/mtxclient/archive/v"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0nl4kwyf2gyfmk1912aq7xcnxiv4y4axqxyglrwm9glgxprig4l5"))))
    (build-system cmake-build-system)
    (arguments
     '(#:tests? #f))
    (native-inputs
      `(("pkg-config" ,pkg-config)
        ("googletest" ,googletest)))
    (inputs
      `(("boost" ,boost)
        ("libsodium" ,libsodium)
        ("spdlog" ,spdlog)
        ("zlib" ,zlib)
        ("olm" ,olm)
        ("nlohmann-json-cpp" ,nlohmann-json-cpp-3.2.0)
        ("openssl" ,openssl)))
    (home-page "https://github.com/Nheko-Reborn/mtxclient")
    (synopsis "")
    (description "")
    (license license:expat)))

(define-public nheko-reborn
  (package
    (name "nheko-reborn")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Nheko-Reborn/nheko/archive/v"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "07kmix82s61fm4wqi4b2xj73caj2pz56hib40mpsxkv0hz5k5gjx"))))
    (build-system cmake-build-system)
    (arguments
     '(#:tests? #f
       #:parallel-build? #f))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("nlohmann-json-cpp" ,nlohmann-json-cpp-3.2.0)
       ("lmdbxx" ,lmdbxx)
       ("spdlog" ,spdlog)
       ("tweeny" ,tweeny)
       ("qtlinguist" ,qttools)
       ("boost" ,boost)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("qtbase" ,qtbase)
       ("qtsvg" ,qtsvg)
       ("qtmultimedia" ,qtmultimedia)
       ("libsodium" ,libsodium)
       ("cmark" ,cmark)
       ("lmdb" ,lmdb)
       ("mtxclient" ,mtxclient)
       ("zlib" ,zlib)
       ("olm" ,olm)
       ("openssl" ,openssl)))
    (home-page "https://github.com/Nheko-Reborn/mtxclient")
    (synopsis "")
    (description "")
    (license license:expat)))
