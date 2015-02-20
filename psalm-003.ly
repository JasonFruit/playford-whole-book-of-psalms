tuneTitle = "Psalm 3"
titleNote = "Or to Westminster Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

stanzaOne = \lyricmode {
  O Lord, how are my foes in- creased,
  which vex me more and more!
  They break my heart when as they say,
  God can not him re- store.
  But thou, O Lord, art my de- fence,
  when I am hard be- stead;
  My wor- ship and mine hon- our both,
  and thou hold'st up my head.
}

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
    g1 g2 fis e d g a \time 2/2 b1 \bar "||"
    \time 4/2 g2 c1 b2 a a g1 \bar "||"
    g1 d'2 c b a g e \time 2/2 d1 \bar "||"
    \time 4/2 g1 a2 b a a g1 \bar "||"
    b1 b2 c d b c c \time 2/2 b1 \bar "||"
    \time 4/2 g1 fis2 g a a b1 \bar "||"
    b1 b2 b a g c b \time 2/2 a1 \bar "||"
    \time 4/2 g2 a1 b2 \time 6/2 a a g\breve \bar "|."
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
    b1 b2 a g g e fis g1
    b2 a1 g2 g fis g1
    b1 a2 g g fis e g fis1
    b1 fis2 g g fis g1
    b1 d2 g, fis g e a gis1
    b1 a2 g g fis g1
    d'1 d2 d d c e, g fis1
    b2 d1 g,2 g fis g\breve
  }
}

bassusMusic = {
  \clef bass
  \key g \major
  \autoBeamOff
  \time 4/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    g1 g2 d e b a a g1
    g'2 fis1 g2 c, d g,1
    g'1 fis2 e g d g, a d1
    g1 d2 b c d g,1
    g'1 g2 e d e c a e'1
    g1 d2 b c d g,1
    g'1 g2 g d e c g d'1
    g2 fis1 g2 c, d g,\breve
  }
}

				% \header {
				%   poet = \markup { \typewriter { \author } }
				%   instrument = \markup { \typewriter { #(string-append tuneTitle ". ") }
				% 			 \tuneMeter }
				%   composer = \markup { \italic { \titleNote } }
				%   tagline = ""
				% }

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

\markup {
  \small {
    \column {
      \vspace #0.6
      \line {
	\bold { "3. " }
	\wordwrap-string #"
   Then with my voice unto the Lord

         I did both call and cry;

      And he out of his holy hill

         did here me instantly."
      }
      \vspace #0.6
      \line {
	\bold { "4. " }
	\wordwrap-string #"
   I laid me down, and quietly

         I slept, and rose again;

      For why? I know assuredly,

         The Lord did me sustain."
      }
      \vspace #0.6
      \line {
	\bold { "5. " }
	\wordwrap-string #"
   If thousands up against me rise,

         I will not be afraid;

      For thou art still my Lord and God,

         My Savior and my aid."
      }
    }
    \column {
      \vspace #0.6
      \line {
	\bold { "6. " }
	\wordwrap-string #"
   Rise up therefore, save me, my God

         To thee I make my prayer;

      For thou hast broke the cheeks and teeth

         Of all that wicked are."
      }
      \vspace #0.6
      \line {
	\bold { "7. " }
	\wordwrap-string #"
   Salvation only doth belong

         to thee, O Lord, above;

      Who on thy people dost bestow

         thy blessing and thy love."
      }
      \vspace #0.6
      \line {
	\hspace #2.4
	\italic {
	  \wordwrap-string #"
To Father, Son, and Holy Ghost,

all glory be therefore:

As in beginning was, is now,

and shall be evermore."
	}
      }
    }
    \vspace #5
  }
}