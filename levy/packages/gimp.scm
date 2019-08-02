(define-module (levy packages gimp)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (gnu packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gimp))

(define-public gimp-normalmap
  (let ((commit "")
        (revision "1"))
    (package
      (name "gimp-normalmap")
      (version "1.2.3")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/muellesi/gimp-normalmap")
                       (commit commit)))
                (sha256
                  (base32
                    "03scx14f3y6zlm893l3jxmv7043kvcjian7g9y091qh1d5pd1bni"))))
      (build-system gnu-build-system)
      (arguments
        '(#:tests? #f
          #:phases
          (modify-phases %standard-phases
            (delete 'configure))))
      (native-inputs
        `(("pkg-config" ,pkg-config)))
      (inputs
        `(("gimp" ,gimp)
          ("gegl" ,gegl)
          ("glew" ,glew)
          ("gtkglext" ,gtkglext)
          ("gtk+" ,gtk+-2)))
      (description "")
      (synopsis "")
      (home-page "")
      (license #f))))

gimp-normalmap
