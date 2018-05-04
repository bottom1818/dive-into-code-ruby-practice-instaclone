class InstacloneContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_instaclone_content, only: [:show, :edit, :update, :destroy]

  def index
      @instaclone_contents = InstacloneContent.all
      @users = User.all
      
  end
  
  def new
    if params[:back]
      @instaclone_content = InstacloneContent.new(instaclone_contents_params)
      @instaclone_content.image.retrieve_from_cache! params[:cache][:image]
    else
      @instaclone_content = InstacloneContent.new
    end
    
  end  

  
  def create
    @instaclone_content = InstacloneContent.new(instaclone_contents_params)
    if !params[:cache].nil? && params[:cache][:image].present?
      @instaclone_content.image.retrieve_from_cache!  params[:cache][:image]
    end
    # @instaclone_content.user_id = current_user.id
    @instaclone_content.user = current_user
    
    if @instaclone_content.save
      InstacloneContentsMailer.instaclone_contents_mail(@instaclone_content).deliver
      redirect_to instaclone_contents_path, notice: "投稿しました！"
      #NoticeMailer.sendmail_instaclone_content(@instaclone_content).deliver
    else
      render 'new'
    end
  end

  def edit
    @instaclone_content = InstacloneContent.find(params[:id])
  end
  
  def update
    if @instaclone_content.update(instaclone_contents_params)
      # 編集したことをメールで通知します
      InstacloneContentsMailer.instaclone_contents_mail(@instaclone_content).deliver
      redirect_to instaclone_contents_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    # @instaclone_content = InstacloneContent.find(params[:id])
    @instaclone_content.destroy
    InstacloneContentsMailer.instaclone_contents_mail(@instaclone_content).deliver
    redirect_to instaclone_contents_path, notice: "投稿を削除しました！"
  end

  def confirm
    @instaclone_content = InstacloneContent.new(instaclone_contents_params)
    @instaclone_content.user = current_user
    if @instaclone_content.invalid?
      render:new
    end
  end

 private
  def instaclone_contents_params
    params.require(:instaclone_content).permit(:title, :image, :image_cache, :content, :user_id)
  end
  
  def set_instaclone_content
   @instaclone_content = InstacloneContent.find(params[:id])
  end
  
end

