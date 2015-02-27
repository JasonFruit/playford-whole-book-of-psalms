tuneTitle = "Psalm 1"
tuneMeter = "C.M.D."
author = ""
pageCount = 1
voiceFontSize = 0

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
    instrument = \markup { \typewriter { #(string-append tuneTitle ". " tuneMeter) } }
    tagline = ""
  }
  <<
    \new StaffGroup {
      <<
	\new Staff = "cantus" {
	  <<
	    \new Voice = "one" { \stemUp \slurUp \tieUp \cantusMusic }
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