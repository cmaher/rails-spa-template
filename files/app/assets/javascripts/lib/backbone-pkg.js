require([
    'backbone',
    'backbone-nativeajax',
    'when'
], function (
    Backbone,
    NativeAjax, // Non jquery ajax
    when
) {
    'use strict';
    // Used by NativeAjax to return a promise
    Backbone.Deferred = when.defer;
    return Backbone;
});