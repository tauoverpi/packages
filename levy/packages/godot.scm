(define-module (levy packages godot)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages pkg-config)
  #:use-module (srfi srfi-1))

(define-public godot-3.1.1
  (package
    (inherit godot)
    (name "godot")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                     "https://downloads.tuxfamily.org/godotengine/"
                     version
                     "/godot-"
                     version
                     "-stable.tar.xz"))
              (sha256
                (base32
                  "098av6h00mwpv1l6ld98xjdd8khq3v6psjna1l5q9wsfa1paf6x2"))))))
