class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path, notice: "プロフィール登録が完了しました"
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path, notice: "プロフィールが更新されました"
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :detail, :image)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
