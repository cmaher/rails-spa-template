(function () {
    'use strict';

    requirejs.config({
        paths: {
            jquery: 'lib/stub',
            'backbone-pkg': 'lib/backbone-pkg',
            'backbone-nativeajax': 'backbone.nativeajax/backbone.nativeajax',
            when: 'when/when',
            react: 'react/react-with-addons'
        },

        packages: [
            {
                name: 'when',
                location: 'when',
                main: 'when.js'
            }
        ]
    });
}());

