class StacksController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  respond_to :js, :only => [:new, :create]
  
  def show
    @stack = Stack.find(params[:id])
    respond_with @stack
  end
  
  def index
    @stacks = current_user.stacks
    respond_with @stacks
  end
  
  def new
    @stack = Stack.new
    respond_with @stack
  end
  
  def create
    @stack = Stack.new(params[:stack])
    @stack.user_id = current_user.id
    @stack.save
    respond_with(@stack, :location => stacks_path)
  end
  
  def destroy
    @stack = Stack.find(params[:id])
    @stack.destroy
    respond_with([@stack, @note], :location => stacks_path)
  end
  
  def edit
    @stack = Stack.find(params[:id])
  end

  def update
    @stack = Stack.find(params[:id])
    @stack.update_attributes(params[:stack])
    respond_with @stack do |format|
      format.html { redirect_to(stacks_path) }
    end
  end
  
end
