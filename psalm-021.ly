tuneTitle = "Psalm 21"
tuneMeter = "C.M.D."
author = ""
voiceFontSize = 0

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
    a1 a2 a d c d e \time 2/2 f1 \bar "||"
    \time 4/2 c2 d1 a2 bes c a1 \bar "||"
    a1 c2 d e c d e \time 2/2 f1 \bar "||"
    \time 4/2 f2 e1 d2 d cis d1 \bar "||"
    d1 d2 cis d a d c \time 2/2 a1 \bar "||"
    \time 4/2 a2 c1 f,2 a g f1 \bar "||"
    f2 a1 bes2 c d c d \time 2/2 e1 \bar "||"
    \time 4/2 d2 f1 d2 \time 6/2 e e d\breve \bar "|."
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
    f1 f2 e f a g g f1
    a2 g1 f2 f e f1
    f1 a2 bes c a g g f1
    a2 cis1 d2 e e d1
    a1 bes2 a a f f e f1
    f2 g1 f2 f e f1
    a2 c1 bes2 a bes a b c1
    a2 a1 d2 d cis d\breve
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
    d1 d2 c bes f' bes, c f,1
    f'2 bes,1 f'2 d c f1
    f1 e2 d c f bes, c f,1
    f'2 a1 bes2 a a d,1
    d1 g2 a d, f bes, c f1
    f2 e1 f2 bes, c f,1
    f'2 f1 d2 c bes f' d c1
    d2 d1 bes2 a a d\breve
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
