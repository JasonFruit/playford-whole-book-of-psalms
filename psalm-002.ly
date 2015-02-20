tuneTitle = "Psalm 2"
titleNote = "Cambridge Tune"
tuneMeter = "C.M."
author = ""
pageCount = 1
voiceFontSize = 0

stanzaOne = \lyricmode {
  Why did the Gen- tiles tu- mults raise?
  what rage was in their brain?
  Why do the peo- ple still con- trive
  a thing that is but vain?
}

cantusMusic = {
  \clef treble
  \key c \major
  \autoBeamOff
  \time 6/2
  \relative c'' {
    \override Staff.NoteHead.style = #'baroque
    \set Score.tempoHideNote = ##t \tempo 4 = 120
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    \partial 1.
    r1 a2 c1 a2 b1 a2 fis gis1 a \bar "||"
    c2 b1 c2 b1 a2 b1. \bar "||"
    b2 b c d1 c2 b1 a2 \time 3/2 gis1 \bar "||"
    c2 \time 6/2 b1 a2 a gis1 a\breve \bar "|."
  }
}

mediusMusic = {
  \clef "treble_8"
  \key c \major
  \autoBeamOff
  \time 6/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f)
    \set fontSize = \voiceFontSize
    r1 c2 e1 d2 e1 e2 d b1 cis
    c2 d1 e2 d1 c2 b1.
    gis2 gis a b1 e2 d1 c2 b1
    e2 d1 c2 b b1 a\breve
  }
}

bassusMusic = {
  \clef bass
  \key c \major
  \autoBeamOff
  \time 6/2
  \relative c' {
    \override Staff.NoteHead.style = #'baroque
    \override Staff.TimeSignature #'break-visibility = ##(#f #f #f) 
    \set fontSize = \voiceFontSize
    r1 a2 a1 f2 e1 c2 d e1 a,
    a'2 g1 c,2 g'1 a2 e1.
    e2 e a g1 c,2 g'1 a2 e1
    c2 g'1 a2 d, e1 a,\breve
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

\markup {
  \small {
    \column {
      \vspace #0.6
      \line {
	\bold { "2. " }
	\wordwrap-string #"
    The kings and rulers of the earth

    conspire and are all bent

    Against the Lord, and Christ his Son,

    whom he among us sent."
      }
      \vspace #0.6
      \line {
	\bold { "3. " }
	\wordwrap-string #"
    Shall we be bound to them? Say they,

    let all their bonds be broke;

    And of their doctrine and their law

    let us reject the yoke."
      }
      \vspace #0.6
      \line {
	\bold { "4. " }
	\wordwrap-string #"
    But he that in the heaven dwells,

    their doings will deride;

    And make them all as mocking-stocks

    throughout the world so wide."
      }
      \vspace #0.6
      \line {
	\bold { "5. " }
	\wordwrap-string #"
    For in his wrath he shall reprove

    their pride and scornful way,

    And in his fury trouble them,

    and unto them shall say,"
      }
      \vspace #0.6
      \line {
	\bold { "6. " }
	\wordwrap-string #"
    I have anointed him my King

    upon my holy hill;

    I will therefore, Lord, preach thy law

    according to thy will:"
      }
      \vspace #0.6
      \line {
	\bold { "7. " }
	\wordwrap-string #"
    The law whereof the Lord himself

    hath thus said unto me,

    Thou art my only Son, this day

    have I begotten thee."
      }
    }
    \hspace #3
    \column {
      \vspace #0.6
      \line {
	\bold { "8. " }
	\wordwrap-string #"
    The people I will give to thee,

    as heirs at thy request

    The ends and coasts of all the earth

    by thee shall be possessed."
      }
      \vspace #0.6
      \line {
	\bold { "9. " }
	\wordwrap-string #"
    Thou shalt them bruise e'en like to those

    that under foot are trod,

    And as a potter's vessel break

    them with an iron rod."
      }
      \vspace #0.6
      \line {
	\bold { "10. " }
	\wordwrap-string #"
    Now ye, O kings and rulers all,

    be wise therefore and learned,

    By who the matters of the world

    are judged and discerned."
      }
      \vspace #0.6
      \line {
	\bold { "11. " }
	\wordwrap-string #"
    See that ye serve the Lord above

    in trembling and in fear;

    See that with rev'rence ye rejoice

    when ye to him draw near:"
      }
      \vspace #0.6
      \line {
	\bold { "12. " }
	\wordwrap-string #"
    See that ye do embrace and kiss

    his Son without delay;

    Lest in his wrath ye suddenly

    Perish from the right way."
      }
      \vspace #0.6
      \line {
	\bold { "13. " }
	\wordwrap-string #"
    If once his wrath (but little) shall

    be kindled in his breast,

    Then only they that trust in him

    shall happy be and blest."
      }
    }
  }
}