var switchToMap = new Ext.Action( {
    iconCls : 'map_view',
    text : 'Map view',
    handler : function() {
        stationPanel.layout.setActiveItem('station_map');
    },
    tooltip : 'switch to map view'
});

var table_tb = new Ext.Toolbar();
table_tb.add('Station', '-', add_flag, '-', {                  
    text: 'Action Menu',
    menu: []
}, '->', switchToMap);

var stationTable = new Ext.grid.GridPanel({
    id: 'station_table',
    store: positionDataStore,
    columns: positionColumnField,
    margins: '0 5 5 0',
    padding: '0 0 0 0',
    tbar: table_tb,
    loadMask:{
        msg: 'Loading Data...',
        enabled: true
    }
});

//    enableDragDrop: true,
//    ddGroup: 'organizer_drag_drop'
//    selModel: new Ext.grid.RowSelectionModel({
//         singleSelect:false,
//         listeners: tableViewSelectedListeners
//        })
//    listeners: {
//       'dblclick' : media_double_click
//    }