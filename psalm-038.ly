tuneTitle = "Psalm 38"
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
    g2 d'1 c2 bes g bes a \time 2/2 g1 \bar "||"
    \time 4/2 g2 c1 f,2 a g f1 \bar "||"
    f2 bes1 a2 bes c d es \time 2/2 d1 \bar "||"
    \time 4/2 g,2 c1 bes2 a a g1 \bar "||"

    g1 g2 f bes g a a \time 2/2 g1 \bar "||"
    \time 4/2 d'1 c2 bes c c bes1 \bar "||"
    bes1 es2 es d g, c bes \time 2/2 a1 \bar "||"
    \time 4/2 fis1 g2 bes \time 6/2 a a g\breve \bar "|."
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
    bes2 bes1 a2 g g g fis g1
    e2 f1 f2 f e f1
    a2 d1 c2 d es d c b1
    bes2 a1 g2 g fis g1
    bes1 bes2 c d c g fis g1
    bes1 a2 bes bes a bes1
    g1 g2 a bes c a g fis1
    a1 bes2 g g fis g\breve
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
    g2 bes,1 c2 d es c d g,1
    c2 a1 d2 bes c f,1
    f'2 bes,1 f'2 d c b c g1
    g'2 fis1 g2 c, d g,1
    g1 bes2 a g es' c d g,1
    bes1 f'2 g f f, bes1
    es1 c2 c g' es c g d'1
    d1 bes2 es c d g,\breve
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
