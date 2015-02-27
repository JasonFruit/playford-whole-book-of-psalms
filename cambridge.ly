tuneTitle = "Cambridge Tune"
tuneMeter = "C.M."
author = ""
pageCount = 1
voiceFontSize = 0

cantusMusic = {
  \clef treble
  \key c \major
  \autoBeamOff
  \time 6/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    \partial 1.
    r1 a2 c1 a2 b1 a2 fis gis1 a \bar "||"
    c2 b1 c2 b1 a2 b1. \bar "||"
    b2 b c d1 c2 b1 a2 \time 3/2 gis1 \bar "||"
    c2 \time 6/2 b1 a2 a gis1 a\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key c \major
  \autoBeamOff
  \time 6/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    r1 c2 e1 d2 e1 e2 d b1 cis
    c2 d1 e2 d1 c2 b1.
    gis2 gis a b1 e2 d1 c2 b1
    e2 d1 c2 b b1 a\breve
  }
}

bassusMusic = {
  \clef bass
  \key c \major
  \autoBeamOff
  \time 6/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    r1 a2 a1 f2 e1 c2 d e1 a,
    a'2 g1 c,2 g'1 a2 e1.
    e2 e a g1 c,2 g'1 a2 e1
    c2 g'1 a2 d, e1 a,\breve
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

