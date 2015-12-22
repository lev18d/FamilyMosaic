class ContentsController < ApplicationController
	  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find(params[:id])
    @post = Post.find(@content.post_id)
    @profile = Profile.friendly.find(@post.profile_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/new
  # GET /contents/new.json
  def new
    @post = Post.find(params[:post_id])
    @content = @post.contents.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
    @post = Post.find(@content.post_id)
    # @content = content.find(params[:id])
  end

  # POST /contents
  # POST /contents.json
  # Only used for timeline post, thus, customized to timeline post attach files
  def create
    # content are always attached with dropzone,
    # thus, pass in the file attributes directly
    @content = Content.new(file: params[:file])
    if @content.save
      render :json => [{:message => "success", :content_id => @content.id}], :status => 200
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end
  # PUT /contents/1
  # PUT /contents/1.json
  def update
    @content = Content.find(params[:id])
    if @content.update_attributes(content_params)
      redirect_to content_path, :notice =>"Your content has been updated"
    else
      render "edit"
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  # used when delete a dropzone pic
  # need fix it for actually deleting.
  def destroy
    @content = Content.find(params[:id])
    # @post = Post.find(@content.post_id)
    # @profile = Profile.find(@post.profile_id)
    @content.destroy
    # respond_to do |format|
    #   format.html { redirect_to timeline_path(@profile) }
    #   format.js
    # end
  end

  def make_default
    @content = Content.find(params[:id])
    @post = Post.find(params[:post_id])
    @post.cover = @content.id
    @post.save
    respond_to do |format|
      format.js
    end
  end

  # private
  #   def content_params
  #     params.require(:content).permit(:description, :post_id, :date, :file)
  #   end
end
