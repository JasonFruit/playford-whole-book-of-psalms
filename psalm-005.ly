tuneTitle = "Psalm 5"
titleNote = "London Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

stanzaOne = \lyricmode {
  In- cline thine ears, O Lord, and let
  my words have free ac- cess:
  To thee, who art my God and King,
  from whom I seek re- dress.
}

cantusMusic = {
  \clef treble
  \key d \minor
  \autoBeamOff
  \time 4/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    a1 d2 a bes g c e \time 2/2 c1 \bar "||"
    \time 4/2 a1 d2 a bes c d1 \bar "||" \break
    c1 e2 c d bes a bes \time 2/2 a1 \bar "||"
    \time 4/2 d1 c2 bes \time 6/2 c a g\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key d \minor
  \autoBeamOff
  \time 4/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    fis1 fis2 fis g g e g g1
    fis1 fis2 fis g a bes1
    a1 c2 a bes g fis g fis1
    bes1 a2 g g fis g\breve
  }
}

bassusMusic = {
  \clef bass
  \key d \minor
  \autoBeamOff
  \time 4/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    d1 d2 d g e c c c1
    d1 d2 d g f bes,1
    f'1 c2 f bes, c d g, d'1
    bes1 f'2 g c, d g,\breve
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
