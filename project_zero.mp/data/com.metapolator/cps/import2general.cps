/**
 * Boilerplate for an imported master, that is not general enough for
 * skeleton2outline, because masters that use skeleton2outline
 * will often have to define these rules themselves.
 */
point > center {
    on: parent:skeleton:on;
    in: parent:skeleton:in;
    out: parent:skeleton:out;
}

point > left {
    onDir: deg 180 + parent:right:onDir;
    onLength: parent:right:onLength;
}
