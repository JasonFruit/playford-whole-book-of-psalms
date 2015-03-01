tuneTitle = "London New Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

cantusMusic = {
  \clef treble
  \key f \major
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    f1 c'2 a f' c d f \time 2/2 e1 \bar "||"
    \time 4/2 c1 f2 a, bes g f1 \bar "||"
    c'1 f2 d e c d d \time 2/2 c1 \bar "||"
    \time 4/2 a1 c2 f \time 6/2 a, g f\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key f \major
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    a1 g2 f a a f a g1
    a1 bes2 f f e f1
    a1 a2 b c g a b c1
    c1 g2 a f e f\breve
  }
}

bassusMusic = {
  \clef bass
  \key f \major
  \autoBeamOff
  \time 4/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    f1 e2 f d a bes f c'1
    f1 d2 f bes, c f,1
    f'1 d2 g c, e f g c,1
    f1 e2 d f c f,\breve
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
