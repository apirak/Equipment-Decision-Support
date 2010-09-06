Ext.override(Netzke.pre.GridPanel, {
  onEditInForm: function(){
    var selModel = this.getSelectionModel();
    if (selModel.getCount() > 1) {
      var recordId = selModel.getSelected().id;
      this.loadAggregatee({id: "multiEditForm",
        params: {record_id: recordId},
        callback: function(w){
          var form = w.items.first();
          form.on('apply', function(){
            var ids = [];
            selModel.each(function(r){
              ids.push(r.id);
            });
            form.baseParams = {ids: Ext.encode(ids)}
          }, this);
          
          w.on('close', function(){
            if (w.closeRes === "ok") {
              this.store.reload();
            }
          }, this);
        }, scope: this});
    } else {
      var recordId = selModel.getSelected().id;
      this.loadAggregatee({id: "editForm",
        params: {record_id: recordId},
        callback: function(form){
          form.on('close', function(){
            if (form.closeRes === "ok") {
              this.store.reload();
            }
          }, this);
        }, scope: this});
    }
  },
  
  onAddInForm: function(){
    this.loadAggregatee({id: "addForm", callback: function(form){
      form.on('close', function(){
        if (form.closeRes === "ok") {
          this.store.reload();
        }
      }, this);
    }, scope: this});
  }
});