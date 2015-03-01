tuneTitle = "Psalm 46"
tuneMeter = "C.M.D."
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
    g1 c2 b c d e d \time 2/2 c1 \bar "||"
    \time 4/2 b2 a1 g2 g fis g1 \bar "||"
    g1 c2 b c d e d \time 2/2 c1 \bar "||"
    \time 4/2 b2 a1 g2 g fis g1 \bar "||"
    b1 c2 d e d c c \time 2/2 b1 \bar "||"
    \time 4/2 d2 g1 f2 e e d1 \bar "||"
    d1 a2 b c b a b \time 2/2 g1 \bar "||"
    \time 4/2 b2 a1 g2 \time 6/2 g fis g\breve \bar "|."
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
    g1 g2 f e g c b c1
    d2 d1 b2 a a g1
    g1 g2 f e g c b c1
    d2 d1 b2 a a g1
    g1 a2 b c g g fis g1
    b2 cis1 d2 d cis d1
    fis,1 e2 g fis g g fis g1
    g2 fis1 b2 a a g\breve
  }
}

bassusMusic = {
  \clef bass
  \key g \major
  \autoBeamOff
  \time 4/2
  \relative c {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    c1 e2 d c b c g c1
    g'2 d1 e2 c d g,1
    c1 e2 d c b c g c1
    g'2 fis1 g2 c, d g,1
    g'1 e2 d c b c a g1
    g'2 e1 d2 g a d,1
    d1 c2 b a g c d g,1
    g2 d'1 b2 c d g,\breve
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
