/* scale the skeleton */
@dictionary {
    point>center {
        /* this way we can override scale and still have access to it's 
         * original value
         */
        _scale: (Scaling widthFactor heightFactor);
        scale: _scale;
        _translate: (Translation xTranslate yTranslate);
        translate: _translate;
        transform:  translate * scale;
    }
}

point > center {
    on: transform * skeleton:on;
    in: transform * skeleton:in;
    out: transform * skeleton:out;
}


/* define higher level parameters */
@dictionary {
    point > center {
        widthFactor: 1;
        xTranslate: 0;
        yTranslate: 0;
        heightFactor: 1;
        /* "skeleton" will have to provide
         * Vectors at its the keys "on|in|out"
         */
        skeleton: parent:skeleton;
    }
}
