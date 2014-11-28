/* all masters use this CPS file by default*/
@dictionary {
    master > glyph {
        true: 1;
        false: 0;
    }
    master > glyph {
        _display: true;
    }
}
@dictionary{
    master#base > glyph
  , master#cl > glyph
  , master#wl > glyph
  , master#ceb > glyph
  , master#web > glyph
  , master#metapolated > glyph {
        _display: false;
    }
}
