tuneTitle = "Psalm 18"
tuneMeter = "C.M.D."
author = ""
voiceFontSize = 0

cantusMusic = {
  \clef treble
  \key a \minor
  \autoBeamOff
  \time 4/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    a1 a2 gis a c b b \time 2/2 e,1 \bar "||"
    \time 4/2 e1 a2 c b b a1 \bar "||"
    e'1 d2 c b c b a \time 2/2 gis1 \bar "||"
    \time 4/2 c1 b2 a a gis a1 \bar "||"
    a1 c2 b a e' e dis \time 2/2 e1 \bar "||"
    e1 d2 c b a gis1 \bar "||"
    c1 g2 a b c d c \time 2/2 b1 \bar "||"
    \time 4/2 c1 b2 a \time 6/2 a gis a\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key a \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    c1 c2 b e e e dis e1
    g,1 e2 a a gis a1
    c1 b2 a gis a d c b1
    a1 gis2 c a b a1
    e1 a2 gis a a g fis e1
    c'1 b2 a gis a b1
    e1 c2 d b a g fis g1
    a1 gis2 c b b a\breve
  }
}

bassusMusic = {
  \clef bass
  \key a \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    a1 a2 e c a b b e1
    e1 c2 a d e a,1
    c1 g'2 a e a, gis a e'1
    a,1 e'2 c d e a,1
    a1 a2 e' f c a b e1
    c1 g2 a e' f e1
    c1 e2 f g c, b a g1
    a1 e'2 c d e a,\breve
  }
}

\score
{
  \header {
    poet = \markup { \typewriter { \author } }
    instrument = \markup { \typewriter { #(string-append tuneTitle ". ") }
			   \tuneMeter }
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
