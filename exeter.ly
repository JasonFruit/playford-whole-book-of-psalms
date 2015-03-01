tuneTitle = "Exeter Tune"
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
    f1 c'2 a bes c d d \time 2/2 c1 \bar "||"
    \time 4/2 c1 f2 d e e d1 \bar "||"
    f1 e2 c d a c b \time 2/2 c1 \bar "||"
    \time 4/2 c1 a2 f \time 6/2 g g f\breve \bar "|."
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
    a1 g2 f g a bes bes a1
    a1 a2 d d cis d1
    a1 g2 a b c d d c1
    a1 c2 f, f e f\breve
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
    f1 e2 f d c bes bes f'1
    f1 d2 bes' g a d,1
    d1 e2 f d f e4( f) g2 c,1
    f1 f2 d bes c f,\breve
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
