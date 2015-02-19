tuneTitle = "Psalm 7"
titleNote = "Worcester Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

stanzaOne = \lyricmode {
  O Lord, my God, I put my trust
  and con- fi- dence in thee,
  Save me from them that me pur- sue,
  and still de- li- ver me.
}

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
    r1 e2 fis1 g2 fis1 e2 a1 a2 gis1 \bar "||"
    e2 b'1 a2 d cis1 b1. \bar "||" \break
    b2 b g d'1 d2 d1 b2 \time 3/2 b1 \bar "||"
    a2 \time 6/2 g1 e2 g fis1 e\breve \bar "|."
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
    r1 b2 b1 b2 b1 g2 c1 c2 b1
    b2 d1 cis2 b ais1 b1.
    fis2 fis g a1 b2 fis1 g2 fis1
    fis2 b1 g2 c b1 e,\breve
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
    r1 e2 dis1 e2 b1 c2 a1 a2 e'1
    e2 b1 fis'2 b fis1 b,1.
    b2 b e d1 g2 d1 e2 \time 3/2 b1
    d2 \time 6/2 g,1 c2 a b1 e\breve
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
