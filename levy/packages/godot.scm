(define-module (levy packages godot)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages game-development))

(define-public godot-3.1
  (package
    (inherit godot)
    (name "godot-3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/godotengine/godot")
                     (commit "320f49f204cfbf9b480fe62aaa7718afb74920a5")))
              (sha256
                (base32
                  "1z37znqzbn0x8s04pb9dxzni9jzl8m59nfrr14vypww42f9l5i7i"))))))

