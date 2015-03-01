tuneTitle = "Psalm 50"
tuneMeter = "10.10.10.10.11.11."
author = ""
voiceFontSize = 0

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
    d1 c2 bes a1 c d2 c bes a \time 2/2 g1 \bar "||"
    \time 4/2 g1 d'2 d c1 d e2 f e e \time 2/2 d1 \bar "||"
    \time 4/2 d1 d2 d c1 a bes2 d c bes \time 2/2 a1 \bar "||"
    \time 4/2 d1 d2 d c1 a bes2 d c bes \time 2/2 a1 \bar "||"
    \time 4/2 c1 bes2 a g1 fis g2 a bes c d1 a \bar "||"
    a1 c2 c d1 f es2 d c bes \time 6/2 a1 g\breve \bar "|."
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
    bes1 a2 g fis1 g bes2 a g fis g1
    bes1 bes2 g a1 f a2 a bes a fis1
    bes1 f2 g a1 c d2 bes a g fis1
    bes1 bes2 bes a1 c d2 bes a g fis1
    g1 g2 fis bes1 a bes2 d g, g fis1 fis
    f1 g2 a bes1 a c2 bes4( a) g2 g fis1 g\breve
  }
}

bassusMusic = {
  \clef bass
  \key g \minor
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    g1 fis2 g d1 c bes2 c d d g,1
    es'1 bes2 bes f'1 d cis2 d g, a d1
    bes1 bes2 bes f'1 f bes,2 bes f' g d1
    bes1 bes2 bes f'1 f bes,2 bes f' g d1
    c1 d2 d g,1 d' g2 f es es d1 d
    d1 es2 f bes,1 f c'2 d es4( f) g2 d1 g,\breve
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
