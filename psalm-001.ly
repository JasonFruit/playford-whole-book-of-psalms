tuneTitle = "Psalm 1"
titleNote = "Or to York Tune"
tuneMeter = "C.M.D."
author = ""
pageCount = 1
voiceFontSize = 0

stanzaOne = \lyricmode {
  The man is blest that hath not lent
  to ill ad- vice his ear:
  Nor led his life as sin- ners do,
  nor sat in scorn- ers' chair.
  But in the law of God the Lord
  doth set his whole de- light:
  And in that law doth ex- er- cise
  him- self both day and night.
}

cantusMusic = {
  \clef treble
  \key e \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    e2 g1 e2 a g c c \time 2/2 b1 \bar "||"
    \time 4/2 a2 b1 e,2 g fis e1 \bar "||"
    b'1 b2 b a g c b \time 2/2 a1 \bar "||"
    \time 4/2 a2 d1 g,2 b a g1 \bar "||"
    g1 d2 e fis g a c \time 2/2 b1 \bar "||"
    \time 4/2 e1 d2 b c c b1 \bar "||"
    d1 g,2 a b d c c \time 2/2 b1 \bar "||"
    \time 4/2 e,2 a1 g2 fis a e1 \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key e \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    b2 b1 b2 e, g g fis g1
    fis2 g1 a2 e dis e1
    g1 d'2 d d c e, g fis1
    fis2 g1 g2 g fis g1
    b1 d2 b a g g fis g1
    g1 fis2 gis e a gis1
    b1 b2 d d g, g fis g1
    g2 fis1 e2 e dis e1
  }
}

bassusMusic = {
  \clef bass
  \key e \minor
  \autoBeamOff
  \time 4/2
  \relative c {
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    e2 e1 d2 c b a a g1
    d'2 b1 c2 a b e1
    g1 g2 g d e c g d'1
    d2 b1 e2 c d g,1
    g1 b2 c d b a a g1
    c1 d2 e c a e'1
    b1 e2 fis g b, c a g1
    c2 a1 e'2 a, b e1
  }
}



\score
{
  \header {
    poet = \markup { \typewriter { \author } }
    instrument = \markup { \typewriter { #(string-append tuneTitle ". ") }
			   \tuneMeter }
    composer = \markup { \typewriter { \titleNote } }
    tagline = ""
  }
  <<
    \new StaffGroup {
      <<
	\new Staff = "cantus" {
	  <<
	    \new Voice = "one" { \stemUp \slurUp \tieUp \cantusMusic }
            \new Lyrics \lyricsto "one" \stanzaOne
	  >>
	}
	\new Staff = "medius" {
	  <<
	    \new Voice = "two" { \stemDown \slurDown \tieDown \mediusMusic }
	  >>
	}
	\new Staff = "bassus" {
	  <<
	    \new  Voice = "four" { \stemDown \slurDown \tieDown \bassusMusic }
	  >>
	}
      >>
    }
    
  >>

  \layout {
    \context {
      \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
    }
    \context {
      \Lyrics
      \override LyricText #'font-size = #-1
    }
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
    indent = 0 \cm
  }
  \midi { }
}

\markup {
  \small {
    \column {
      \line {
	\bold { "3. " }
	\wordwrap-string #"
  He shall be like a tree that is

  planted the rivers nigh,

  Which in due season bringeth forth

  its fruit abundantly;"
      }
      \vspace #0.6
      \line {
	\bold { "4. " }
	\wordwrap-string #"
  Whose leaf shall never fade nor fall,

  but flourishing shall stand:

  E'en so all things shall prosper well

  that this man takes in hand."
      }
      \vspace #0.6
      \line {
	\bold { "5. " }
	\wordwrap-string #"
  As for ungodly men, with them

  it shall be nothing so;

  But as the chaff, which by the wind

  is driven to and fro."
      }
    }
    \hspace #3
    \column {
      \line {
	\bold { "6. " }
	\wordwrap-string #"
  Therefore the wicked men shall not

  in judgment stand upright,

  Nor in th' assembly of the just

  shall sinners come in sight."
      }
      \vspace #0.6
      \line {
	\bold { "7. " }
	\wordwrap-string #"
  For why? The way of godly men

  unto the Lord is known:

  Whereas the way of wicked men

  shall quite be overthrown."
      }
      \vspace #0.6
      \line {
	\hspace #2.4
	\italic {
	  \wordwrap-string #"
To Father, Son, and Holy Ghost,

all glory be therefore:

As in beginning was, is now,

and shall be evermore."
	}
      }
      \vspace #1.4
    }
  }
}