(define-module (tau packages solvespace)
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
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages image))

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
                       (recursive? #f)
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
                ;(copy-recursively (assoc-ref inputs "flatbuffers") "extlib/flatbuffers")
                ;(copy-recursively (assoc-ref inputs "libdxfrw") "extlib/libdxfrw")
                ;(copy-recursively (assoc-ref inputs "q3d") "extlib/q3d")
                #t)))))
      (native-inputs
        `(("pkg-config" ,pkg-config)))
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
          ;("q3d" ,q3d)
          ;("libdxfrw" ,libdxfrw)
          ("flatbuffers" ,flatbuffers)
          ("libspnav" ,libspnav)
          ("freetype" ,freetype)))
      (description "")
      (synopsis "")
      (home-page "")
      (license #f))))
