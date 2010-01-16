var viewport;

var stationPanel = new Ext.Panel({
    id:'station_panel',
    layout: 'card',
    activeItem: default_view,
    region: 'center',
    margins : '0 0 5 0',
    deferredRender: false,
    defaults: {
        border: false
    },
    items:[stationMap, stationTable]
});

var equipmentInterface = function(){
    var viewport;
    return {
        init:function(){
            viewport = new Ext.Viewport({
                title: 'Equipment',
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
                }),
                {
                    title: 'Log',
                    collapsible: true,
                    region:'west',
                    layout:'vbox',
                    width: 200,
                    margins: '0 0 5 5',
                    minSize: 150,
                    maxSize: 250,
                    layoutConfig: {
                        align : 'stretch',
                        pack  : 'start'
                    },
                    defaults: {
                        border: false
                    },
                    items: [
                    {
                        html:'log list',
                        flex:1
                    },
                    {
                        html:'log post',
                        height:50
                    }
                    ]
                }, stationPanel, information]
            });
        }
    }
}();
