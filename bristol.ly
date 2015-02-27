tuneTitle = "Psalm 6"
titleNote = "Bristol Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

stanzaOne = \lyricmode {
  Lord, in thy wrath re- prove me not,
  Though I de- serve thine ire:
  Nor yet cor- rect me in thy rage,
  O Lord, I thee de- sire.
}

cantusMusic = {
  \clef treble
  \key g \minor
  \autoBeamOff
  \time 4/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    g1 d'2 c bes g bes a \time 2/2 g1 \bar "||"
    \time 4/2 bes1 d2 a bes c \time 2/2 d1 \bar "||" \break
    \time 4/2 d1 es2 c f d c c \time 2/2 bes1 \bar "||"
    \time 4/2 g2 c1 bes2 \time 6/2 a a g\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key g \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    bes1 bes2 a g g g fis g1
    g1 a2 a g g fis1
    g1 g2 a bes bes bes a bes1
    bes2 a1 g2 g fis g\breve
  }
}

bassusMusic = {
  \clef bass
  \key g \minor
  \autoBeamOff
  \time 4/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    g'1 bes,2 c d es c d g,1
    g'1 fis2 f es es d1
    g1 es2 f d es f f, bes1
    es2 c1 g'2 c, d g,\breve
  }
}

\score
{
  \header {
    poet = \markup { \typewriter { \author } }
    instrument = \markup { \typewriter { #(string-append tuneTitle ". ") }
			   \tuneMeter }
    composer = \markup { \italic { \titleNote } }
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
