(define-module (levy packages purple)
  #:use-module (levy packages crypto)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages web)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages pkg-config))

(define-public slack-purple
  (let ((commit "be97802c7fd0b611722d2f551756e2a2672f6084")
        (revision "1"))
    (package
      (name "slack-purple")
      (version "")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/dylex/slack-libpurple")
                       (commit commit)))
                (sha256
                  (base32
                    "0l6hwnnv6zzszxkk0a3nli88w5gijvlc9qgkkai0sb4v4c504y5v"))))
      (build-system gnu-build-system)
      (arguments
        '(#:tests? #f
          #:phases
          (modify-phases %standard-phases
            (replace 'install
              (lambda* (#:key outputs #:allow-other-keys)
                (let* ((out (assoc-ref outputs "out"))
                       (pidgin-2 (string-append out "/lib/pidgin-2/libslack.so"))
                       (pixmaps (lambda (num) (string-append out "/pixmaps/pidgin/protocols/" num "/slack.png"))))
                  (install-file "libslack.so" pidgin-2)
                  (install-file "img/slack16.png" (pixmaps "16"))
                  (install-file "img/slack22.png" (pixmaps "22"))
                  (install-file "img/slack48.png" (pixmaps "48")))))
            (delete 'configure))))
      (native-inputs
        `(("pkg-config" ,pkg-config)))
      (inputs
        `(("pidgin" ,pidgin)
          ("glib" ,glib)))
      (synopsis "")
      (description "")
      (home-page "")
      (license #f))))

(define-public matrix-purple
  (let ((commit "4494ba22b479917f0b1f96a3019792d3d75bcff1")
        (revision "1"))
    (package
      (name "matrix-purple")
      (version "")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/matrix-org/purple-matrix")
                       (commit commit)))
                (sha256
                  (base32
                    "1gjm0z4wa5vi9x1xk43rany5pffrwg958n180ahdj9a7sa8a4hpm"))))
      (build-system gnu-build-system)
      (arguments
        '(#:tests? #f
          #:phases
          (modify-phases %standard-phases
            (replace 'install
              (lambda* (#:key outputs #:allow-other-keys)
                (let* ((out (assoc-ref outputs "out"))
                       (pidgin-2 (string-append out "/lib/pidgin-2/libmatrix.so"))
                       (pixmaps (lambda (num) (string-append out "/pixmaps/pidgin/protocols/" num "/matrix.png"))))
                  (install-file "libmatrix.so" pidgin-2)
                  (install-file "matrix-16px.png" (pixmaps "16"))
                  (install-file "matrix-22px.png" (pixmaps "22"))
                  (install-file "matrix-48px.png" (pixmaps "48")))))
            (delete 'configure))))
      (native-inputs
        `(("pkg-config" ,pkg-config)))
      (inputs
        `(("pidgin" ,pidgin)
          ("json-glib" ,json-glib)
          ("glib" ,glib)
          ("http-parser" ,http-parser)
          ("sqlite", sqlite)
          ("olm" ,olm)
          ("libgcrypt" ,libgcrypt)))
      (description "")
      (synopsis "")
      (home-page "")
      (license #f))))
