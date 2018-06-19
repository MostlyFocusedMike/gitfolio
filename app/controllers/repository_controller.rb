class RepositoryController < ApplicationController
  protect_from_forgery except: :create
  def index
    @repositories = Repository.all
    # render html: index template
    render json: @repositories
  end

  def create
    @repository = Repository.new(repository_params)
    @repository.languages = repository_languages
    @repository.save
    render json: @repository
  end

  private

  def repository_params
    params.require(:repository).permit(:name, :url, :languages)
  end

  ### Depends on if necessary ###
  # def repository_languages
  #   Languages.find_or_create_by(name: params[:repository][:languages])
  # end
end
