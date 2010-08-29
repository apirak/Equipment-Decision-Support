var tabs2 = new Ext.TabPanel({
    activeTab: 0,
    width:600,
    height:250,
    flex:2,
    //plain:true,
    margins: {top:0, right:0, bottom:10, left:0},
    border:false,
    enableTabScroll:true,
    defaults:{
        autoScroll: true
    },
    items:[{
        title: 'Normal Tab',
        html: "My content was added during construction."
    },{
        title: 'Ajax Tab 2',
        html: "My content was added during construction."
        //autoLoad: {
        //    url: 'ajax2.htm',
        //    params: 'foo=bar&wtf=1'
        //}
    },{
        title: 'Event Tab',
        //listeners: {
        //    activate: handleActivate
        //},
        html: "I am tab 4's content. I also have an event listener attached."
    }
    ]
});

var information = {
    title: 'Information',
    region:'east',
    collapsible: true,
    margins: '0 5 5 0',
    width: 300,
    minSize: 200,
    maxSize: 400,
    layout:'vbox',
    layoutConfig: {
        align : 'stretch',
        pack  : 'start'
    },
    items:[tabs2]
};

