
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
        el: 'departments-netzke'
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
