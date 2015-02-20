tuneTitle = "Psalm 8"
titleNote = "St. Mary's Tune"
tuneMeter = "C.M."
author = ""
voiceFontSize = 0

stanzaOne = \lyricmode {
  O God our Lord, how won- der- ful
  are thy works ev'- ry where!
  Thy fame sur- mounts in dig- ni- ty
  a- bove the hea- vens clear!
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
    e1 g2 fis e e' d c \time 2/2 b1 \bar "||"
    \time 4/2 b1 d2 g, b a g1 \bar "||"
    b1 d2 e fis b, a g \time 2/2 d'1 \bar "||"
    \time 4/2 a1 b2 e, \time 6/2 g fis e\breve \bar "|."
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
    b1 b2 a g c b a gis1
    b1 a2 g g fis g1
    b1 a2 g a g e g fis1
    fis1 g2 a e dis e\breve
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
    e1 e2 b c c g' a e1
    g1 fis2 e c d g,1
    g'1 fis2 e d g c, e d1
    d1 g,2 c a b e\breve
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

\markup {
  \small {
    \column {
      \vspace #0.6
      \line {
	\bold { "2. " }
	\wordwrap-string #"
  E'en by the mouth of sucking babes

         thou wilt confound thy foes;

      For in those babes thy might is seen

         thy graces they disclose."
      }
      \vspace #0.6
      \line {
	\bold { "3. " }
	\wordwrap-string #"
   And when I see the heav'ns above,

         the work of thine own hand,

      The sun, the moon, and all the stars

         in order as they stand;"
      }
      \vspace #0.6
      \line {
	\bold { "4. " }
	\wordwrap-string #"
   Lord what is man, that thou of him

         tak'st such abundant care!

      Or what the son of man, whom thou

         to visit dost not spare!"
      }
      \vspace #0.6
      \line {
	\bold { "5. " }
	\wordwrap-string #"
   For thou hast made him little less

         than angels in degree;"
      }
    }
    \hspace #3
    \column {
      \vspace #0.6
      \line {
	\hspace #2.5
	\wordwrap-string #"
      And thou hast also crowned him

         with glorious dignity."
      }
      \vspace #0.6
      \line {
	\bold { "6. " }
	\wordwrap-string #"
   Thou hast preferred him to be lord

         of all thy works, and thou

      Hast in subjection unto him

         put all things here below."
      }
      \vspace #0.6
      \line {
	\bold { "7. " }
	\wordwrap-string #"
   As sheep, and neat, and all beasts else

         that in the fields do feed,

      Fowls of the air, fish of the sea,

         and all that therein breed,"
      }
      \vspace #0.6
      \line {
	\bold { "8. " }
	\wordwrap-string #"
   O God our Lord, how excellent

         is thy most glorious Name

      In all the earth! Therefore do we

         praise and adore the same."
      }
    }
  }
}