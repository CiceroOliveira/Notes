class NotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_stack

  respond_to :html
  respond_to :js, only: [:new, :create, :edit, :update]
  
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
    respond_with(@note) do |format|
      format.html { redirect_to(stacks_path) }
    end
  end

  def update
    @note = @stack.notes.find(params[:id])
    @note.update_attributes(params[:note])
    respond_with(@note) do |format|
      format.html { redirect_to(stacks_path) }
    end
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
