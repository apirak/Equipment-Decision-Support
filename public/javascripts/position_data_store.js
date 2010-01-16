var proxy = new Ext.data.HttpProxy({
    api: {
        read : '/equipments.ext_json',
        create : '/equipments',
        update: '/equipments',
        destroy: '/equipments'
    }
});

// The new DataWriter component.
var writer = new Ext.data.JsonWriter({
    encode: true,
    writeAllFields: false
});

var positionDataStore = new Ext.data.JsonStore({
    id: 'position_data_store',
    idProperty: 'id',
    data: positionData,
    url: '/equipment.ext_json',
    proxy: proxy,
    writer: writer,
    totalProperty: 'totalCount',
    restful: true,
    storeId: 'postionDataStore',
    root: 'positions',
    remoteSort: true,
    fields: positionField,
    listeners: {
        write : function(store, action, result, res, rs) {
            App.setAlert(res.success, res.message); // <-- show user-feedback for all write actions
        },
        exception : function(proxy, type, action, options, res, arg) {
            if (type === 'remote') {
                Ext.Msg.show({
                    title: 'REMOTE EXCEPTION',
                    msg: res.message,
                    icon: Ext.MessageBox.ERROR,
                    buttons: Ext.Msg.OK
                });
            }
        },
        beforeload : function(store, options){
        // x = BuildSearchParamsFromView()
        // mediaDataStore.setBaseParam('media_options', Ext.encode(x));
        }
    }
});