module Netzke
  class FormPanel < Base
    module FormPanelJs
      # parameters used to instantiate the JS object
      def js_config
        res = super
        res.merge!(:fields => fields)
        res.merge!(:model => data_class.name) if data_class
        res.merge!(:pri => data_class.primary_key) if data_class
        res
      end

      module ClassMethods
        def js_base_class
          "Ext.FormPanel"
        end

        def js_extend_properties
          {
            :body_style     => 'padding:5px 5px 0',
            :auto_scroll    => true,
            :label_width    => 150,
            :default_type   => 'textfield',

            :init_component => <<-END_OF_JAVASCRIPT.l,
              function(){
                var recordFields = []; // Record
                this.items = [];
                var index = 0;
            
                // Process columns
                Ext.each(this.fields, function(field){
                  if (!field.hidden || field.name == this.pri) {
                    recordFields.push({name:field.name, mapping:index++});
                    
                    var defaultColumnConfig = Ext.apply({}, this.defaultColumnConfig);
                    var columnConfig = Ext.apply(defaultColumnConfig, field);

                    // apply dynamically defined properties
                    Ext.applyIf(columnConfig, {
                      xtype     : this.attrTypeEditorMap[columnConfig.attrType],
                      fieldLabel: columnConfig.fieldLabel || columnConfig.label || columnConfig.name.humanize(),
                      hideLabel : columnConfig.hidden, // completely hide fields marked "hidden"
                      parentId  : this.id,
                      name      : columnConfig.name,
                      value     : columnConfig.value || columnConfig.defaultValue,
                      checked   : columnConfig.attrType == "boolean" ? columnConfig.value : null // checkbox state
                    });

                    this.items.push(columnConfig);
                  }
                }, this);
            
                var Record = Ext.data.Record.create(recordFields);
                this.reader = new Ext.data.RecordArrayReader({root:"data"}, Record);
            
                delete this.fields; // we don't need them anymore
            
                // Now let Ext.form.FormPanel do the rest
                #{js_full_class_name}.superclass.initComponent.call(this);
            
                // Apply event
                this.addEvents('apply');
              }
            END_OF_JAVASCRIPT

            :attr_type_editor_map => {
              :integer  => "numberfield",
              :boolean  => "checkbox",
              :decimal  => "numberfield",
              :datetime => "xdatetime",
              :date     => "datefield",
              :string   => "textfield"
            },

            # Defaults for each field
            :defaults       => {
              :anchor       => '-20', # to leave some space for the scrollbar
              # :width => 180, # we do NOT want fixed size because it doesn't look nice when resizing
              :listeners    => {
                # On "return" key, submit the form
        				:specialkey => {
        				  :fn => <<-END_OF_JAVASCRIPT.l
          				  function(field, event){
            					if (event.getKey() == 13) this.ownerCt.onApply();
            				}
        				  END_OF_JAVASCRIPT
      				  }
              }
            },
        
            # :default_column_config => meta_columns.inject({}){ |r, c| r.merge!({
            #   c[:name] => c[:default_value]
            # })},
        
            :set_form_values => <<-END_OF_JAVASCRIPT.l,
              function(values){
                this.form.loadRecord(this.reader.readRecords({data:[values]}).records[0]);
              }
            END_OF_JAVASCRIPT

            :load_record => <<-END_OF_JAVASCRIPT.l,
              function(id, neighbour){
                this.netzkeLoad({id:id});
              }
            END_OF_JAVASCRIPT
        
            # :previous => <<-END_OF_JAVASCRIPT.l,
            #   function() {
            #     var currentId = this.form.getValues().id;
            #     this.loadRecord(currentId, 'previous');
            #   }
            # END_OF_JAVASCRIPT
            # 
            # :next => <<-END_OF_JAVASCRIPT.l,
            #   function() {
            #     var currentId = this.form.getValues().id;
            #     this.loadRecord(currentId, 'next');
            #   }
            # END_OF_JAVASCRIPT
        
            :on_apply => <<-END_OF_JAVASCRIPT.l
              function() {
                if (this.fireEvent('apply', this)) {
                  var values = this.getForm().getValues();
                  for (var k in values) {
                    if (values[k] == "") {delete values[k]}
                  }
                  if (this.fileUpload) {
                    // Not a Netzke's standard API call, because the form is multipart
                    this.getForm().submit({
                      url: this.buildApiUrl("netzke_submit"),
                      params: {
                        data: Ext.encode(values)
                      },
                      failure: function(form, action){
                        // It will always be failure, as we don't play along with the Ext success indication (not returning {success: true})
                        this.bulkExecute(Ext.decode(action.response.responseText));
                        this.fireEvent('submitsuccess');
                      },
                      scope: this
                    });
                  } else {
                    // Submit the data and process the result
                    this.netzkeSubmit(Ext.apply((this.baseParams || {}), {data:Ext.encode(values)}), function(result){
                      if (result === "ok") {this.fireEvent("submitsuccess")};
                    }, this);
                  }
                }
              }
            END_OF_JAVASCRIPT
          }
        end
    
      end
    
      def self.included(base)
        base.extend ClassMethods
      end
    
    end
  end
end