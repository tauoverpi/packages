(define-module (tau packages x52pro)
  #:use-module (guix packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages python)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module (guix download))

(define-public x52pro
  (package
    (name "x52pro")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                     "https://github.com/nirenjan/x52pro-linux/archive/v" version ".tar.gz"))
              (sha256
                (base32
                  "1kgd494b1gll0vzylrjlc80asbblvavmhf74gl2idf1pz9zw61s2"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-python-files
          (lambda* (#:key inputs #:allow-other-keys)
            (substitute* "lib/libx52util/x52_char_map_gen.py"
              (("/usr/bin/python") (string-append (assoc-ref inputs "python")
                                                  "/bin/python3")))
            #t)))))
    (inputs
     `(("autoconf" ,autoconf)
       ("libtool" ,libtool)
       ("libusb" ,libusb)
       ("pkg-config" ,pkg-config)
       ("python" ,python)
       ("automake" ,automake)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))
