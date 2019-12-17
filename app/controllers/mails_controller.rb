class MailsController < ApplicationController
  before_action :set_mail, only: [:show, :edit, :update, :destroy]
  before_action :create_mail, only: [:solicita_teste]

  # GET /mails
  # GET /mails.json
  def index
    @mails = Mail.all
  end

  # GET /mails/1
  # GET /mails/1.json
  def show
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

    m = Mail.new(email: @g['email_addr'], expired: 6.hours.from_now)
    m.save
  end

 def check()
    inbox = nil
    lista = GuerrillaMail.new(Mail.last.email)
    puts("Ultimo gravado")
    puts(Mail.last.email)



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
    LinkUrl.delete_all
    l = LinkUrl.new(url: link)
    l.save

  end


  # GET /mails/new
  def new
    @mail = Mail.new
  end

  # GET /mails/1/edit
  def edit
  end

  # POST /mails
  # POST /mails.json
  def create
    @mail = Mail.new(mail_params)

    respond_to do |format|
      if @mail.save
        format.html { redirect_to @mail, notice: 'Mail was successfully created.' }
        format.json { render :show, status: :created, location: @mail }
      else
        format.html { render :new }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mails/1
  # PATCH/PUT /mails/1.json
  def update
    respond_to do |format|
      if @mail.update(mail_params)
        format.html { redirect_to @mail, notice: 'Mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail }
      else
        format.html { render :edit }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mails/1
  # DELETE /mails/1.json
  def destroy
    @mail.destroy
    respond_to do |format|
      format.html { redirect_to mails_url, notice: 'Mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail
      @mail = Mail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_params
      params.require(:mail).permit(:email, :expired)
    end
end
