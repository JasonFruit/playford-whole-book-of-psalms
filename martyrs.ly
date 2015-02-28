tuneTitle = "Martyrs Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

cantusMusic = {
  \clef treble
  \key e \minor
  \autoBeamOff
  \time 6/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    \partial 1.
    r1 e2 g1 e2 b'1 g2 fis1 e2 b'1 \bar "||"
    b2 d1 b2 cis1 e2 \time 3/2 b1 \bar "||"
    b2 \time 6/2 d1 a2 b1 g2 fis1 e2 b'1 \bar "||"
    d2 cis1 a2 cis2 b1 e,\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key e \minor
  \autoBeamOff
  \time 6/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    r1 b2 b1 a2 g1 c2 b1 e2 dis1
    fis,2 fis1 g2 a1 g2 fis1
    fis2 fis1 fis2 g1 c2 b1 e2 dis1
    fis,2 a1 e2 e dis1 e\breve
  }
}

bassusMusic = {
  \clef bass
  \key e \minor
  \autoBeamOff
  \time 6/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    r1 e2 e1 c2 b1 e2 d1 c2 b1
    b2 b1 e2 a,1 e2 b'1
    b2 b1 d2 g,1 a2 b1 c2 b1
    b2 a1 c2 a b1 e\breve
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
