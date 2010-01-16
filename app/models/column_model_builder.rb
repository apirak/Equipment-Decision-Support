module ColumnModelBuilder

  def self.included(base)
    base.extend(ClassMethods)
    #    base.class_eval do
    #      class << self
    #        include ClassLevelInheritableAttributes
    #        cattr_inheritable :column_models end
    #    end
  end

  module ClassMethods
    attr_reader :column_models
    attr_reader :field_options

    def column_model(name, fields = {})
      column_model = {}
      column_model[:name] = name
      column_model[:mapping] = fields[:mapping] || name
      column_model[:type] = fields[:type]
      column_model[:header] = fields[:header] || name.humanize
      column_model[:width] = fields[:width] || 100
      column_model[:sortable] = fields[:sortable] || true
      column_model[:dataIndex] = fields[:data_index] || name
      column_model[:hidden] = fields[:hidden] if fields[:hidden]
      column_model[:tpl] = fields[:tpl] if fields[:tpl]
      if fields[:type] == 'date'
        column_model[:dateFormat] = fields[:date_format] ? fields[:date_format] : 'd-m-Y'
      end
      column_model[:xtype] = fields[:xtype] if fields[:xtype]
      column_model[:trueText] = I18n.t(fields[:trueText]) if fields[:trueText]
      column_model[:falseText] = I18n.t(fields[:falseText]) if fields[:falseText]
      column_model[:method] = !column_names.include?(name)

      @column_models ||= []
      @column_models << column_model

      field_option = {}
      unless fields[:editor_opt].nil?
        fields[:editor_opt].keys.each do |key|
          field_option[key] = fields[:editor_opt][key]
        end
      end

      @field_options ||= {}
      @field_options[name.to_sym] = field_option
    end
    
    def column_store
      self.column_models.to_json(:only => [:name, :mapping, :type, :dateFormat])
    end

    def data_store
      all.map{|m| [m.name_en,m.id]}.to_json
    end
    
    def column_field
      column_string = @column_models.map do |c|
        tpl = c[:tpl] ? ", tpl:'{#{c[:tpl]}}'" : ""
        hidden = c[:hidden] ? ", hidden:'{#{c[:hidden]}}'" : ""
        if c[:hidden]
          c[:width] = 0
        end
        xtype = (c[:xtype]) ? ", xtype: '#{c[:xtype]}'" : ""
        trueText = (c[:trueText]) ? ", trueText: '#{c[:trueText]}'" : ""
        falseText = (c[:falseText]) ? ", falseText: '#{c[:falseText]}'" : ""
        renderer = ""
        editor = ""
        format = ""
        options = ""
        comboxbox = false
        data = []
        @field_options[c[:name].to_sym].each do |key, value|
          if key.to_s == "combobox"
            comboxbox = value
          elsif key.to_s == "data"
            data << value
          else
            clss = value.class.to_s
            if clss == "String"
              options += ", #{key}: '#{value}'"
            else
              options += ", #{key}: #{value}"
            end
          end
        end

        if c[:type] == "date"
          format = ", format: 'd-m-Y'"
          renderer = ", renderer: Ext.util.Format.dateRenderer('d-m-Y')"
          editor = ", editor: { xtype: 'datefield'#{options} }"
        end

        if c[:type] == "string"
          editor = ", editor: { xtype: 'textfield'#{options} }"
        end

        if c[:type] == "int"
          editor = ", editor: {
            xtype: 'numberfield',
            allowBlank: true,
            minValue: 0
          }"
        end

        if c[:type] == "boolean"
          if comboxbox
            editor = ", editor: {
              xtype: 'combo',
              store:
                new Ext.data.ArrayStore({
                fields: ['value','name'],
                data: #{data},
              }),
              displayField: 'name',
              valueField: 'value' #{options} }"
          else
            editor = ", editor: { xtype: 'textfield'#{options} }"
          end
        end

        "{
          id:'#{c[:name]}',
          header:'#{c[:header]}',
          width:#{c[:width]},
          sortable:'#{c[:sortable]}',
          dataIndex:'#{c[:dataIndex]}' #{xtype} #{trueText} #{falseText} #{format} #{renderer} #{editor} #{tpl} #{hidden}}"
      end
      return "[#{column_string.compact.join(",")}]"
    end
    
    def column_record
      self.column_models.to_json(:only => [:name, :type, :dateFormat])
    end

    def column_model_names
      @column_models.map{|a| a[:name]}
    end
  end
end
    
            
          
                