var switchToMap = new Ext.Action( {
    iconCls : 'map_view',
    text : 'Map view',
    handler : function() {
        stationPanel.layout.setActiveItem('station_map');
        map = Ext.getCmp('station_map').getMap();

        // Force refresh
        lat = map.getCenter().lat();
        lng = map.getCenter().lng()
        zoom = map.getZoom()
        current_position = new google.maps.LatLng(lat, lng, false)
        Ext.getCmp('station_map').getMap().setCenter(current_position, zoom);
    },
    tooltip : 'switch to map view'
});

var table_tb = new Ext.Toolbar();
table_tb.add('Station', '-', add_flag, '-', {                  
    text: 'Action Menu',
    menu: []
}, '->', switchToMap);

tableViewSelectedListeners = {
    selectionchange: function(selModel){
        if(selModel.getCount() != 0) {
            if(selModel.getCount() == 1){
                // media_select(selModel.selections.items[0]);
                alert("a media")
            } else {
                // media_selects(selModel.selections.items);
                alert("medias")
            }
        } else {
            // media_select_not_thing();
            alert("select notthing")
        }
    }
}

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
    },
    selModel: new Ext.grid.RowSelectionModel({
        singleSelect:true,
        listeners: tableViewSelectedListeners
    })
});

//    enableDragDrop: true,
//    ddGroup: 'organizer_drag_drop'
//    listeners: {
//       'dblclick' : media_double_click
//    }