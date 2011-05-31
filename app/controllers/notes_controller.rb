class NotesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /notes
  # GET /notes.xml
  def index
    @stack = Stack.find(params[:stack_id])
    @notes = @stack.notes.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    @stack = Stack.find(params[:stack_id])
    @note = @stack.notes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
      format.js
    end
  end

  # GET /notes/1/edit
  def edit
    @stack = Stack.find(params[:stack_id])
    @note = @stack.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.xml
  def create
    @stack = Stack.find(params[:stack_id])
    @note = @stack.notes.create!(params[:note])

    respond_to do |format|
      if @stack.save
        format.html { redirect_to(stacks_path, :notice => 'Note was successfully created.') }
        format.xml  { render :xml => @stack, :status => :created, :location => @note }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    @stack = Stack.find(params[:stack_id])
    @note = @stack.notes.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to(stacks_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    @stack = Stack.find(params[:stack_id])
    @note = @stack.notes.where(_id: params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(stacks_path) }
      format.xml  { head :ok }
    end
  end
end
