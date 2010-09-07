var tab_site = new Ext.TabPanel({
    activeTab: 0,
    margins: {
        top:0,
        right:0,
        bottom:10,
        left:0
    },
    border:false,
    enableTabScroll:true,
    defaults:{
        autoScroll: true
    },
    items:[{
        title: 'General',
        html: "My content was added during construction."
    },{
        title: 'Equipments',
        tbar: {
            items:[{
                text: 'Add',
                iconCls: 'equipment_add'
            },{
                text: 'Delete',
                iconCls: 'equipment_delete'
            }]
        },
        html: "My content was added during construction."
    //autoLoad: {
    //    url: 'ajax2.htm',
    //    params: 'foo=bar&wtf=1'
    //}
    },{
        title: 'Suggestion',
        xtype:'htmleditor'
    //anchor:'98%',
    //listeners: {
    //    activate: handleActivate
    //},
    //html: "I am tab 4's content. I also have an event listener attached.",

    }
    ]
});

var information = {
    title: 'Site Information',
    region:'east',
    collapsible: true,
    margins: '0 5 5 0',
    layout: 'fit',
    width: 300,
    minSize: 200,
    maxSize: 600,
    layoutConfig: {
        align : 'stretch',
        pack  : 'start'
    },
    items:[tab_site],
    bbar: {
        items:[{
            text: 'Save',
            iconCls: 'save'
        }]
    }
};

