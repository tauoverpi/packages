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

(define-public mimalloc
  (package
    (name "mimalloc")
    (version "custom")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/microsoft/mimalloc")
                     (commit "a9686d6ecf00e4467e772f7c0b4ef76a15f325f6")))
                (sha256
                  (base32
                    "0b6ymi2a9is2q6n49dvlnjxknikj0rfff5ygbc4n7894h5mllvvr"))))
    (build-system cmake-build-system)
    (native-inputs
      `(("pkg-config" ,pkg-config)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))


(define libdxfrw
    (origin
      (method git-fetch)
      (uri (git-reference
             (url "https://github.com/solvespace/libdxfrw")
             (commit "0b7b7b709d9299565db603f878214656ef5e9ddf")))
      (sha256
        (base32
          "0c4ppkhgc250j8mnf682zfqxgyqmsp458ginv9zxahkvzkhyz2hi"))))

(define-public solvespace
  (let ((commit "222c80e4c132f6d1fa1bc0a293660f65874a683f")
        (revision "1"))
    (package
      (name "solvespace")
      (version "3.0")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/solvespace/solvespace")
                       (recursive? #t)
                       (commit commit)))
                (sha256
                  (base32
                    "0hdvc1nibm7qjfvhgg4by7bjr196q5jb4hlr1vr75184xzdhvs7g"))))
      (build-system cmake-build-system)
      (arguments
        '(#:phases
          (modify-phases %standard-phases
            (add-after 'unpack 'merge-dependencies
              (lambda* (#:key inputs outputs #:allow-other-keys)
                (substitute* "CMakeLists.txt"
                  (("include.GetGitCommitHash.") ""))
                ;(copy-recursively (assoc-ref inputs "libdxfrw") "extlib/libdxfrw")
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
          ("mimalloc" ,mimalloc)
          ;("libdxfrw" ,libdxfrw)
          ("flatbuffers" ,flatbuffers)
          ("libspnav" ,libspnav)
          ("freetype" ,freetype)))
      (description "")
      (synopsis "")
      (home-page "")
      (license #f))))
