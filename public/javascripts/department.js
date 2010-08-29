// Application instance for showing user-feedback messages.
var App = new Ext.App({});

// Create HttpProxy instance.  Notice new configuration parameter "api" here instead of load.  However, you can still use
// the "url" paramater -- All CRUD requests will be directed to your single url instead.
var proxy = new Ext.data.HttpProxy({
    api: {
        read : 'department',
        create : 'department/create',
        update: 'department/update',
        destroy: 'department/destroy'
    }
});

// Typical JsonReader.  Notice additional meta-data params for defining the core attributes of your json-response
var reader = new Ext.data.JsonReader({
    totalProperty: 'total',
    successProperty: 'success',
    idProperty: 'id',
    root: 'data',
    messageProperty: 'message'  // <-- New "messageProperty" meta-data
}, [
    {name: 'id'},
    {name: 'email', allowBlank: false},
    {name: 'first', allowBlank: false},
    {name: 'last', allowBlank: false}
]);



var tabs2 = new Ext.TabPanel({
    activeTab: 0,
    title: 'Information',
    region:'center',
    margins: {
        top:0,
        right:0,
        bottom:0,
        left:0
    },
    enableTabScroll:true,
    defaults:{
        autoScroll: true
    },
    items:[{
        title: 'Information',
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

var department = function(){
    var viewport;
    return {
        init:function(){
            viewport = new Ext.Viewport({
                title: 'Department',
                waitMsgTarget: true,
                loadMask: true,
                layout: 'border',
                items: [new Ext.BoxComponent({
                    region: 'north',
                    split: false,
                    height: 30,
                    margins: '5 5 0 5',
                    el: 'header'
                }), tabs2]
            });
        }
    }
}();
