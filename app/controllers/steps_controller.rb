class StepsController < ApplicationController
  before_filter :get_todo
  # GET /steps
  # GET /steps.json
  def index
    # @todo = Todo.find(params[:todo_id])
    @steps = @todo.steps

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @steps }
    end
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
    # @todo = Todo.find(params[:todo_id])
    @step = Step.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @step }
    end
  end

  # GET /steps/new
  # GET /steps/new.json
  def new
    # @todo = Todo.find(params[:todo_id])
    @step = Step.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @step }
    end
  end

  # GET /steps/1/edit
  def edit
    # @todo = Todo.find(params[:todo_id])
    @step = Step.find(params[:id])
  end

  # POST /steps
  # POST /steps.json
  def create
    # @todo = Todo.find(params[:todo_id])
    @step = @todo.steps.create(params[:step])

    respond_to do |format|
      if @step.save
        format.html { redirect_to [@todo, @step], notice: 'Step was successfully created.' }
        format.json { render json: @step, status: :created, location: @step }
      else
        format.html { render action: "new" }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /steps/1
  # PUT /steps/1.json
  def update
    @todo = Todo.find(params[:todo_id])
    @step = Step.find(params[:id])

    respond_to do |format|
      if @step.update_attributes(params[:step])
        @step.todo.check_complete_status
        format.html { redirect_to todos_path, status: 303, notice: 'Step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    # @todo = Todo.find(params[:todo_id])
    @step = Step.find(params[:id])
    @step.destroy

    respond_to do |format|
      format.html { redirect_to todo_steps_url(@todo) }
      format.json { head :no_content }
    end
  end

  protected
    def get_todo
      @todo = current_user.todos.find(params[:todo_id])
    end
end
