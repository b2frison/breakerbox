class BreakersController < ApplicationController
  # GET /breakers
  # GET /breakers.json
  def index
    @breakers = Breaker.all
    @json = Breaker.all.to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @breakers }
    end
  end

  # GET /breakers/1
  # GET /breakers/1.json
  def show
    @breaker = Breaker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @breaker }
    end
  end

  # GET /breakers/new
  # GET /breakers/new.json
  def new
    @breaker = Breaker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @breaker }
    end
  end

  # GET /breakers/1/edit
  def edit
    @breaker = Breaker.find(params[:id])
  end

  # POST /breakers
  # POST /breakers.json
  def create
    @breaker = Breaker.new(params[:breaker])

    respond_to do |format|
      if @breaker.save
        format.html { redirect_to @breaker, notice: 'Breaker was successfully created.' }
        format.json { render json: @breaker, status: :created, location: @breaker }
      else
        format.html { render action: "new" }
        format.json { render json: @breaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /breakers/1
  # PUT /breakers/1.json
  def update
    @breaker = Breaker.find(params[:id])

    respond_to do |format|
      if @breaker.update_attributes(params[:breaker])
        format.html { redirect_to @breaker, notice: 'Breaker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @breaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breakers/1
  # DELETE /breakers/1.json
  def destroy
    @breaker = Breaker.find(params[:id])
    @breaker.destroy

    respond_to do |format|
      format.html { redirect_to breakers_url }
      format.json { head :no_content }
    end
  end
end
