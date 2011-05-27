class StacksController < ApplicationController
  
  def show
    @stack = Stack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stack }
    end
  end
  
  def index
    @stacks = Stack.desc(:created_at)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end
  
  # GET /stacks/new
  # GET /stacks/new.xml
  def new
    @stack = Stack.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stack }
      format.js
    end
  end
  
  # POST /stacks
  # POST /stacks.xml
  def create
    @stack = Stack.new(params[:stack])
    puts @stack
    respond_to do |format|
      if @stack.save
        format.html { redirect_to(root_url, :notice => 'Note was successfully created.') }
        format.xml  { render :xml => @stack, :status => :created, :location => @stack }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stack.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @stack = Stack.find(params[:id])
    @stack.destroy

    respond_to do |format|
      format.html { redirect_to(stacks_path) }
      format.xml  { head :ok }
    end
  end
  
  def edit
    @stack = Stack.find(params[:id])
  end

  def update
    @stack = Stack.find(params[:id])

    respond_to do |format|
      if @stack.update_attributes(params[:stack])
        format.html { redirect_to(stacks_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stack.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
