tuneTitle = "Te Deum"
titleNote = "Or to London New Tune"
tuneMeter = "C.M.D."
author = ""
voiceFontSize = 0

stanzaOne = \lyricmode {
  We praise thee, God and thee con- fess
  the on- ly Lord to be,
  And as e- ter- nal Fa- ther,
  all the earth doth wor- ship thee.

  To thee all An- gels cry,
  the heav'ns and all the pow'rs there- in:
  To thee Che- rub and Se- ra- phin
  to cry they do not lin.
}

cantusMusic = {
  \clef treble
  \key e \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    e1 g2 fis e b' g a \time 2/2 b1 \bar "||"
    \time 4/2 d1 c2 b b a b1 \bar "||"
    b1 e2 e d b c a \time 2/2 g1 \bar "||"
    \time 4/2 g1 a2 c b b e,1 \bar "||"

    e1 e2 fis g a b b \time 2/2 e1 \bar "||"
    \time 4/2 d1 g,2 b a a g1 \bar "||"
    g'1 fis2 e d d c a \time 2/2 b1 \bar "||"
    \time 4/2 d1 e2 a, \time 6/2 b b e,\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key e \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    b1 c2 b g g e e dis1
    fis1 g2 fis e e dis1
    g1 g2 g a g g fis g1
    b1 d2 e e dis e1
    b1 c2 d b c d d c1
    fis,1 g2 g g fis g1
    b1 a2 g fis g g fis g1
    b1 c2 e e dis e\breve
  }
}

bassusMusic = {
  \clef bass
  \key e \minor
  \autoBeamOff
  \time 4/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    e1 a,2 b c b e c b1
    b1 e2 d c c b1
    e1 c2 e fis g c, d g,1
    g'1 fis2 e b' b, e1
    e1 e2 b e c g' g c,1
    d1 e2 b c d g,1
    g'1 d2 e b b c d g,1
    g'1 e2 c b b e\breve
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
