tuneTitle = "Psalm 30"
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
    d1 d2 cis d g, bes a \time 2/2 g1 \bar "||"
    \time 4/2 d'2 f1 d2 c bes d1 \bar "||"
    d1 c2 bes a bes g a \time 2/2 fis1 \bar "||"
    \time 4/2 bes1 c2 d c c bes1 \bar "||"
    g1 d'2 c bes a bes c \time 2/2 d1 \bar "||"
    \time 4/2 d2 c1 bes2 a g a1 \bar "||"
    d1 f2 g c, c d bes \time 2/2 c1 \bar "||"
    \time 4/2 c2 d1 g,2 \time 6/2 bes a g\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key g \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    bes1 a2 g fis g g fis g1
    bes2 c1 bes2 a g fis1
    bes1 a2 bes c d bes c a1
    bes1 a2 bes bes a bes1
    bes1 bes2 a g fis g g fis1
    bes2 a1 g2 fis g fis1
    bes1 a2 c a g fis g a1
    a2 bes1 c2 g fis g\breve
  }
}

bassusMusic = {
  \clef bass
  \key g \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    g1 f2 e d es c d g,1
    g'2 a1 bes2 f g d1
    bes1 f'2 g f d es c d1
    bes1 f'2 d es f bes,1
    es1 bes2 f' g d g es d1
    bes2 f'1 g2 d g, d'1
    bes1 d2 es f es d g f1
    f2 bes,1 es2 c d g,\breve
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
