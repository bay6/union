class CommitsController < ApplicationController
  # GET /commits
  # GET /commits.json
  def index
    @commits = Commit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commits }
    end
  end

  # GET /commits/1
  # GET /commits/1.json
  def show
    @commit = Commit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commit }
    end
  end

  # GET /commits/new
  # GET /commits/new.json
  def new
    @commit = Commit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commit }
    end
  end

  # GET /commits/1/edit
  def edit
    @commit = Commit.find(params[:id])
  end

  # POST /commits
  # POST /commits.json
  def create
    @commit = Commit.new(params[:commit])

    respond_to do |format|
      if @commit.save
        format.html { redirect_to @commit, notice: 'Commit was successfully created.' }
        format.json { render json: @commit, status: :created, location: @commit }
      else
        format.html { render action: "new" }
        format.json { render json: @commit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /commits/1
  # PUT /commits/1.json
  def update
    @commit = Commit.find(params[:id])

    respond_to do |format|
      if @commit.update_attributes(params[:commit])
        format.html { redirect_to @commit, notice: 'Commit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commits/1
  # DELETE /commits/1.json
  def destroy
    @commit = Commit.find(params[:id])
    @commit.destroy

    respond_to do |format|
      format.html { redirect_to commits_url }
      format.json { head :no_content }
    end
  end
end
