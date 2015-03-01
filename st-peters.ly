tuneTitle = "St. Peter's Tune"
tuneMeter = "S.M."
author = ""
voiceFontSize = 0

cantusMusic = {
  \clef treble
  \key g \major
  \autoBeamOff
  \time 6/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    \partial 1.
    r1 g2 b1 c2 d1 b2 \time 3/2 b1 \bar "||"
    b2 \time 6/2 a1 d2 d cis1 \time 3/2 d1 \bar "||"
    b2 \time 6/2 e1 d2 c1 b2 a1 g2 fis1 \bar "||"
    b2 c1 b2 b a1 g\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key g \major
  \autoBeamOff
  \time 6/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    r1 g2 g1 g2 a1 g2 g1
    b2 d1 fis2 e e1 d1
    g,2 g1 b2 c1 d2 e1 cis2 d1
    b2 a1 g2 g fis1 g\breve
  }
}

bassusMusic = {
  \clef bass
  \key g \major
  \autoBeamOff
  \time 6/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    r1 g2 g1 e2 fis1 g2 g,1
    g'2 fis1 d2 a' a,1 d1
    g2 c,1 g2 a1 b2 c1 a2 d1
    g2 fis1 g2 c, d1 g,\breve
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
