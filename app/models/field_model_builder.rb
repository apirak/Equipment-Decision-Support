module FieldModelBuilder
  def self.included(base)
    base.extend(ClassMethods)

    def form_items
      self.class.field_models.each do |f|
        f[:value] = attributes[f[:field_name]] || ""
      end
    end

    def form_fields
      form_items.to_json(:except => [ :tab, :group, :field_name ]).gsub(/\"(listeners|handler|scope|store)\":\s?\"([a-zA-Z \[\]\(\)]+)\"/, '"\1":\2')
    end

    def tab_form_field(tab_name)
      items = form_items.select { |m| m[:tab][:name]==tab_name }
      items.to_json(:except => [ :tab, :group, :field_name ])
    end

    def group_form_field(group_name)
      items = form_items.select { |m| m[:group][:name]==group_name }
      items.to_json(:except => [ :tab, :group, :field_name ])
    end

    def tab_form_field(tab_name)
      items = form_items.select { |m| m[:tab][:name]==tab_name }
      items.to_json(:except => [ :tab, :group, :field_name ])
    end

    def group_form_field(group_name)
      items = form_items.select { |m| m[:group][:name]==group_name }
      items.to_json(:except => [ :tab, :group, :field_name ])
    end

    def form_field(tab_name, group_name)
      items = form_items.select { |m| m[:tab][:name]==tab_name && m[:group][:name]==group_name }
      items.to_json(:except => [ :tab, :group, :field_name ])
    end

    def group_title(tab_name, group_name)
      item = form_items.select { |m| m[:tab][:name]==tab_name && m[:group][:name]==group_name } .first
      return item[:group][:title]
    end

    def tab_title(tab_name)
      item = form_items.select { |m| m[:tab][:name]==tab_name } .first
      return item[:tab][:title]
    end
  end
    
  module ClassMethods

    #
    # Field model is flat array
    # [
    #  {:name => :firstname, :tab => {:name => :A}, :group => {:name => a}}
    #  {:name => :lastname, :tab => {:name => :A}, :group => {:name => b}}
    #  {:name => :username, :tab => {:name => :B}, :group => {:name => a}}
    #  {:name => :password, :tab => {:name => :B}, :group => {:name => b}}
    # ]
    #
    #
    # Perfect tabs object
    # @tabs = [
    #  {:name => "A",
    #   :groups => [{:name => "a",
    #                :fields => [...]},
    #               {:name => "b",
    #                :fields => [...]}],
    #  {:name => "B",
    #   :groups => [{:name => "a",
    #                :fields => [...]},
    #              {:name => "b",
    #                :fields => [...]}]
    # ]
    #

    attr_reader :tab, :group, :field_models
    attr_reader :tabs
    
    def field_tab(name, options = {}, &block)
      tab = {}
      tab[:name] = name
      tab[:groups] = []
      options.keys.each do |key|
        tab[key] = options[key]
      end
      # tab[:title] = options[:title] || name.humanize

      @tab = tab
      @tabs ||= []
      @tabs << tab
      block.call
    end

    def field_group(name, options = {}, &block)
      group = {}
      group[:name] = name

      group[:fields] = []
      options.keys.each do |key|
        group[key] = options[key]
      end
      # group[:title] = options[:title] || name.humanize

      @group = group
      @tabs.last[:groups] << group
      block.call
    end

    def field_model(field_name, options = {})
      @field_models ||= []
      field_model = {}
      field_model[:tab] = @tab
      field_model[:group] = @group
      field_model[:field_name] = field_name
      field_model[:name] = "#{self.class_name.downcase}[#{field_name}]"
      label_name = field_name.gsub("_id","")

      if options[:xtype] == "combo"
        options[:hiddenName] = field_model[:name]
        options[:width] = options[:width] || 150
        options[:emptyText] = options[:emptyText] || "Select #{label_name.humanize}"
        options[:store] = options[:store] || "store#{label_name.camelcase}"
        options[:displayField] = options[:displayField] || 'name'
        options[:valueField] = options[:valueField] || 'value'
        options[:selectOnFocus] = options[:selectOnFocus] || true
        options[:mode] = options[:mode] || 'local'
        options[:editable] = options[:editable] || false
        options[:triggerAction] = options[:triggerAction] || 'all'
        options[:fieldLabel] = options[:fieldLabel] || label_name.humanize
        options[:allowBlank] = options[:allowBlank] || true
        options[:emptyText] = options[:emptyText] || 'Select mode'
      end

      options.keys.each do |key|
        field_model[key] = options[key] #.gsub("_\"","").gsub("\"_","")
      end
      field_model[:fieldLabel] ||= field_name.humanize

      @field_models << field_model
      @tabs.last[:groups].last[:fields] << field_model if @tabs
    end
  end
end
          