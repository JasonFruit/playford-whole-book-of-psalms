tuneTitle = "Windsor Tune"
tuneMeter = "C.M."
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
    a1 a2 b c b a a \time 2/2 gis1 \bar "||"
    \time 4/2 c2 e1 d2 c b c1 \bar "||"
    c2 e1 d2 c b a a \time 2/2 gis1 \bar "||"
    \time 4/2 c2 b1 a2 \time 6/2 a gis a\breve \bar "|."
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
    c1 c2 d e d c c b1
    c2 c1 b2 e d c1
    g2 a1 b2 a e' d c b1
    e2 d1 c2 b b a\breve
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
    a1 a2 g c, g' a a, e'1
    c2 c1 g'2 e g c,1
    c2 c1 g'2 a e f d e1
    c2 g'1 a2 d, e a,\breve
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
