class VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]

  def show
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to @video, notice: "Vídeo criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: "Vídeo atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path, notice: "Vídeo removido com sucesso."
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :video)
  end
end
