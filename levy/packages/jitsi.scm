(define-module (levy packages jitsi)
  #:use-module (guix build-system ant)
  #:use-module (guix download)
  #:use-module (guix packages))

(define-public jitsi
  (package
   (name "jitsi")
   (version "2.10.5550")
   (source (origin
            (method url-fetch/zipbomb)
            (uri (string-append "https://download.jitsi.org/jitsi/src/jitsi-src-"
                                version
                                ".zip"))
            (sha256
             (base32
              "11vjchc3dnzj55x7c62wsm6masvwmij1ifkds917r1qvil1nzz6d"))))
   (build-system ant-build-system)
   (synopsis "")
   (description "")
   (home-page "")
   (license #f)))
