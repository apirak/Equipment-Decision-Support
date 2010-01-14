//Here, set some properties for the mask, including effect
var loadingIndicator = function(){
    return {
        init : function(){
            var loading = Ext.get('loading');
            var mask = Ext.get('loading-mask');
            mask.setOpacity(.2);
            mask.shift({
                xy: loading.getXY(),
                width: loading.getWidth(),
                height: loading.getHeight(),
                remove: true,
                duration: 2,
                opacity: .3,
                easing: 'bounceOut',
                callback: function(){
                    loading.fadeOut({
                        duration: .2,
                        remove: true
                    });
                }
            });
        }
    };
}();

//On ready, remove the mask using the effect above
//Ext.onReady(loadingIndicator.init, loadingIndicator, true);
