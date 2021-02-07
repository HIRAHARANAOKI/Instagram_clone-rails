class LikesController < ApplicationController
  # サインイン済みユーザーのみにアクセス許可を与える
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    if @like.save
      # いいねを押したらリアルタイムでビューを反映させるためにフォーマットをJS形式でレスポンスを返す
      respond_to :js
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @post = @like.post
    if @like.destroy
      respond_to :js
    end
  end

  private
  def like_params
    params.permit(:post_id)
  end
end
