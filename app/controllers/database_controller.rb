class DatabaseController < ApplicationController

  before_action :set_model, only: [:index, :show, :edit, :new, :update, :create, :destroy]

  def dashboard
    Rails.application.eager_load!
    @models = ApplicationRecord.descendants
  end

  def create_column
    Rails.application.eager_load!
    @models = ApplicationRecord.descendants
    @model = @models.find {|m| m.name == params[:model_name]}
    name = params[:name] # TODO: Sanitize name
    type = params[:type] # TODO: Sanitize type
    out = `rails g migration add_#{name}_to_#{@model.table_name} #{name}:#{type} && rails db:migrate`
    render :index # TODO: Show the schema that was modified
  end
  
  def create_table
    name = params[:name] # TODO: Sanitize name
    out = `rails g model #{name} && rails db:migrate`
    index
    render :index
  end

  def index
    # FIXME: Check for other extensions latter
    if not params[:no_redirect] and Rails.root.join('app').join('views').join(@model.table_name).join("index.html.erb").exist?
      instance_variable_set("@#{@model.table_name}", @model.all)
      render "#{@model.table_name}/index"
    else
      set_columns(@model)
    end
  end

  def show
    # FIXME: Check for other extensions latter
    if not params[:no_redirect] and Rails.root.join('app').join('views').join(@model.table_name).join("show.html.erb").exist?
      instance_variable_set("@#{@model.name.downcase}", @model.find(params[:id]))
      render "#{@model.table_name}/show"
    else
      @record = @model.find(params[:id])
    end
  end
  
  def edit
    # FIXME: Check for other extensions latter
    if not params[:no_redirect] and Rails.root.join('app').join('views').join(@model.table_name).join("edit.html.erb").exist?
      instance_variable_set("@#{@model.name.downcase}", @model.find(params[:id]))
      render "#{@model.table_name}/edit"
    else
      @record = @model.find(params[:id])
    end
  end

  def new
    # FIXME: Check for other extensions latter
    if not params[:no_redirect] and Rails.root.join('app').join('views').join(@model.table_name).join("new.html.erb").exist?
      instance_variable_set("@#{@model.name.downcase}", @model.new)
      render "#{@model.table_name}/new"
    else
      @record = @model.new
    end
  end
    
  # FIXME: Test the the find model name is good
  # well anyway it will crash on model.name

  def update
    record = @model.find(params[:id])
    ActionController::Parameters.permit_all_parameters = true
    model_params = params.require(record.model_name.param_key.to_sym)
    
    #record.update!(record.permit(model_params))
    #redirect_to request.referrer

    respond_to do |format|
      if record.update(model_params)
        format.html { redirect_to record, notice: 'Record was successfully updated.' }
        format.json { render json: record }
      else
        format.html { render :edit }
        format.json { render json: record.errors.full_messages, status: :unprocessable_entity }
      end
    end

    #render json: record.errors, status: :unprocessable_entity
    #redirect_to record TODO: If request.referrer is edit_path, than render show
  end

  def create
    tmp = @model.new
    ActionController::Parameters.permit_all_parameters = true
    model_params = params.require(tmp.model_name.param_key.to_sym)
    # I broke database record, no more scope
    record = @model.new(model_params)

    respond_to do |format|
      if record.save
        format.html { redirect_to record, notice: 'Record was successfully created.' }
        format.json { render json: record }
      else
        format.html { render :new }
        format.json { render json: record.errors.full_messages, status: :unprocessable_entity }
      end
    end

    #render json: record.errors, status: :unprocessable_entity
    #redirect_to request.referrer
    # TODO: Show errors on save
    #redirect_to record TODO: If request.referrer is new_path, than render show
  end
  
  def destroy
    record = @model.find(params[:id])
    record.destroy!

    # TODO: Handle destroy error
    respond_to do |format|
      format.html { redirect_to polymorphic_path(@model), notice: 'Record was successfully destroyed.' }
      format.json { render plain: "OK" }
    end
    #redirect_to polymorphic_path(@model, no_redirect: params[:no_redirect]), method: :get
  end

  def show_table
    Rails.application.eager_load!
    @models = ApplicationRecord.descendants
    @model = @models.find {|m| m.name == params[:name]}
    set_columns(@model)
    # TODO: Make this work with different extensions too
    @view_exists = Rails.root.join("app/views/#{@model.name.pluralize.downcase}/index.html.erb").exist? 
    if @view_exists and not params[:no_redirect]
      redirect_to controller: "#{@model.name.pluralize.downcase}", action: :index
    end
    #@columns = @model.columns.map {|(k,v)| (k,v.type.to_s)}
  end
  
  def edit_table
    Rails.application.eager_load!
    @models = ApplicationRecord.descendants
    @model = @models.find {|m| m.name == params[:name]}
    set_columns(@model)
  end

  def set_columns(model)
    @columns = model.columns.reject {|t| t.name == "updated_at" or t.name == "created_at"}.map {|t| [t.name, t.type]}
    #model.columns.each do |c|
    #  @columns << [c.name, c.type] unless c.name == "created_at" or c.name == "updated_at"
    #end
    @columns << ["created_at", :datetime]
    @columns << ["updated_at", :datetime]
  end

  def save_all
    logger.info "--- Inside save_all ---"
    logger.info "Params: #{params}"
    logger.info "Request: #{request}"
  end

private
  def set_model
    Rails.application.eager_load!
    @models = ApplicationRecord.descendants
    name = /^[a-zA-Z_]+/.match(request.original_fullpath[1..-1])
    @model = @models.find {|m| m.table_name.to_s == name.to_s }
  end

end
