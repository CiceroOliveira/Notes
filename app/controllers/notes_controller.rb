class NotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_stack

  respond_to :html
  respond_to :js, only: [:new, :create]
  
  def index
    @notes = @stack.notes.all
    respond_with(@notes)
  end

  def show
    @note = @stack.notes.find(params[:id])
    respond_with(@note)
  end

  def new
    @note = @stack.notes.new
    respond_with(@note)
  end

  def edit
    @note = @stack.notes.find(params[:id])
    respond_with(@note)
  end

  def create
    @note = @stack.notes.create!(params[:note])
    respond_with([@stack, @note], :location => stacks_path)
      

    # respond_to do |format|
    #   if @stack.save
    #     format.html { redirect_to(stacks_path, :notice => 'Note was successfully created.') }
    #     format.xml  { render :xml => @stack, :status => :created, :location => @note }
    #     format.js
    #   else
    #     format.html { render :action => "new" }
    #     format.xml  { render :xml => @stack.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  def update
    @note = @stack.notes.find(params[:id])
    respond_with(@note)
    # respond_to do |format|
    #   if @note.update_attributes(params[:note])
    #     format.html { redirect_to(stacks_path) }
    #     format.xml  { head :ok }
    #   else
    #     format.html { render :action => "edit" }
    #     format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @note = @stack.notes.where(_id: params[:id]) 
    @note.destroy
    respond_with([@stack, @note], :location => stacks_path)
  end
  
  private
  
    def load_stack
      @stack = Stack.find(params[:stack_id])
    end
end
