(define-module (levy packages smalltalk)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages smalltalk))

(define-public smalltalk-custom
  (package
   (inherit smalltalk)
   (name "smalltalk-custom")
   (arguments
    (substitute-keyword-arguments (package-arguments smalltalk)
                                  ((#:phases phases)
                                   `(modify-phases ,phases
                                                   (delete 'check)))))))
