# frozen_string_literal: true

# BEGIN
require 'octokit'
# END

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    @repository = Repository.new(permitted_params)

    if @repository.save
      client = Octokit::Client.new
      repo = Octokit::Repository.from_url(@repository.link)
      repo_data = client.repository(repo)

      @repository.update!(
        repo_name: repo_data[:name],
        owner_name: repo_data[:owner][:login],
        description: repo_data[:description],
        default_branch: repo_data[:default_branch],
        watchers_count: repo_data[:watchers_count],
        language: repo_data[:language],
        repo_created_at: repo_data[:created_at],
        repo_updated_at: repo_data[:updated_at]
      )
      redirect_to @repository, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :new, status: :unprocessable_entity
    end
    # END
  end

  def edit
    @repository = Repository.find params[:id]
  end

  def update
    @repository = Repository.find params[:id]

    if @repository.update(permitted_params)
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
