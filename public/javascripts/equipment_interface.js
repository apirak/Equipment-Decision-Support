var viewport;

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
                        html:'<div id="log-list">Uploading...</div>',
                        flex:1
                    },
                    {
                        xtype:'htmleditor',
                        id:'bio',
                        fieldLabel:'Biography',
                        border: false,
                        height:100,
                        anchor:'98%'
                    }
                    ],
                    bbar: {
                        items:[{
                            text: 'Save',
                            iconCls: 'save'
                        }]
                    }
                }, positionPanel, information]
            });
        }
    }
}();


