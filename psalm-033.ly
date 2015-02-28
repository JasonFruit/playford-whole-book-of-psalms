tuneTitle = "Psalm 33"
tuneMeter = "C.M.D."
author = ""
voiceFontSize = 0

cantusMusic = {
  \clef treble
  \key g \minor
  \autoBeamOff
  \time 4/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    a1 bes2 c d c bes bes \time 2/2 a1 \bar "||"
    \time 4/2 d2 f1 e2 d d c1 \bar "||"
    a1 c2 bes a d c bes \time 2/2 a1 \bar "||"
    \time 4/2 f1 g2 a bes c f,1 \bar "||"
    g1 d'2 bes f' d c c \time 2/2 bes1 \bar "||"
    \time 4/2 bes1 g2 a bes c d1 \bar "||"
    bes1 f2 g a bes g d' \time 2/2 bes1 \bar "||"
    \time 4/2 g2 c1 bes2 \time 6/2 a a g\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key g \minor
  \autoBeamOff
  \time 4/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    fis1 g2 a bes a g g fis1
    a2 d1 c2 c b c1
    f,1 f2 d' c bes a g fis1
    a1 c2 f, f e f1
    bes1 bes2 g bes bes bes a bes1
    g1 bes2 a g a fis1
    g1 a2 bes c d bes bes g1
    g2 a1 g2 g fis g\breve
  }
}

bassusMusic = {
  \clef bass
  \key g \minor
  \autoBeamOff
  \time 4/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    d1 g2 f bes, f' g g, d'1
    a2 b1 c2 f g c,1
    d1 a2 bes f' d f g d1
    f1 e2 f d c f1
    es1 bes2 es d es f f, bes1
    g1 g'2 f es es d1
    g1 d2 bes f' d es bes es1
    es2 c1 g2 d' d g,\breve
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
