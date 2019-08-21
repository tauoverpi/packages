(define-module (levy packages openscad)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages pkg-config))

(define opencsg
  (package
    (name "opencsg")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.opencsg.org/OpenCSG-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1ysazynm759gnw1rdhn9xw9nixnzrlzrc462340a6iif79fyqlnr"))))
    (build-system gnu-build-system)
    (arguments
      '(#:parallel-build? #f
        #:tests? #f
        #:phases
        (modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (substitute* "Makefile"
                (("sub-example-[a-z0-9_]*") ""))
              (substitute* "src/Makefile"
                (("/usr/local") (assoc-ref outputs "out")))
              #t)))))
    (inputs
      `(("glew" ,glew)
        ("freeglut" ,freeglut)
        ("mesa" ,mesa)))
    (description "")
    (synopsis "")
    (home-page "")
    (license #f)))

(define-public openscad
  (package
    (name "openscad")
    (version "2019.05")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/openscad/openscad/archive/openscad-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0jzlsg8gw98839f1nhb6c7w97fjs33vj81djxvahs2xx9hvb1xhb"))))
    (build-system cmake-build-system)
    (arguments
      '(#:tests? #f
        #:parallel-build? #f))
    (native-inputs
      `(("pkg-config" ,pkg-config)
        ("qttools" ,qttools)
        ("extra-cmake-modules" ,extra-cmake-modules)
        ("boost" ,boost)))
    (inputs
      `(("glew" ,glew)
        ("eigen" ,eigen)
        ("double-conversion" ,double-conversion)
        ("libzip" ,libzip)
        ("flex" ,flex)
        ("harfbuzz" ,harfbuzz)
        ("libxml2" ,libxml2)
        ("gmp" ,gmp)
        ("qtbase" ,qtbase)
        ("qtmultimedia" ,qtmultimedia)
        ("bison" ,bison)
        ("cgal" ,cgal)
        ("opencsg" ,opencsg)
        ("qscintilla" ,qscintilla)
        ("fontconfig" ,fontconfig)
        ("freetype" ,freetype)
        ("mpfr" ,mpfr)))
    (description "")
    (synopsis "")
    (home-page "")
    (license #f)))

openscad
