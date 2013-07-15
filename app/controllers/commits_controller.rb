class CommitsController < InheritedResources::Base
  def create
    super do |format|
      if @commit.save
        format.html { redirect_to @commit, notice: 'Commit was successfully created.' }
        format.json { render json: @commit, status: :created, location: @commit }
      else
        format.html { render action: "new" }
        format.json { render json: @commit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    super do |format|
      if @commit.update_attributes(params[:commit])
        format.html { redirect_to @commit, notice: 'Commit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    super do |format|
      format.html { redirect_to commits_url }
      format.json { head :no_content }
    end
  end
end
