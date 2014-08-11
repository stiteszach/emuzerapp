class ResumesController < ApplicationController

  layout 'dashboard', :only => [:index, :new, :edit, :update]
  layout 'resume_view', :only => [:show]

  before_filter :authenticate_user!, :except => [:show]  


  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = current_user.resumes
    @userInfo = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resumes }
    end
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    begin
      @resume = Resume.find(params[:id])
    rescue 
      @share = Share.find_by_url(params[:id])
      @resume = @share.resume
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resume }
    end
  end

  # GET /resumes/new
  # GET /resumes/new.json
  def new
    @resume = Resume.new
    @userInfo = current_user

    1.times { @resume.employments.build }
    1.times { @resume.educations.build }
    1.times { @resume.skills.build }
    1.times { @resume.achievements.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume }
    end
  end

  # GET /resumes/1/edit
  def edit
    @resume = Resume.find(params[:id])
    @userInfo = current_user
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(params[:resume])
    @resume.user = current_user

    respond_to do |format|
      if @resume.save
        format.html { redirect_to :action => 'show', :id => @resume.id }
        format.json { render json: @resume, status: :created, location: @resume }
      else
        format.html { render action: "new" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resumes/1
  # PUT /resumes/1.json
  def update
    @resume = Resume.find(params[:id])

    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to resumes_url }
      format.json { head :no_content }
    end
  end

  def share
    @resume = Resume.find(params[:id])

    @share = Share.new
    @share.resume_id = @resume.id 

    @share.save

    redirect_to action: 'index'
  end

  def template
    @resume = Resume.find(params[:id]);
  end

  def update_template
    @resume = Resume.find(params[:id])
    @resume.update_attribute :template, params[:template]
    flash[:notice] = "yay you did it!"
    redirect_to @resume
    # respond_to do |format|
    #   if @resume.update_attribute(:template, params[:template])
    #     format.html { redirect_to @resume, notice: 'Your template was successfully saved!' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "template" }
    #     format.json { render json: @resume.errors, status: :unprocessable_entity }
    #   end
    # end
  end

end
