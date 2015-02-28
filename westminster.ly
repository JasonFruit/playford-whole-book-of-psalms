tuneTitle = "Westminster Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

cantusMusic = {
  \clef treble
  \key g \major
  \autoBeamOff
  \time 4/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    g1 g2 g a b c a \time 2/2 d1 \bar "||"
    \time 4/2 g,1 b2 d d cis d1 \bar "||"
    b1 c2 d e d c b \time 2/2 a1 \bar "||"
    \time 4/2 d1 c2 b \time 6/2 a a g\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key g \major
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    b1 b2 g fis g a c b1
    b1 d2 c b a fis1
    g1 a2 b c b a g fis1
    b1 a2 g g fis g\breve
  }
}

bassusMusic = {
  \clef bass
  \key g \major
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    g1 g2 e d b a a g1
    g1 g'2 fis g a d,1
    g1 e2 d c d e4( fis) g2 d1
    b1 c2 g' c, d g,\breve
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
