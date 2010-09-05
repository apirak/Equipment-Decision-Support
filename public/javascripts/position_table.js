var switchToMap = new Ext.Action( {
    iconCls : 'map_view',
    text : 'Map view',
    handler : function() {
        positionPanel.layout.setActiveItem('position_map');
        map = Ext.getCmp('position_map').getMap();

        // Force refresh
        lat = map.getCenter().lat();
        lng = map.getCenter().lng()
        zoom = map.getZoom();
        current_position = new google.maps.LatLng(lat, lng, false);
        Ext.getCmp('position_map').getMap().setCenter(current_position, zoom);

				//loadingCurrentPosition();

        trafficLayer = new google.maps.TrafficLayer();
        trafficLayer.setMap(map);
    },
    tooltip : 'switch to map view'
});

var table_tb = new Ext.Toolbar();
table_tb.add('Position', '-', add_flag, '-', {
    text: 'Action Menu',
    menu: []
}, '->', switchToMap);

var paginateToolsBar = new Ext.PagingToolbar({
    id:'paginate_tools_bar',
    border: true,
    store: positionDataStore,
    pageSize: pageSize,
    displayInfo: true,
    displayMsg: 'Position {0} - {1} of {2}',
    emptyMsg: "No position by your search condition"
})

tableViewSelectedListeners = {
    selectionchange: function(selModel){
        if(selModel.getCount() != 0) {
            if(selModel.getCount() == 1){
                // media_select(selModel.selections.items[0]);
                alert("a position")
            } else {
                // media_selects(selModel.selections.items);
                alert("positions")
            }
        } else {
            // media_select_not_thing();
            alert("select notthing")
        }
    }
}

var positionTable = new Ext.grid.GridPanel({
    id: 'position_table',
    store: positionDataStore,
    columns: positionColumnField,
    margins: '0 5 5 0',
    padding: '0 0 0 0',
    tbar: table_tb,
    bbar: paginateToolsBar,
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