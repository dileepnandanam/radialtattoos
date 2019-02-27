class TatoosController < ApplicationController
  before_action :set_tatoo, only: [:show, :edit, :update, :destroy, :purchase_start, :purchase_complete, :toggle_premium]
  before_action :access_controll, only: [:new, :edit, :update, :destroy, :dashboard]
  # GET /tatoos
  # GET /tatoos.json
  def index
    @tatoos = Tatoo.where(premium: false).paginate(per_page: 12, page: params[:page])
  end

  def premium
    @tatoos = Tatoo.where(premium: true).paginate(per_page: 12, page: params[:page])
    render 'index'
  end

  # GET /tatoos/1
  # GET /tatoos/1.json
  def show
    @tatoos = Tatoo.all
  end

  # GET /tatoos/new
  def new
    @tatoo = Tatoo.new
  end

  # GET /tatoos/1/edit
  def edit
  end

  # POST /tatoos
  # POST /tatoos.json
  def create
    @tatoo = Tatoo.new(tatoo_params)

    respond_to do |format|
      if @tatoo.save
        format.html { redirect_to @tatoo, notice: 'Tatoo was successfully created.' }
        format.json { render :show, status: :created, location: @tatoo }
      else
        format.html { render :new }
        format.json { render json: @tatoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tatoos/1
  # PATCH/PUT /tatoos/1.json
  def update
    respond_to do |format|
      if @tatoo.update(tatoo_params)
        format.html { redirect_to tatoos_path, notice: 'Tatoo was successfully updated.' }
        format.json { render :show, status: :ok, location: @tatoo }
      else
        format.html { render :edit }
        format.json { render json: @tatoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tatoos/1
  # DELETE /tatoos/1.json
  def destroy
    @tatoo.destroy
    respond_to do |format|
      format.html { head :no_content }
      format.json { head :no_content }
    end
  end

  def purchase_start
    im_client = Instamojo::API.new("bea354f9f9808d2bc2e5d5ebbe7ff3d5", "0950fc7e9fa1c27462c075d81f956359").client
    payment_request = im_client.payment_request({
      amount: 100,
      purpose: 'Product payment',
      redirect_url: purchase_complete_tatoo_url(@tatoo)
    })
    payment_request.reload!
    session[:im_payment_request_id] = payment_request.original["id"]

    redirect_to payment_request.original["longurl"]
  end

  def purchase_complete
    if session[:im_payment_request_id].present? && session[:im_payment_request_id] == params[:payment_request_id]
      send_data open('http:' + @tatoo.image.url(:original)).read, disposition: 'inline', filename: 'tattoo.png'
    end
  end

  def mass_upload_form

  end

  def mass_upload
    mass_upload_params = params.require(:mass_upload).permit(image: [])
    mass_upload_params[:image].each do |file_data|
      Tatoo.new(image: file_data).save
    end
    redirect_to tatoos_path
  end

  def toggle_premium
    if @tatoo.premium
      @tatoo.update_attribute(:premium, false)
      @state = 'Free'
    else
      @tatoo.update_attribute(:premium, true)
      @state = 'Premium'
    end
    render 'toggle_premium', layout: false
  end

  def dashboard
    @tatoos = Tatoo.order('image_file_name').all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tatoo
      @tatoo = Tatoo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tatoo_params
      params.require(:tatoo).permit(:premium, :image)
    end

    def access_controll
      if current_user.nil? || !current_user.admin
        redirect_to root_path
      end
    end
end
