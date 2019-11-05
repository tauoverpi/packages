(define-module (levy packages godot)
  #:use-module (guix packages)
  #:use-module (levy packages mono)
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

;(define-public godot-mono-3.1.1
;  (package
;    (inherit godot-3.1.1)
;    (name "godot-mono")
;    (arguments
;      (substitute-keyword-arguments (package-arguments godot-3.1.1)
;        ((#:phases phases)
;         `(modify-phases ,phases
;            (add-after 'unpack 'mono-glue
;              (lambda* (#:key inputs outputs #:allow-other-keys)
;                (invoke "godot" "--generate-mono-glue modules/mono/glue")))))
;        ((#:scons-flags flags)
;         `(append ,flags
;                  (list "module_mono_enables=yes"
;                        "no_editor_splash=yes"
;                        "mono_glue=yes")))))
;    (native-inputs
;      `(("godot" ,(package/inherit godot-3.1.1
;                    (inputs
;                      `(("mono" ,mono-6.0.0.319)
;                        ,@(package-inputs godot-3.1.1)))
;                    (arguments
;                      (substitute-keyword-arguments (package-arguments godot-3.1.1)
;                        ((#:phases phases)
;                         `(modify-phases ,phases
;                             (replace 'install
;                               (lambda* (#:key outputs #:allow-other-keys)
;                                 (let* ((out (assoc-ref outputs "out"))
;                                        (bin (string-append out "/bin")))
;                                   (with-directory-excursion "bin"
;                                     (if (file-exists? "godot.x11.tools.64")
;                                         (rename-file "godot.x11.tools.64" "godot")
;                                         (rename-file "godot.x11.tools.32" "godot"))
;                                     (install-file "godot" bin))
;                                   #t)))
;                        ((#:scons-flags flags)
;                         (append (delete "platform=x11" flags)
;                                 (list "tools=yes"
;                                       "platform=server"
;                                       "module_mono_enables=yes"
;                                       "mono_glue=no")))))))
;        ,@(package-native-inputs godot-3.1.1)))))

