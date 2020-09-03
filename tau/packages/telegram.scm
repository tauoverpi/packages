(define-module (tau packages telegram)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages python)
  #:use-module (gnu packages web))

(define-public telegram-cli
  (let ((commit "6547c0b21b977b327b3c5e8142963f4bc246187a"))
    (package
      (name "telegram-cli")
      (version "1.3.1")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/vysheng/tg")
                        (recursive? #t)
                       (commit commit)))
                (sha256
                  (base32
                    "07sss5cnw2ygd7mp8f5532lmj7qm6ywqf4cjaq5g13i8igzqzwzj"))))
      (build-system gnu-build-system)
      (arguments
        '(#:tests? #f
          #:phases
          (modify-phases %standard-phases
            (add-before 'build 'hack
              (lambda _
                (substitute* "Makefile"
                  (("-Werror") ""))
                #t))
            (replace 'install
              (lambda* (#:key inputs outputs #:allow-other-keys)
                (let* ((out (assoc-ref outputs "out"))
                       (bin (string-append out "/bin/")))
                  (mkdir-p bin)
                  (copy-recursively "bin" bin)
                  #t))))))
      (native-inputs
        `(("pkg-config" ,pkg-config)))
      (inputs
        `(("libconfig" ,libconfig)
          ("lua" ,lua)
          ("zlib" ,zlib)
          ("libevent" ,libevent)
          ("jansson" ,jansson)
          ("readline" ,readline)
          ("python" ,python)
          ("libressl" ,libressl)))
      (synopsis "")
      (description "")
      (home-page "")
      (license #f))))
