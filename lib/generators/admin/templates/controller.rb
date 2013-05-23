<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class Admin::<%= controller_class_name %>Controller < AdminController
  
  # GET /admin<%= route_url %>
  # GET /admin<%= route_url %>.json
  def index
    @<%= plural_table_name %> = ::<%= orm_class.all(class_name) %>

    respond_to do |format|
      format.html # index.html.erb
      format.json { render <%= key_value :json, "@#{plural_table_name}" %> }
    end
  end

  # GET /admin<%= route_url %>/1
  # GET /admin<%= route_url %>/1.json
  def show
    @<%= singular_table_name %> = ::<%= orm_class.find(class_name, "params[:id]") %>

    respond_to do |format|
      format.html # show.html.erb
      format.json { render <%= key_value :json, "@#{singular_table_name}" %> }
    end
  end

  # GET /admin<%= route_url %>/new
  # GET /admin<%= route_url %>/new.json
  def new
    @<%= singular_table_name %> = ::<%= orm_class.build(class_name) %>

    respond_to do |format|
      format.html # new.html.erb
      format.json { render <%= key_value :json, "@#{singular_table_name}" %> }
    end
  end

  # GET /admin<%= route_url %>/1/edit
  def edit
    @<%= singular_table_name %> = ::<%= orm_class.find(class_name, "params[:id]") %>
  end

  # POST /admin<%= route_url %>
  # POST /admin<%= route_url %>.json
  def create
    @<%= singular_table_name %> = ::<%= orm_class.build(class_name, "params[:#{singular_table_name}], as: :admin") %>

    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to admin_<%= singular_table_name %>_path(@<%= singular_table_name %>), <%= key_value :notice, "'#{human_name} was successfully created.'" %> }
      else
        format.html { render <%= key_value :action, '"new"' %> }
      end
    end
  end

  # PUT /admin<%= route_url %>/1
  # PUT /admin<%= route_url %>/1.json
  def update
    @<%= singular_table_name %> = ::<%= orm_class.find(class_name, "params[:id]") %>

    respond_to do |format|
      if @<%= orm_instance.update_attributes("params[:#{singular_table_name}], as: :admin") %>
        format.html { redirect_to admin_<%= singular_table_name %>_path(@<%= singular_table_name %>), <%= key_value :notice, "'#{human_name} was successfully updated.'" %> }
      else
        format.html { render <%= key_value :action, '"edit"' %> }
      end
    end
  end

  # DELETE /admin<%= route_url %>/1
  # DELETE /admin<%= route_url %>/1.json
  def destroy
    @<%= singular_table_name %> = ::<%= orm_class.find(class_name, "params[:id]") %>
    @<%= orm_instance.destroy %>

    respond_to do |format|
      format.html { redirect_to admin_<%= index_helper %>_url }
      format.json { head :no_content }
    end
  end
end
<% end -%>
