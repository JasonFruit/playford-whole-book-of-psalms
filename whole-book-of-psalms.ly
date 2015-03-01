\version "2.14.2"

staffSize = 26
sizeFactor = #1.5

#(set! paper-alist (cons '("6x9" . (cons (* 6 in) (* 9 in))) paper-alist))
#(set-global-staff-size (/ staffSize sizeFactor))

\paper  {
  #(set-paper-size "6x9")
  #(define fonts
    (set-global-fonts
     #:music "gutenberg1939"
     #:brace "gutenberg1939"
     #:factor (/ staff-height pt 20)
     #:roman "IM Fell English" 
     #:sans "IM Fell English"
     #:typewriter "IM Fell English SC"))
  print-all-headers = ##t
  print-page-number = ##t
  top-margin = 0.5 \in
  left-margin = 0.75 \in
  right-margin = 0.25 \in
  bottom-margin = 0.5 \in
}

\header {
  tagline = ""
}

\include "psalm-001.ly"
\include "cambridge.ly"
\include "psalm-003.ly"
\include "oxford.ly"
\include "london.ly"
\include "bristol.ly"
\include "worcester.ly"
\include "st-marys.ly"
\include "gloucester.ly"
\include "glastenbury.ly"
\include "canterbury.ly"
\include "rochester.ly"
\include "york.ly"
\include "martyrs.ly"
\include "windsor.ly"
\include "psalm-018.ly"
\include "st-james.ly"
\include "hereford.ly"
\include "psalm-021.ly"
\include "salisbury.ly"
\include "southwell.ly"
\include "norwich.ly"
\include "psalm-030.ly"
\include "lichfield.ly"
\include "psalm-033.ly"
\include "psalm-038.ly"
\include "westminster.ly"
\include "psalm-041.ly"
\include "st-davids.ly"
\include "peterborough.ly"
\include "st-peters.ly"
\include "psalm-046.ly"
\include "london-new.ly"
\include "exeter.ly"
\include "psalm-050.ly"

\include "te-deum.ly"