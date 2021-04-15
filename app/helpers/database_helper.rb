module DatabaseHelper

  def field_for_column(form, record, column_name, type, options={})
    case type.to_s
    when "datetime" then form.datetime_select(column_name, options)
    when "date" then form.date_select(column_name, {year: 2000})
    #when "date" then form.date_select(column_name, options.merge({year: 2000}))
    when "time" then form.time_select(column_name, options)
    when "float" then form.number_field(column_name, options.merge({step: 0.01}))
    when "integer" then form.number_field(column_name, options)
    when "string" then form.text_field(column_name, options)
    when "text" then form.text_area(column_name, options)
    when "boolean" then form.check_box(column_name, options)
    else
      raise "Error invalid type: #{type}."
    end
  end
  def render_table(model, options={})
    # TODO: HIDE_ALL BY DEFAULT VS SHOW_ALL BY DEFAULT
    # Sois tu hide_all par défault, et la tu fais show_tatatitata
    # ou bien tu show_all par défault, et la tu fais hide_tatatitata
    columns = model.columns.reject {|t| t.name == "updated_at" or t.name == "created_at"}.map {|t| [t.name, t.type]}
    #columns << ["created_at", :datetime]
    #columns << ["updated_at", :datetime]
    render file: "database/_database_table", locals: {model: model, columns: columns, options: options}
  end
end
