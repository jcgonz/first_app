class BusinessLinesController < ApplicationController
  # GET /business_lines
  # GET /business_lines.xml
  def index
    @business_lines = BusinessLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @business_lines }
    end
  end

  # GET /business_lines/1
  # GET /business_lines/1.xml
  def show
    @business_line = BusinessLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @business_line }
    end
  end

  # GET /business_lines/new
  # GET /business_lines/new.xml
  def new
    @business_line = BusinessLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @business_line }
    end
  end

  # GET /business_lines/1/edit
  def edit
    @business_line = BusinessLine.find(params[:id])
  end

  # POST /business_lines
  # POST /business_lines.xml
  def create
    @business_line = BusinessLine.new(params[:business_line])

    respond_to do |format|
      if @business_line.save
        format.html { redirect_to(@business_line, :notice => 'Business line was successfully created.') }
        format.xml  { render :xml => @business_line, :status => :created, :location => @business_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @business_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /business_lines/1
  # PUT /business_lines/1.xml
  def update
    @business_line = BusinessLine.find(params[:id])

    respond_to do |format|
      if @business_line.update_attributes(params[:business_line])
        format.html { redirect_to(@business_line, :notice => 'Business line was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @business_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /business_lines/1
  # DELETE /business_lines/1.xml
  def destroy
    @business_line = BusinessLine.find(params[:id])
    @business_line.destroy

    respond_to do |format|
      format.html { redirect_to(business_lines_url) }
      format.xml  { head :ok }
    end
  end
end
