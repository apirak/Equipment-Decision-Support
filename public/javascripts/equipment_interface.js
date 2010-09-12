var viewport;
var current_site_id = 6;

var positionPanel = new Ext.Panel({
    id:'position_panel',
    layout: 'card',
    activeItem: defaultView,
    region: 'center',
    margins : '0 0 5 0',
    layoutOnCardChange : true,
    deferredRender: false, // set this so we have access to the map on the second tab before its been activated
    defaults: {
        border: false
    },
    items:[positionMap, positionTable]
});



var equipmentInterface = function(){
    var viewport;
    return {
        init:function(){
            viewport = new Ext.Viewport({
                title: 'Equipment Decision Support',
                waitMsgTarget: true,
                loadMask: true,
                layout: 'border',
                defaults: {
                    split: true,
                    cmargins: '0 5 5 5'
                },
                items: [new Ext.BoxComponent({
                    region: 'north',
                    split: false,
                    height: 30,
                    margins: '5 5 0 5',
                    el: 'header'
                }), logPanel, positionPanel, information]
            });
        }
    }
}();


