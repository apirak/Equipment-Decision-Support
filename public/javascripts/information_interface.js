var myData = [
['Equipment A','department A','suggest'],
['Equipment B','department C','suggest'],
['Equipment C','department X','suggest']
];

/**
     * Custom function used for column renderer
     * @param {Object} val
     */
function change(val){
    if(val > 0){
        return '<span style="color:green;">' + val + '</span>';
    }else if(val < 0){
        return '<span style="color:red;">' + val + '</span>';
    }
    return val;
}

/**
     * Custom function used for column renderer
     * @param {Object} val
     */
function pctChange(val){
    if(val > 0){
        return '<span style="color:green;">' + val + '%</span>';
    }else if(val < 0){
        return '<span style="color:red;">' + val + '%</span>';
    }
    return val;
}

// create the data store
var store = new Ext.data.ArrayStore({
    fields: [
    {
        name: 'equipment'
    },

    {
        name: 'price'
    },

    {
        name: 'suggest'
    }
    ]
});

// manually load local data
store.loadData(myData);

// create the Grid
var grid = new Ext.grid.GridPanel({
    store: store,
    columns: [
    {
        id:'equipment',
        header: 'Equipment',
        width: 160,
        sortable: true,
        dataIndex: 'equipment'
    },

    {
        header: 'Department',
        width: 100,
        sortable: true,
        dataIndex: 'price'
    },

    {
        header: 'Suggest',
        width: 100,
        sortable: true,
        dataIndex: 'suggest'
    }
    ],
    stripeRows: true,
    autoExpandColumn: 'equipment',
    height: 350,
    width: 600,
    title: 'Equipment',
    // config options for stateful behavior
    stateful: true,
    stateId: 'grid',
    tbar: {
        items:[{
            text: 'add',
            iconCls: 'equipment_add'
        },{
            text: 'delete',
            iconCls: 'equipment_delete'
        }]
    }
});


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
    },grid,{
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

