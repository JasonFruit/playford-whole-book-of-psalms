tuneTitle = "Canterbury Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

cantusMusic = {
  \clef treble
  \key a \major
  \autoBeamOff
  \time 4/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    a2 cis1 b2 cis a b cis \time 2/2 d1 \bar "||"
    \time 4/2 d2 cis1 b2 a cis b1 \bar "||"
    b2 d1 cis2 b a d4( cis) b2 \time 2/2 a1 \bar "||"
    \time 4/2 cis1 b2 a \time 6/2 d4( cis) b2 a\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key a \major
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    a2 a1 gis2 a d e e d1
    fis,2 e1 gis2 a a gis1
    gis2 gis1 a2 gis fis a gis a1
    a1 gis2 fis a gis a\breve
  }
}

bassusMusic = {
  \clef bass
  \key a \major
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    a2 a1 e2 a fis g a d,1
    d2 a'1 e2 fis d e1
    e2 e1 a2 e fis d e a,1
    a1 e'2 fis d e a,\breve
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
