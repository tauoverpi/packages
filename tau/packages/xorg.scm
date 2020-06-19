(define-module (tau packages xorg)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages xorg))

(define-public carpalx
  (package
    (name "carpalx")
    (version "2011")
    (source (origin
              (method url-fetch)
              (uri "http://www.khjk.org/log/2011/jan/carpalx.xkb")
              (sha256
                (base32
                  "1n964pd313maczs81dl3ri7i4vxfyhqj1bss9nl87aiwfw93pcvv"))))
    (build-system copy-build-system)
    (arguments
     `(#:install-plan
       '(("carpalx.xkb" "share/X11/xkb/symbols/")
         ("symbols.dir" "share/X11/xkb/"))
       #:phases
       (modify-phases %standard-phases
         (replace 'unpack
           (lambda* (#:key source #:allow-other-keys)
             (call-with-output-file "symbols.dir"
               (lambda (port)
                 (format port "
-dp----- a------- carpalx(qgmlwb)
--p----- a------- carpalx(qgmlwy)
--p----- a------- carpalx(qfmlwy)
--p----- a------- carpalx(qwkrfy)
--p----- a------- carpalx(qwyrfm)
--p----- a------- carpalx(tnwmlc)
")))
             (copy-file source  "carpalx.xkb"))))))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))


(define-public catwm
  (let ((commit "0d9294b29dee440099b9290adb290dd36b9ec5f9"))
    (package
      (name "catwm")
      (version "0.0.0")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/pyknite/catwm")
                       (commit commit)))
                (sha256
                  (base32
                    "1sdcgz05y1fjk8dqskppv2pspqzsjfm8v6gyr9jrcisspsrk15gp"))))
      (build-system gnu-build-system)
      (arguments
       `(#:phases (modify-phases %standard-phases (delete 'configure))
         #:tests? #f ; No tests
         #:make-flags (list "CC=gcc"
                            (string-append "PREFIX=" %output))))
      (inputs
       `(("libx11" ,libx11)))
      (home-page "")
      (synopsis "")
      (description "")
      (license #f))))
