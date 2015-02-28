tuneTitle = "Southwell Tune"
tuneMeter = "S.M."
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
    a2 c1 a2 b b a1 \bar "||"
    c2 d1 c2 b a b1 \bar "||"
    g1 a2 b c c b a \time 2/2 gis1 \bar "||"
    \time 4/2 e1 fis2 a \time 6/2 d b a\breve \bar "|."
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
    c2 a1 a2 a gis a1
    a2 b1 e2 d c b1
    b1 c2 d e e d c b1
    c1 b2 a a gis a\breve
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
    a2 a1 f2 d e a,1
    a'2 g1 c,2 g' a e1
    e1 a2 g c, c g' a e1
    c1 d2 c b e a,\breve
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
