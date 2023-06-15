class PostsController < ApplicationController
  before_action :today_date

  def today_date
    @today_date = Time.zone.now
  end

  def index
    @page_title ="スケジュール一覧"
    @posts = Post.all
  end

  def new
    @page_title ="スケジュール新規作成"
    @post = Post.new
  end

  def create
     @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash[:notice] = "スケジュールを登録できませんでした"
      render "new"
    end  
  end

  def show
    @page_title ="スケジュール詳細"
    @post = Post.find(params[:id])
  end

  def edit
    @page_title ="スケジュール編集"
    @post = Post.find(params[:id])
  end

   def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "スケジュールID「#{@post.id}」の情報を更新しました"
      redirect_to :post
    else
      flash.now[:failure] ="スケジュールID「#{@post.id}」の情報を更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end

  private 

  def post_params
    params.require(:post).permit(
      :title,
      :start_at,
      :end_at,
      :is_all_day,
      :memo
    )
  end

end
