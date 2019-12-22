class MymailsController < ApplicationController
  before_action :set_mymail, only: [:show, :edit, :update, :destroy]
  before_action :create_mail, only: [:solicita_teste]

  # GET /mymails
  # GET /mymails.json
  def index
    @mymails = Mymail.all
  end

  # GET /mymails/1
  # GET /mymails/1.json
  def show
  end



  def get_lista
    if Mymail.last.expired- DateTime.now <=0
      redirect_to root_path
    else
      redirect_to UrlLink.last.url
    end
  end

  def create_mail 
    @g = GuerrillaMail.new if @g.nil?
  end

  def solicita_teste
    @email = @g['email_addr']
    @wpp = 1.times.map{ "859" + Random.rand(11111111..99999999).to_s }[0]
    @g.check_email #limpar emails nao lidos

    puts("Solicitando teste para")
    puts(@email)

    Mymail.delete_all
    m = Mymail.new(email: @g['email_addr'], expired: 6.hours.from_now)
    m.save
  end

 def check()
    render html: "<script>alert('Lista atualizada - Favor atualizar canais na TV')</script>".html_safe
    inbox = nil
    lista = GuerrillaMail.new(Mymail.last.email)
    puts("Ultimo gravado")
    puts(Mymail.last.email)



    puts("Email check")
    puts(lista['email_addr'])
    sleep 10
    i = 0
    loop do
      sleep 20
      i += 1
      puts i

      inbox = lista.check_email
      puts(inbox)

      if inbox["list"].size >0
        break       # this will cause execution to exit the loop
      end

      if i == 5
        break
      end
    end

    
    msg = lista.fetch_email(inbox["list"][0]["mail_id"])
    puts(msg)

    link = Nokogiri::HTML(msg.to_s).search('span')[2].xpath('string(.)')
    puts(link)
    UrlLink.delete_all
    l = UrlLink.new(url: link)
    l.save

  end
  # GET /mymails/new
  def new
    @mymail = Mymail.new
  end

  # GET /mymails/1/edit
  def edit
  end

  # POST /mymails
  # POST /mymails.json
  def create
    @mymail = Mymail.new(mymail_params)

    respond_to do |format|
      if @mymail.save
        format.html { redirect_to @mymail, notice: 'Mymail was successfully created.' }
        format.json { render :show, status: :created, location: @mymail }
      else
        format.html { render :new }
        format.json { render json: @mymail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mymails/1
  # PATCH/PUT /mymails/1.json
  def update
    respond_to do |format|
      if @mymail.update(mymail_params)
        format.html { redirect_to @mymail, notice: 'Mymail was successfully updated.' }
        format.json { render :show, status: :ok, location: @mymail }
      else
        format.html { render :edit }
        format.json { render json: @mymail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mymails/1
  # DELETE /mymails/1.json
  def destroy
    @mymail.destroy
    respond_to do |format|
      format.html { redirect_to mymails_url, notice: 'Mymail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mymail
      @mymail = Mymail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mymail_params
      params.require(:mymail).permit(:email, :expired)
    end
end
