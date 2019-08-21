(define-module (levy packages mercury)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages))

(define-public mercury
  (package
    (name "mercury")
    (version "14.01.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dl.mercurylang.org/release/mercury-srcdist-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "12z8qi3da8q50mcsjsy5bnr4ia6ny5lkxvzy01a3c9blgbgcpxwq"))))
    (build-system gnu-build-system)
    (arguments
      '(#:tests? #f
        #:phases
        (modify-phases %standard-phases
          (add-after 'unpack 'patch
            (lambda _ (substitute*
                        (list "Makefile"
                              "Mmakefile"
                              "scripts/mercury_update_interface.in"
                              "scripts/mercury_config.in"
                              "scripts/mmake.in"
                              "scripts/mmake.sh"
                              "scripts/Mmake.vars.in"
                              "scripts/mdb.in"
                              "scripts/rs6000_hack"
                              "scripts/fullarch"
                              "scripts/mmc.in"
                              "scripts/canonical_grade"
                              "scripts/mprof.in"
                              "scripts/gud.el"
                              "scripts/ml.in"
                              "scripts/canonical_grade.in"
                              "scripts/mdprof.in"
                              "scripts/vpath_find"
                              "scripts/mkfifo_using_mknod.in"
                              "scripts/prepare_install_dir.in"
                              "scripts/ml.sh"
                              "scripts/mprof_merge_runs"
                              "scripts/mtc"
                              "scripts/mgnuc.in"
                              "scripts/c2init.in"
                              "bindist/bindist.Makefile"
                              "boehm_gc/Makefile.dj"
                              "boehm_gc/configure"
                              "boehm_gc/Makefile.direct"
                              "boehm_gc/build_atomic_ops.sh"
                              "boehm_gc/PCR-Makefile"
                              "boehm_gc/libatomic_ops/configure")
                        (("/bin/sh") (which "sh"))
                        (("/bin/pwd") (which "pwd"))
                        (("/bin/rm") (which "rm"))))))))
    (inputs
      `(("texinfo" ,texinfo)
        ("flex" ,flex)
        ("tcsh", tcsh)
        ("bison" ,bison)
        ("readline" ,readline)))
; TBD
;    (outputs `("out" ; the compiler
;               "vim" ; vim plugin
;               ))
    (synopsis "A pure logic programming language")
    (description "Mercury is a logic/functional programming language which combines the
clarity and expressiveness of declarative programming with advanced
static analysis and error detection features.  Its highly optimized
execution algorithm delivers efficiency far in excess of existing logic
programming systems, and close to conventional programming systems.
Mercury addresses the problems of large-scale program development,
allowing modularity, separate compilation, and numerous optimization/time
trade-offs.")
    (home-page "http://mercurylang.org")
    (license gpl2)))

(define mercury-rotd-prepgen
  (package
    (inherit mercury)
    (name "mercury-rotd")
    (version "2019-08-19")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://dl.mercurylang.org/rotd/mercury-srcdist-rotd-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0k3jr6r5f3ny18gi4snc4nny5d7j2iggjaqs0zhpzryvfyvx23l2"))))
    (arguments
      '(#:tests? #f
        #:configure-flags '("--enable-minimal-install")
        #:phases
        (modify-phases %standard-phases
          (add-after 'unpack 'patch
            (lambda _ (substitute*
                        (list "Makefile"
                              "Mmakefile"
                              "scripts/mercury_update_interface.in"
                              "scripts/mercury_config.in"
                              "scripts/mmake.in"
                              "scripts/Mmake.vars.in"
                              "scripts/mdb.in"
                              "scripts/rs6000_hack"
                              "scripts/fullarch"
                              "scripts/mmc.in"
                              "scripts/canonical_grade"
                              "scripts/mprof.in"
                              "scripts/gud.el"
                              "scripts/ml.in"
                              "scripts/canonical_grade.in"
                              "scripts/mdprof.in"
                              "scripts/vpath_find"
                              "scripts/mkfifo_using_mknod.in"
                              "scripts/prepare_install_dir.in"
                              "scripts/mprof_merge_runs"
                              "scripts/mtc"
                              "scripts/mgnuc.in"
                              "scripts/c2init.in"
                              "bindist/bindist.Makefile"
                              "boehm_gc/Makefile.direct"
                              )
                        (("/bin/sh") (which "sh"))
                        (("/bin/pwd") (which "pwd"))
                        (("/bin/rm") (which "rm"))))))))))

(define-public mercury-rotd
  (package
    (inherit mercury-rotd-prepgen)
    (name "mercury-rotd")
    (inputs
      `(("mercury" ,mercury-rotd-prepgen)
        ,@(package-inputs mercury-rotd-prepgen)))

    (arguments
      '(#:tests? #f
        #:configure-flags '("--enable-nogc-grades"
                            "--enable-rbmm-grades"
                            "--enable-stseg-grades"
                            "--enable-erlang-grade")
        #:phases
        (modify-phases %standard-phases
          (add-after 'unpack 'patch
            (lambda _ (substitute*
                        (list "Makefile"
                              "Mmakefile"
                              "scripts/mercury_update_interface.in"
                              "scripts/mercury_config.in"
                              "scripts/mmake.in"
                              "scripts/Mmake.vars.in"
                              "scripts/mdb.in"
                              "scripts/rs6000_hack"
                              "scripts/fullarch"
                              "scripts/mmc.in"
                              "scripts/canonical_grade"
                              "scripts/mprof.in"
                              "scripts/gud.el"
                              "scripts/ml.in"
                              "scripts/canonical_grade.in"
                              "scripts/mdprof.in"
                              "scripts/vpath_find"
                              "scripts/mkfifo_using_mknod.in"
                              "scripts/prepare_install_dir.in"
                              "scripts/mprof_merge_runs"
                              "scripts/mtc"
                              "scripts/mgnuc.in"
                              "scripts/c2init.in"
                              "bindist/bindist.Makefile"
                              "boehm_gc/Makefile.direct")
                        (("/bin/sh") (which "sh"))
                        (("/bin/pwd") (which "pwd"))
                        (("/bin/rm") (which "rm"))))))))))
mercury-rotd
