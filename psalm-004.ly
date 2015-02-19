tuneTitle = "Psalm 4"
titleNote = "Oxford Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

stanzaOne = \lyricmode {
  O God that art my right- eous- ness,
  Lord hear me when I call:
  Thou hast set me at li- ber- ty,
  when I was bound in thrall.
}

cantusMusic = {
  \clef treble
  \key a \minor
  \autoBeamOff
  \time 6/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    \partial 1.
    r1 gis2 gis1 gis2 a1 a2 b1 d2 b1 \bar "||"
    gis2 gis1 gis2 a1 b2 \time 3/2 c1 \bar "||" \break
    b2 \time 6/2 d1 b2 c1 a2 gis1 a2 gis1 \bar "||"
    c2 b1 a2 a gis1 a\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key a \minor
  \autoBeamOff
  \time 6/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    r1 b2 b1 b2 c1 c2 d1 b2 d1
    b2 b1 b2 c1 d2 e1
    d2 b1 d2 e1 c2 b1 c2 b1
    e2 d1 c2 b2 b1 a\breve
  }
}

bassusMusic = {
  \clef bass
  \key a \minor
  \autoBeamOff
  \time 6/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    r1 e2 e1 e2 a,1 a'2 g1 g2 g,1
    e'2 e1 e2 a1 g2 c,1
    g'2 g1 g2 c,1 d2 e1 a,2 e'1
    c2 g'1 a2 d, e1 a,\breve
  }
}


\score
{
  \header {
    poet = \markup { \typewriter { \author } }
    instrument = \markup { \typewriter { #(string-append tuneTitle ". ") }
			   \tuneMeter }
    composer = \markup { \typewriter { \titleNote } }
    tagline = ""
  }
  <<
    \new StaffGroup {
      <<
	\new Staff = "cantus" {
	  <<
	    \new Voice = "one" { \stemUp \slurUp \tieUp \cantusMusic }
            \new Lyrics \lyricsto "one" \stanzaOne
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