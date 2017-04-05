class HeroesController < ApplicationController
  before_filter :authenticate
  before_action :set_hero, only: [:show, :update, :destroy]

  # GET /heroes
  def index
    @heroes = Heroe.all

    render json: @heroes
  end

  # GET /heroes/1
  def show
    render json: @hero
  end

  # POST /heroes
  def create
    @hero = Heroe.new(hero_params)

    if @hero.save
      render json: @hero, status: :created, location: @hero
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heroes/1
  def update
    if @hero.update(hero_params)
      render json: @hero
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heroes/1
  def destroy
    @hero.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Heroe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hero_params
      params.require(:hero).permit(:name, :real_name)
    end

    protected

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username=="my_user" && password == "my_password"
      end
    end

end
