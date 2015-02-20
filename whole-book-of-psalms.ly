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
  % #(define fonts
  %   (make-pango-font-tree
  %    "IM Fell English" 
  %    "IM Fell English"
  %    "IM Fell English SC"
  %    (/ (/ staffSize sizeFactor) 20)))
  print-all-headers = ##t
  print-page-number = ##t
  top-margin = 0.5 \in
  left-margin = 0.75 \in
  right-margin = 0.25 \in
  bottom-margin = 0.5 \in
}

\header {
  % title = "The Whole Book of Psalms"
  % subtitle = "John Playford"
  tagline = ""
}

\include "psalm-001.ly"
\include "psalm-002.ly"
\include "psalm-003.ly"
\include "psalm-004.ly"
\include "psalm-005.ly"
\include "psalm-006.ly"
\include "psalm-007.ly"
\include "psalm-008.ly"