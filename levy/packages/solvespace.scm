(define-module (levy packages solvespace)
  #:use-module (guix packages)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages web)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages image))

(define libspnav
  (package
    (name "libspnav")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/FreeSpacenav/libspnav/archive/libspnav-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0xkqrbl05rqf3lsd41bacsf1lbvqdy35djibia2vfwyl2wjja7n6"))))
    (build-system gnu-build-system)
    (arguments
      '(#:tests? #f))
    (inputs
      `(("libx11" ,libx11)))
    (description "")
    (synopsis "")
    (home-page "")
    (license #f)))

(define %libdxfrw-origin
  (let ((commit "03fa5f30f1a1db7231a25653c9dd38044fe06640")
        (revision "1"))
    (origin
      (method git-fetch)
        (uri (git-reference
                (url "https://github.com/solvespace/libdxfrw")
                (commit commit)))
        (file-name (git-file-name "libdxfrw"
                                  (string-append "2.3-" revision
                                                 (string-take commit 7))))
        (sha256
          (base32
            "0fdq2xfcnqrly6ydzzpav87rsgg5ywzawq72yxi06k5h0knmsjdg")))))

(define %q3d-origin
  (let ((commit "880db1d34706778f216a2308fd82a9a3adacb314")
        (revision "1"))
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/q3k/q3d")
               (commit commit)))
        (file-name (git-file-name "q3d"
                                  (string-append "2.3-" revision
                                                 (string-take commit 7))))

        (sha256
          (base32
            "0gkvsrawsw8jyh85n44qpi6xwc3k9laf7qvvvlfal040vzr2rx8r")))))

(define %flatbuffers-origin
  (let ((commit "a1f14005ab823adc1300754fd37c01e9842ed4bc")
        (revision "1"))
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/flatbuffers")
               (commit commit)))
        (file-name (git-file-name "flatbuffers"
                                  (string-append "2.3-" revision
                                                 (string-take commit 7))))
        (sha256
         (base32
          "07039wz00l28xaq9f7gg711yfd43g5airg2dbd1icm3vi88i684j")))))

(define-public solvespace
  (let ((commit "b3f739f2c4f75cbdb2613e1fe9cb7fff9b880143")
        (revision "1"))
    (package
      (name "solvespace")
      (version "2.3")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/solvespace/solvespace")
                       ;(recursive? #t)
                       (commit commit)))
                (sha256
                  (base32
                    "01c8zrygl90sc8kl96p7hxbl1vddj77c0ba6f5zf0s2pk5m1l222"))))
      (build-system cmake-build-system)
      (arguments
        '(#:phases
          (modify-phases %standard-phases
            (add-after 'unpack 'merge-dependencies
              (lambda* (#:key inputs outputs #:allow-other-keys)
                (substitute* "CMakeLists.txt"
                  (("include.GetGitCommitHash.") ""))
                (copy-recursively (assoc-ref inputs "flatbuffers") "extlib/flatbuffers")
                (copy-recursively (assoc-ref inputs "libdxfrw") "extlib/libdxfrw")
                (copy-recursively (assoc-ref inputs "q3d") "extlib/q3d")
                #t)))))
      (native-inputs
        `(("pkg-config" ,pkg-config)))
          ("q3d" ,%q3d-origin)
          ("libdxfrw" ,%libdxfrw-origin)
          ("flatbuffers" ,%flatbuffers-origin)))
      (inputs
        `(("cairo" ,cairo)
          ("gtkmm" ,gtkmm)
          ("libpng" ,libpng)
          ("fontconfig" ,fontconfig)
          ("glu" ,glu)
          ("glew" ,glew)
          ("json-c" ,json-c)
          ("pangomm" ,pangomm)
          ("mesa" ,mesa)
          ("gettext" ,gettext-minimal)
          ("libspnav" ,libspnav)
          ("freetype" ,freetype)))
      (description "")
      (synopsis "")
      (home-page "")
      (license #f))))
