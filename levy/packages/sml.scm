(define-module (levy packages sml)
  #:use-module (gnu packages sml)
  #:use-module (gnu packages multiprecision)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu))

(define (smlnj-file version filename hash)
  (origin
    (method url-fetch)
    (uri (string-append "http://smlnj.cs.uchicago.edu/dist/working/" version "/" filename))
    (sha256
      (base32
        hash))))

(define-public smlnj ; 32 bit only
  (package
    (name "smlnj")
    (version "110.92")
    (source (plain-file "" ""))
    (build-system gnu-build-system)
    (arguments
      '(#:phases
        (modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key inputs #:allow-other-keys)
              (for-each
                (lambda (file)
                  (invoke "tar" "xvf" (assoc-ref inputs file)))
                (list "config"
                      "cm"
                      "compiler"
                      "runtime"
                      "system"
                      "MLRISC"
                      "smlnj-lib"
                      "old-basis"
                      "ckit"
                      "nlffi"
                      "cml"
                      "eXene"
                      "ml-lpt"
                      "ml-lex"
                      "ml-yacc"
                      "ml-burg"
                      "pgraph"
                      "trace-debug-profile"
                      "heap2asm"
                      "smlnj-c"))
              #t))
          (delete 'configure)
          (replace 'patch-source-shebangs
            (lambda _
              (substitute* "config/install.sh" (("/bin/sh") (which "sh")))))
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "config/chk-global-names.sh"
                (("CC=.*") "CC=gcc"))
              (substitute* "config/unpack"
                (("# Now do it:") "exit 0"))
              (substitute* "config/_arch-n-opsys"
                (("uname") (which "uname")))
              (invoke "sh" "config/install.sh"))))))
    (native-inputs
      `(("cm" ,(smlnj-file version "cm.tgz" "1d3nlri8i0h6zw6168awbr34k4qglw98fjvvq9pq43z9cgadq9sx"))
        ("smlnj-c" ,(smlnj-file version "smlnj-c.tgz" "0s0w0ciz9sj9364p9nj2k8j5diyicfw6kw756vci1gbh152p3f22"))
        ("config" ,(smlnj-file version "config.tgz" "1lql2binslxrwribzibkkxzxasfba0z96fjwrvfc9i0xsw9077cs"))
        ("compiler" ,(smlnj-file version "compiler.tgz" "0gxdq2bvmzbwpj5iqigcv3j8qi2wk8ww5ywklnlvrvvhpiv0qixz"))
        ("runtime" ,(smlnj-file version "runtime.tgz" "153fxq3606hrfva6fsszkh4fkii0gscxszawc9fh7jg1157jx60z"))
        ("system" ,(smlnj-file version "system.tgz" "1gpwq3bal8pvqxzdm9a5mls30y6m4nkphh3ifhdfx6hx3ph2kh7n"))
        ("MLRISC" ,(smlnj-file version "MLRISC.tgz" "0q52k0xc9rg7rik778gfsfrgkdhsxv3ngjmq0riwrxcsx0ppliyp"))
        ("smlnj-lib" ,(smlnj-file version "smlnj-lib.tgz" "1z2vm64vicf8cm5h00ma8xnvsnanp6bir1g7bk97kmirvpbnvn1y"))
        ("old-basis" ,(smlnj-file version "old-basis.tgz" "1640z2nql0calg79k5r6dpfnz6kwxn4l633d93sdcza2f944gs19"))
        ("ckit" ,(smlnj-file version "ckit.tgz" "00vzsgd72x3vi9ar325gh3pn2k6crfg3pdz4x2nr9akgyvkifzxm"))
        ("nlffi" ,(smlnj-file version "nlffi.tgz" "1npvwy22bpxa6mvdjpllj9v1lwbdm0rnkad26xxkjvm2iw7b87gq"))
        ("cml" ,(smlnj-file version "cml.tgz" "0vv74yjvpy8cnngqra4j0fr712nnxms02kk9dzda431r0gfc74n4"))
        ("eXene" ,(smlnj-file version "eXene.tgz" "131k2nmpm9vr195bqnl9h7azlwqvnyrkgpp1da3q0h7lwp46kq1z"))
        ("ml-lpt" ,(smlnj-file version "ml-lpt.tgz" "0lia7xaqjwaz25mdb4h60j0dmzz368bpra7jnlc90mq1d3v69vww"))
        ("ml-lex" ,(smlnj-file version "ml-lex.tgz" "0gz58jm0lb4vmy7hwd7hnqgmv9pmhmy4576p3ffa4x4f8ppizwyy"))
        ("ml-yacc" ,(smlnj-file version "ml-yacc.tgz" "05w377ykj7q4ayvrxymfv2lkcffknnd2vqzrx0gfzppxrih1casi"))
        ("ml-burg" ,(smlnj-file version "ml-burg.tgz" "1maiv0wvnzc77fks1pmzykgm8sp91mfv12lpfak949gc5a2wk4mr"))
        ("pgraph" ,(smlnj-file version "pgraph.tgz" "1i50r62vhn3h6wmx05g0axybr9caf7adlizikh4nd5brdr5ja6l5"))
        ("trace-debug-profile" ,(smlnj-file version "trace-debug-profile.tgz" "12103xv810nqxq4ywls5qwf8gg3r38acznyrxj01a99q55d9gq12"))
        ("heap2asm" ,(smlnj-file version "heap2asm.tgz" "0g2sq9yf7nvjiiggvh1ciqrgz9v2hq5cpld7qgkl0xrb5715697y"))))
    (description "")
    (synopsis "")
    (home-page "")
    (license #f)))

(define-public mlton ; need bootstrap
  (package
    (name "mlton")
    (version "20180207")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/MLton/mlton/archive/on-"
                                  version
                                  "-release.tar.gz"))
              (sha256
                (base32
                  "1l1flhxx8hr4n3mf87m02231r3m2f3sh28zfxma3g41jscmj21zi"))))
    (build-system gnu-build-system)
    (arguments
      '(#:make-flags (list "CC=gcc"
                           "COMPILE_ARGS=\"-codegen c -cc-opt '-fPIC'\""
                           (string-append "PREFIX=" %output))
        #:phases
        (modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs
      `(("polyml" ,polyml)))
    (inputs
      `(("gmp" ,gmp)))
    (description "")
    (synopsis "")
    (home-page "")
    (license #f)))
